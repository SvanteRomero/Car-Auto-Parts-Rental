<?php
// Use absolute path resolution
$root_path = dirname(__DIR__);
require_once $root_path . '/includes/functions.php';

requireAdmin();

$page_title = 'Order Details';

$database = new Database();
$db = $database->getConnection();

$order_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if (!$order_id) {
    header('Location: orders.php');
    exit();
}

// Get order details
$query = "SELECT o.*, u.full_name, u.email, u.phone as user_phone, u.address as user_address
          FROM orders o 
          JOIN users u ON o.user_id = u.id 
          WHERE o.id = ?";
$stmt = $db->prepare($query);
$stmt->execute([$order_id]);
$order = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    header('Location: orders.php');
    exit();
}

// Get order items
$items_query = "SELECT oi.*, p.name, p.part_number, p.image_url
                FROM order_items oi 
                JOIN products p ON oi.product_id = p.id 
                WHERE oi.order_id = ?";
$items_stmt = $db->prepare($items_query);
$items_stmt->execute([$order_id]);
$order_items = $items_stmt->fetchAll(PDO::FETCH_ASSOC);

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
            <a href="orders.php" style="color: #007bff; text-decoration: none;">
                <i class="fas fa-arrow-left"></i> Back to Orders
            </a>
        </div>
        
        <h1>Order Details #<?php echo $order['id']; ?></h1>
        
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-bottom: 2rem;">
            <!-- Order Information -->
            <div style="background: white; border-radius: 10px; padding: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                <h3 style="margin-bottom: 1.5rem;">Order Information</h3>
                <div style="margin-bottom: 1rem;">
                    <strong>Order ID:</strong> #<?php echo $order['id']; ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Order Date:</strong> <?php echo date('M j, Y g:i A', strtotime($order['created_at'])); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Status:</strong> 
                    <span style="background: <?php 
                        echo $order['status'] === 'pending' ? '#ffc107' : 
                            ($order['status'] === 'delivered' ? '#28a745' : 
                            ($order['status'] === 'cancelled' ? '#dc3545' : '#007bff')); 
                    ?>; color: white; padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.9rem;">
                        <?php echo ucfirst($order['status']); ?>
                    </span>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Total Amount:</strong> <?php echo formatPrice($order['total_amount']); ?>
                </div>
            </div>
            
            <!-- Customer Information -->
            <div style="background: white; border-radius: 10px; padding: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                <h3 style="margin-bottom: 1.5rem;">Customer Information</h3>
                <div style="margin-bottom: 1rem;">
                    <strong>Name:</strong> <?php echo htmlspecialchars($order['full_name']); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Email:</strong> <?php echo htmlspecialchars($order['email']); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Phone:</strong> <?php echo htmlspecialchars($order['phone']); ?>
                </div>
                <div style="margin-bottom: 1rem;">
                    <strong>Shipping Address:</strong><br>
                    <?php echo nl2br(htmlspecialchars($order['shipping_address'])); ?>
                </div>
            </div>
        </div>
        
        <!-- Order Items -->
        <div style="background: white; border-radius: 10px; padding: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h3 style="margin-bottom: 1.5rem;">Order Items</h3>
            <div class="data-table">
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Part Number</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($order_items as $item): ?>
                            <tr>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 1rem;">
                                        <div style="width: 50px; height: 50px; background: #f8f9fa; border-radius: 5px; display: flex; align-items: center; justify-content: center;">
                                            <?php if ($item['image_url']): ?>
                                                <img src="<?php echo htmlspecialchars($item['image_url']); ?>" 
                                                     alt="<?php echo htmlspecialchars($item['name']); ?>"
                                                     style="max-width: 100%; max-height: 100%; border-radius: 3px;">
                                            <?php else: ?>
                                                <i class="fas fa-cog"></i>
                                            <?php endif; ?>
                                        </div>
                                        <div>
                                            <strong><?php echo htmlspecialchars($item['name']); ?></strong>
                                        </div>
                                    </div>
                                </td>
                                <td><?php echo htmlspecialchars($item['part_number']); ?></td>
                                <td><?php echo formatPrice($item['price']); ?></td>
                                <td><?php echo $item['quantity']; ?></td>
                                <td><?php echo formatPrice($item['price'] * $item['quantity']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr style="background: #f8f9fa;">
                            <td colspan="4"><strong>Total:</strong></td>
                            <td><strong><?php echo formatPrice($order['total_amount']); ?></strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</main>

<?php include '../includes/footer.php'; ?>
