<?php
session_start();

// Get the correct path to database config based on current directory
$config_path = '';
if (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) {
    // We're in admin folder, go up one level
    $config_path = '../config/database.php';
} else {
    // We're in root folder
    $config_path = 'config/database.php';
}

require_once $config_path;

function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

function isAdmin() {
    return isset($_SESSION['role']) && $_SESSION['role'] === 'admin';
}

function requireLogin() {
    if (!isLoggedIn()) {
        $redirect_url = (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../login.php' : 'login.php';
        header('Location: ' . $redirect_url);
        exit();
    }
}

function requireAdmin() {
    if (!isAdmin()) {
        $redirect_url = (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../index.php' : 'index.php';
        header('Location: ' . $redirect_url);
        exit();
    }
}

function getCartItemCount() {
    return isset($_SESSION['cart']) ? array_sum($_SESSION['cart']) : 0;
}

function addToCart($product_id, $quantity = 1) {
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = array();
    }
    
    if (isset($_SESSION['cart'][$product_id])) {
        $_SESSION['cart'][$product_id] += $quantity;
    } else {
        $_SESSION['cart'][$product_id] = $quantity;
    }
}

function removeFromCart($product_id) {
    if (isset($_SESSION['cart'][$product_id])) {
        unset($_SESSION['cart'][$product_id]);
    }
}

function getCartTotal() {
    if (!isset($_SESSION['cart']) || empty($_SESSION['cart'])) {
        return 0;
    }
    
    $database = new Database();
    $db = $database->getConnection();
    
    $total = 0;
    foreach ($_SESSION['cart'] as $product_id => $quantity) {
        $query = "SELECT price FROM products WHERE id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$product_id]);
        $product = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($product) {
            $total += $product['price'] * $quantity;
        }
    }
    
    return $total;
}

function formatPrice($price) {
    return 'TSh ' . number_format($price, 0, '.', ',');
}
?>
