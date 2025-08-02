<?php
// Use absolute path resolution
$root_path = dirname(__DIR__);
require_once $root_path . '/includes/functions.php';

requireAdmin();

$page_title = 'Manage Products';

$database = new Database();
$db = $database->getConnection();

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];
    
    if ($action === 'add' || $action === 'edit') {
        $part_number = sanitize_input($_POST['part_number']);
        $name = sanitize_input($_POST['name']);
        $description = sanitize_input($_POST['description']);
        $category_id = (int)$_POST['category_id'];
        $price = (float)$_POST['price'];
        $stock_quantity = (int)$_POST['stock_quantity'];
        $is_featured = isset($_POST['is_featured']) ? 1 : 0;
        
        if ($action === 'add') {
            $query = "INSERT INTO products (part_number, name, description, category_id, price, stock_quantity, is_featured) 
                      VALUES (?, ?, ?, ?, ?, ?, ?)";
            $stmt = $db->prepare($query);
            $stmt->execute([$part_number, $name, $description, $category_id, $price, $stock_quantity, $is_featured]);
            $success_message = "Product added successfully!";
        } else {
            $product_id = (int)$_POST['product_id'];
            $query = "UPDATE products SET part_number = ?, name = ?, description = ?, category_id = ?, 
                      price = ?, stock_quantity = ?, is_featured = ? WHERE id = ?";
            $stmt = $db->prepare($query);
            $stmt->execute([$part_number, $name, $description, $category_id, $price, $stock_quantity, $is_featured, $product_id]);
            $success_message = "Product updated successfully!";
        }
    }
}

// Handle delete
if (isset($_GET['delete'])) {
    $product_id = (int)$_GET['delete'];
    $query = "DELETE FROM products WHERE id = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$product_id]);
    $success_message = "Product deleted successfully!";
}

// Get products
$query = "SELECT p.*, c.name as category_name FROM products p 
          LEFT JOIN categories c ON p.category_id = c.id 
          ORDER BY p.created_at DESC";
$stmt = $db->prepare($query);
$stmt->execute();
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Get categories for form
$cat_query = "SELECT * FROM categories ORDER BY name";
$cat_stmt = $db->prepare($cat_query);
$cat_stmt->execute();
$categories = $cat_stmt->fetchAll(PDO::FETCH_ASSOC);

// Get product for editing
$edit_product = null;
if (isset($_GET['edit'])) {
    $edit_id = (int)$_GET['edit'];
    $edit_query = "SELECT * FROM products WHERE id = ?";
    $edit_stmt = $db->prepare($edit_query);
    $edit_stmt->execute([$edit_id]);
    $edit_product = $edit_stmt->fetch(PDO::FETCH_ASSOC);
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
            <h1>Manage Products</h1>
            <button onclick="document.getElementById('productModal').style.display='block'" class="btn btn-primary">
                Add New Product
            </button>
        </div>
        
        <?php if (isset($success_message)): ?>
            <div class="alert alert-success"><?php echo $success_message; ?></div>
        <?php endif; ?>
        
        <div class="data-table">
            <table>
                <thead>
                    <tr>
                        <th>Part Number</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Featured</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($products as $product): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($product['part_number']); ?></td>
                            <td><?php echo htmlspecialchars($product['name']); ?></td>
                            <td><?php echo htmlspecialchars($product['category_name']); ?></td>
                            <td><?php echo formatPrice($product['price']); ?></td>
                            <td><?php echo $product['stock_quantity']; ?></td>
                            <td><?php echo $product['is_featured'] ? 'Yes' : 'No'; ?></td>
                            <td class="action-buttons">
                                <a href="?edit=<?php echo $product['id']; ?>" class="btn btn-sm btn-secondary">Edit</a>
                                <a href="?delete=<?php echo $product['id']; ?>" 
                                   onclick="return confirm('Are you sure?')" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</main>

<!-- Product Modal -->
<div id="productModal" style="display: <?php echo $edit_product ? 'block' : 'none'; ?>; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5);">
    <div style="background-color: white; margin: 5% auto; padding: 2rem; width: 80%; max-width: 600px; border-radius: 10px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h3><?php echo $edit_product ? 'Edit Product' : 'Add New Product'; ?></h3>
            <button onclick="document.getElementById('productModal').style.display='none'" style="background: none; border: none; font-size: 1.5rem; cursor: pointer;">&times;</button>
        </div>
        
        <form method="POST">
            <input type="hidden" name="action" value="<?php echo $edit_product ? 'edit' : 'add'; ?>">
            <?php if ($edit_product): ?>
                <input type="hidden" name="product_id" value="<?php echo $edit_product['id']; ?>">
            <?php endif; ?>
            
            <div class="form-group">
                <label>Part Number</label>
                <input type="text" name="part_number" class="form-control" 
                       value="<?php echo $edit_product ? htmlspecialchars($edit_product['part_number']) : ''; ?>" required>
            </div>
            
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control" 
                       value="<?php echo $edit_product ? htmlspecialchars($edit_product['name']) : ''; ?>" required>
            </div>
            
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="3"><?php echo $edit_product ? htmlspecialchars($edit_product['description']) : ''; ?></textarea>
            </div>
            
            <div class="form-group">
                <label>Category</label>
                <select name="category_id" class="form-control" required>
                    <option value="">Select Category</option>
                    <?php foreach ($categories as $category): ?>
                        <option value="<?php echo $category['id']; ?>" 
                                <?php echo ($edit_product && $edit_product['category_id'] == $category['id']) ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($category['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                <div class="form-group">
                    <label>Price (TSh)</label>
                    <input type="number" name="price" class="form-control" step="0.01" 
                           value="<?php echo $edit_product ? $edit_product['price'] : ''; ?>" required>
                </div>
                
                <div class="form-group">
                    <label>Stock Quantity</label>
                    <input type="number" name="stock_quantity" class="form-control" 
                           value="<?php echo $edit_product ? $edit_product['stock_quantity'] : ''; ?>" required>
                </div>
            </div>
            
            <div class="form-group">
                <label>
                    <input type="checkbox" name="is_featured" 
                           <?php echo ($edit_product && $edit_product['is_featured']) ? 'checked' : ''; ?>>
                    Featured Product
                </label>
            </div>
            
            <div style="text-align: right;">
                <button type="button" onclick="document.getElementById('productModal').style.display='none'" class="btn btn-secondary">Cancel</button>
                <button type="submit" class="btn btn-primary"><?php echo $edit_product ? 'Update' : 'Add'; ?> Product</button>
            </div>
        </form>
    </div>
</div>

<?php if ($edit_product): ?>
<script>
document.getElementById('productModal').style.display = 'block';
</script>
<?php endif; ?>

<?php include '../includes/footer.php'; ?>
