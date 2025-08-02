<?php
// Use absolute path resolution
$root_path = dirname(__DIR__);
require_once $root_path . '/includes/functions.php';

requireAdmin();

$page_title = 'Admin Dashboard';

$database = new Database();
$db = $database->getConnection();

// Get statistics
$stats = [];

// Total products
$query = "SELECT COUNT(*) FROM products";
$stmt = $db->prepare($query);
$stmt->execute();
$stats['products'] = $stmt->fetchColumn();

// Total orders
$query = "SELECT COUNT(*) FROM orders";
$stmt = $db->prepare($query);
$stmt->execute();
$stats['orders'] = $stmt->fetchColumn();

// Total users
$query = "SELECT COUNT(*) FROM users WHERE role = 'customer'";
$stmt = $db->prepare($query);
$stmt->execute();
$stats['users'] = $stmt->fetchColumn();

// Total revenue
$query = "SELECT SUM(total_amount) FROM orders WHERE status != 'cancelled'";
$stmt = $db->prepare($query);
$stmt->execute();
$stats['revenue'] = $stmt->fetchColumn() ?: 0;

// Recent orders
$query = "SELECT o.*, u.full_name FROM orders o 
          JOIN users u ON o.user_id = u.id 
          ORDER BY o.created_at DESC LIMIT 10";
$stmt = $db->prepare($query);
$stmt->execute();
$recent_orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

include '../includes/header.php';
?>

<nav class="admin-nav">
    <div class="container">
        <ul>
            <li><a href="dashboard.php">Dashboard</a></li>
            <li><a href="products.php">Products</a></li>
            <li><a href="categories.php">Categories</a></li>
            <li><a href="orders.php">Orders</a></li>
            <li><a href="users.php">Users</a></li>
        </ul>
    </div>
</nav>

<main class="admin-content">
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number"><?php echo number_format($stats['products']); ?></div>
                <div class="stat-label">Total Products</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-number"><?php echo number_format($stats['orders']); ?></div>
                <div class="stat-label">Total Orders</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-number"><?php echo number_format($stats['users']); ?></div>
                <div class="stat-label">Total Customers</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-number"><?php echo formatPrice($stats['revenue']); ?></div>
                <div class="stat-label">Total Revenue</div>
            </div>
        </div>
        
        <!-- Recent Orders -->
        <div class="data-table">
            <h3 style="padding: 1rem; margin: 0; background: #f8f9fa; border-bottom: 1px solid #ddd;">Recent Orders</h3>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($recent_orders)): ?>
                        <tr>
                            <td colspan="6" style="text-align: center; color: #6c757d;">No orders found</td>
                        </tr>
                    <?php else: ?>
                        <?php foreach ($recent_orders as $order): ?>
                            <tr>
                                <td>#<?php echo $order['id']; ?></td>
                                <td><?php echo htmlspecialchars($order['full_name']); ?></td>
                                <td><?php echo formatPrice($order['total_amount']); ?></td>
                                <td>
                                    <span style="background: <?php 
                                        echo $order['status'] === 'pending' ? '#ffc107' : 
                                            ($order['status'] === 'delivered' ? '#28a745' : '#007bff'); 
                                    ?>; color: white; padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.8rem;">
                                        <?php echo ucfirst($order['status']); ?>
                                    </span>
                                </td>
                                <td><?php echo date('M j, Y', strtotime($order['created_at'])); ?></td>
                                <td>
                                    <a href="order_details.php?id=<?php echo $order['id']; ?>" class="btn btn-sm btn-primary">View</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</main>

<?php include '../includes/footer.php'; ?>
