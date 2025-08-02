<?php
// Use absolute path resolution
$root_path = dirname(__DIR__);
require_once $root_path . '/includes/functions.php';

requireAdmin();

$page_title = 'Manage Categories';

$database = new Database();
$db = $database->getConnection();

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];
    
    if ($action === 'add' || $action === 'edit') {
        $name = sanitize_input($_POST['name']);
        $description = sanitize_input($_POST['description']);
        
        if ($action === 'add') {
            $query = "INSERT INTO categories (name, description) VALUES (?, ?)";
            $stmt = $db->prepare($query);
            $stmt->execute([$name, $description]);
            $success_message = "Category added successfully!";
        } else {
            $category_id = (int)$_POST['category_id'];
            $query = "UPDATE categories SET name = ?, description = ? WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$name, $description, $category_id]);
            $success_message = "Category updated successfully!";
        }
    }
}

// Handle delete
if (isset($_GET['delete'])) {
    $category_id = (int)$_GET['delete'];
    
    // Check if category has products
    $check_query = "SELECT COUNT(*) FROM products WHERE category_id = ?";
    $check_stmt = $db->prepare($check_query);
    $check_stmt->execute([$category_id]);
    $product_count = $check_stmt->fetchColumn();
    
    if ($product_count > 0) {
        $error_message = "Cannot delete category. It has $product_count products assigned to it.";
    } else {
        $query = "DELETE FROM categories WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$category_id]);
        $success_message = "Category deleted successfully!";
    }
}

// Get categories with product count
$query = "SELECT c.*, COUNT(p.id) as product_count 
          FROM categories c 
          LEFT JOIN products p ON c.id = p.category_id 
          GROUP BY c.id 
          ORDER BY c.name";
$stmt = $db->prepare($query);
$stmt->execute();
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Get category for editing
$edit_category = null;
if (isset($_GET['edit'])) {
    $edit_id = (int)$_GET['edit'];
    $edit_query = "SELECT * FROM categories WHERE id = ?";
    $edit_stmt = $db->prepare($edit_query);
    $edit_stmt->execute([$edit_id]);
    $edit_category = $edit_stmt->fetch(PDO::FETCH_ASSOC);
}

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
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1>Manage Categories</h1>
            <button onclick="document.getElementById('categoryModal').style.display='block'" class="btn btn-primary">
                Add New Category
            </button>
        </div>
        
        <?php if (isset($success_message)): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error_message)): ?>
            <div class="alert alert-danger"><?php echo $error_message; ?></div>
        <?php endif; ?>
        
        <div class="data-table">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Products</th>
                        <th>Created</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($categories as $category): ?>
                        <tr>
                            <td><strong><?php echo htmlspecialchars($category['name']); ?></strong></td>
                            <td><?php echo htmlspecialchars($category['description']); ?></td>
                            <td>
                                <span style="background: #007bff; color: white; padding: 0.25rem 0.5rem; border-radius: 3px; font-size: 0.8rem;">
                                    <?php echo $category['product_count']; ?> products
                                </span>
                            </td>
                            <td><?php echo date('M j, Y', strtotime($category['created_at'])); ?></td>
                            <td class="action-buttons">
                                <a href="?edit=<?php echo $category['id']; ?>" class="btn btn-sm btn-secondary">Edit</a>
                                <?php if ($category['product_count'] == 0): ?>
                                    <a href="?delete=<?php echo $category['id']; ?>" 
                                       onclick="return confirm('Are you sure you want to delete this category?')" 
                                       class="btn btn-sm btn-danger">Delete</a>
                                <?php else: ?>
                                    <span class="btn btn-sm btn-secondary" style="opacity: 0.5; cursor: not-allowed;" 
                                          title="Cannot delete category with products">Delete</span>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</main>

<!-- Category Modal -->
<div id="categoryModal" style="display: <?php echo $edit_category ? 'block' : 'none'; ?>; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5);">
    <div style="background-color: white; margin: 10% auto; padding: 2rem; width: 80%; max-width: 500px; border-radius: 10px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h3><?php echo $edit_category ? 'Edit Category' : 'Add New Category'; ?></h3>
            <button onclick="document.getElementById('categoryModal').style.display='none'" style="background: none; border: none; font-size: 1.5rem; cursor: pointer;">&times;</button>
        </div>
        
        <form method="POST">
            <input type="hidden" name="action" value="<?php echo $edit_category ? 'edit' : 'add'; ?>">
            <?php if ($edit_category): ?>
                <input type="hidden" name="category_id" value="<?php echo $edit_category['id']; ?>">
            <?php endif; ?>
            
            <div class="form-group">
                <label>Category Name</label>
                <input type="text" name="name" class="form-control" 
                       value="<?php echo $edit_category ? htmlspecialchars($edit_category['name']) : ''; ?>" required>
            </div>
            
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="3"><?php echo $edit_category ? htmlspecialchars($edit_category['description']) : ''; ?></textarea>
            </div>
            
            <div style="text-align: right;">
                <button type="button" onclick="document.getElementById('categoryModal').style.display='none'" class="btn btn-secondary">Cancel</button>
                <button type="submit" class="btn btn-primary"><?php echo $edit_category ? 'Update' : 'Add'; ?> Category</button>
            </div>
        </form>
    </div>
</div>

<?php if ($edit_category): ?>
<script>
document.getElementById('categoryModal').style.display = 'block';
</script>
<?php endif; ?>

<?php include '../includes/footer.php'; ?>
