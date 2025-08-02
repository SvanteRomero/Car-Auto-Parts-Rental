<?php
// Use absolute path resolution
$root_path = dirname(__DIR__);
require_once $root_path . '/includes/functions.php';

requireAdmin();

$page_title = 'Manage Users';

$database = new Database();
$db = $database->getConnection();

// Handle role update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_role'])) {
    $user_id = (int)$_POST['user_id'];
    $new_role = sanitize_input($_POST['role']);
    
    // Don't allow changing own role
    if ($user_id != $_SESSION['user_id']) {
        $query = "UPDATE users SET role = ? WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$new_role, $user_id]);
        $success_message = "User role updated successfully!";
    } else {
        $error_message = "You cannot change your own role!";
    }
}

// Handle user deletion
if (isset($_GET['delete'])) {
    $user_id = (int)$_GET['delete'];
    
    // Don't allow deleting own account
    if ($user_id != $_SESSION['user_id']) {
        // Check if user has orders
        $check_query = "SELECT COUNT(*) FROM orders WHERE user_id = ?";
        $check_stmt = $db->prepare($check_query);
        $check_stmt->execute([$user_id]);
        $order_count = $check_stmt->fetchColumn();
        
        if ($order_count > 0) {
            $error_message = "Cannot delete user. They have $order_count orders in the system.";
        } else {
            $query = "DELETE FROM users WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$user_id]);
            $success_message = "User deleted successfully!";
        }
    } else {
        $error_message = "You cannot delete your own account!";
    }
}

// Get filter parameters
$role_filter = isset($_GET['role']) ? sanitize_input($_GET['role']) : '';
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$per_page = 20;
$offset = ($page - 1) * $per_page;

// Build query
$where_clause = '';
$params = [];

if ($role_filter) {
    $where_clause = "WHERE u.role = ?";
    $params[] = $role_filter;
}

// Get total count
$count_query = "SELECT COUNT(*) FROM users u $where_clause";
$count_stmt = $db->prepare($count_query);
$count_stmt->execute($params);
$total_users = $count_stmt->fetchColumn();
$total_pages = ceil($total_users / $per_page);

// Get users with order count
$query = "SELECT u.*, COUNT(o.id) as order_count, 
                 COALESCE(SUM(o.total_amount), 0) as total_spent
          FROM users u 
          LEFT JOIN orders o ON u.id = o.user_id 
          $where_clause 
          GROUP BY u.id
          ORDER BY u.created_at DESC 
          LIMIT $per_page OFFSET $offset";
$stmt = $db->prepare($query);
$stmt->execute($params);
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

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
        <h1>Manage Users</h1>
        
        <?php if (isset($success_message)): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error_message)): ?>
            <div class="alert alert-danger"><?php echo $error_message; ?></div>
        <?php endif; ?>
        
        <!-- Filters -->
        <div style="background: white; padding: 1.5rem; border-radius: 10px; margin-bottom: 2rem; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <form method="GET" style="display: flex; gap: 1rem; align-items: end;">
                <div class="form-group" style="margin-bottom: 0;">
                    <label>Filter by Role</label>
                    <select name="role" class="form-control">
                        <option value="">All Roles</option>
                        <option value="customer" <?php echo $role_filter === 'customer' ? 'selected' : ''; ?>>Customer</option>
                        <option value="admin" <?php echo $role_filter === 'admin' ? 'selected' : ''; ?>>Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Filter</button>
                <a href="users.php" class="btn btn-secondary">Clear</a>
            </form>
        </div>
        
        <!-- Users Table -->
        <div class="data-table">
            <table>
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Orders</th>
                        <th>Total Spent</th>
                        <th>Joined</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($users as $user): ?>
                        <tr>
                            <td>
                                <strong><?php echo htmlspecialchars($user['full_name']); ?></strong><br>
                                <small>@<?php echo htmlspecialchars($user['username']); ?></small>
                            </td>
                            <td><?php echo htmlspecialchars($user['email']); ?></td>
                            <td>
                                <?php if ($user['id'] != $_SESSION['user_id']): ?>
                                    <form method="POST" style="display: inline;">
                                        <input type="hidden" name="user_id" value="<?php echo $user['id']; ?>">
                                        <select name="role" onchange="this.form.submit()" style="padding: 0.25rem; border-radius: 3px; border: 1px solid #ddd;">
                                            <option value="customer" <?php echo $user['role'] === 'customer' ? 'selected' : ''; ?>>Customer</option>
                                            <option value="admin" <?php echo $user['role'] === 'admin' ? 'selected' : ''; ?>>Admin</option>
                                        </select>
                                        <input type="hidden" name="update_role" value="1">
                                    </form>
                                <?php else: ?>
                                    <span style="background: #007bff; color: white; padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.8rem;">
                                        <?php echo ucfirst($user['role']); ?> (You)
                                    </span>
                                <?php endif; ?>
                            </td>
                            <td><?php echo $user['order_count']; ?></td>
                            <td><?php echo formatPrice($user['total_spent']); ?></td>
                            <td><?php echo date('M j, Y', strtotime($user['created_at'])); ?></td>
                            <td class="action-buttons">
                                <a href="user_details.php?id=<?php echo $user['id']; ?>" class="btn btn-sm btn-primary">View</a>
                                <?php if ($user['id'] != $_SESSION['user_id'] && $user['order_count'] == 0): ?>
                                    <a href="?delete=<?php echo $user['id']; ?>" 
                                       onclick="return confirm('Are you sure you want to delete this user?')" 
                                       class="btn btn-sm btn-danger">Delete</a>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        
        <!-- Pagination -->
        <?php if ($total_pages > 1): ?>
            <div style="text-align: center; margin-top: 2rem;">
                <?php
                $query_params = $_GET;
                for ($i = 1; $i <= $total_pages; $i++):
                    $query_params['page'] = $i;
                    $url = 'users.php?' . http_build_query($query_params);
                    $active = $i == $page ? 'style="background: #007bff; color: white;"' : '';
                ?>
                    <a href="<?php echo $url; ?>" class="btn btn-secondary" <?php echo $active; ?>>
                        <?php echo $i; ?>
                    </a>
                <?php endfor; ?>
            </div>
        <?php endif; ?>
    </div>
</main>

<?php include '../includes/footer.php'; ?>
