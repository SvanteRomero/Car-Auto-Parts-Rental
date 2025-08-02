<?php
// Use absolute path resolution
$root_path = dirname(__DIR__);
require_once $root_path . '/includes/functions.php';

requireAdmin();

$page_title = 'User Details';

$database = new Database();
$db = $database->getConnection();

$user_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if (!$user_id) {
    header('Location: users.php');
    exit();
}

// Get user details
$query = "SELECT * FROM users WHERE id = ?";
$stmt = $db->prepare($query);
$stmt->execute([$user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    header('Location: users.php');
    exit();
}

// Get user orders
$orders_query = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";
$orders_stmt = $db->prepare($orders_query);
$orders_stmt->execute([$user_id]);
$orders = $orders_stmt->fetchAll(PDO::FETCH_ASSOC);

// Get user statistics
$stats_query = "SELECT 
                    COUNT(*) as total_orders,
                    COALESCE(SUM(total_amount), 0) as total_spent,
                    AVG(total_amount) as avg_order_value
                FROM orders WHERE user_id = ?";
$stats_stmt = $db->prepare($stats_query);
$stats_stmt->execute([$user_id]);
$stats = $stats_stmt->fetch(PDO::FETCH_ASSOC);

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
        <div style="margin-bottom: 2rem;">
            <a href="users.php" style="color: #007bff; text-decoration: none;">
                <i class="fas fa-arrow-left"></i> Back to Users
            </a>
        </div>
        
        <h1>User Details: <?php echo htmlspecialchars($user['full_name']); ?></h1>
        
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-bottom: 2rem;">
            <!-- User Information -->
            <div style="background: white; border-radius: 10px; padding: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                <h3 style="margin-bottom: 1.5rem;">User Information</h3>
                <div style="margin-bottom: 1rem;">
                    <strong>Full Name:</strong> <?php echo htmlspecialchars($user['full_name']); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Username:</strong> <?php echo htmlspecialchars($user['username']); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Phone:</strong> <?php echo htmlspecialchars($user['phone'] ?: 'Not provided'); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Role:</strong> 
                    <span style="background: <?php echo $user['role'] === 'admin' ? '#007bff' : '#28a745'; ?>; color: white; padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.9rem;">
                        <?php echo ucfirst($user['role']); ?>
                    </span>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Joined:</strong> <?php echo date('M j, Y g:i A', strtotime($user['created_at'])); ?>
                </div>
                <?php if ($user['address']): ?>
                    <div style="margin-bottom: 1rem;">
                        <strong>Address:</strong><br>
                        <?php echo nl2br(htmlspecialchars($user['address'])); ?>
                    </div>
                <?php endif; ?>
            </div>
            
            <!-- User Statistics -->
            <div style="background: white; border-radius: 10px; padding: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                <h3 style="margin-bottom: 1.5rem;">Order Statistics</h3>
                <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                    <div style="background: #f8f9fa; padding: 1rem; border-radius: 5px; text-align: center;">
                        <div style="font-size: 2rem; font-weight: bold; color: #007bff;"><?php echo $stats['total_orders']; ?></div>
                        <div style="color: #6c757d;">Total Orders</div>
                    </div>
                    <div style="background: #f8f9fa; padding: 1rem; border-radius: 5px; text-align: center;">
                        <div style="font-size: 1.5rem; font-weight: bold; color: #28a745;"><?php echo formatPrice($stats['total_spent']); ?></div>
                        <div style="color: #6c757d;">Total Spent</div>
                    </div>
                    <div style="background: #f8f9fa; padding: 1rem; border-radius: 5px; text-align: center;">
                        <div style="font-size: 1.2rem; font-weight: bold; color: #ffc107;"><?php echo formatPrice($stats['avg_order_value']); ?></div>
                        <div style="color: #6c757d;">Average Order Value</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- User Orders -->
        <div style="background: white; border-radius: 10px; padding: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h3 style="margin-bottom: 1.5rem;">Order History</h3>
            <?php if (empty($orders)): ?>
                <p style="text-align: center; color: #6c757d;">No orders found for this user.</p>
            <?php else: ?>
                <div class="data-table">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Order Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($orders as $order): ?>
                                <tr>
                                    <td>#<?php echo $order['id']; ?></td>
                                    <td><?php echo formatPrice($order['total_amount']); ?></td>
                                    <td>
                                        <span style="background: <?php 
                                            echo $order['status'] === 'pending' ? '#ffc107' : 
                                                ($order['status'] === 'delivered' ? '#28a745' : 
                                                ($order['status'] === 'cancelled' ? '#dc3545' : '#007bff')); 
                                        ?>; color: white; padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.8rem;">
                                            <?php echo ucfirst($order['status']); ?>
                                        </span>
                                    </td>
                                    <td><?php echo date('M j, Y g:i A', strtotime($order['created_at'])); ?></td>
                                    <td>
                                        <a href="order_details.php?id=<?php echo $order['id']; ?>" class="btn btn-sm btn-primary">View Details</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </div>
</main>

<?php include '../includes/footer.php'; ?>
