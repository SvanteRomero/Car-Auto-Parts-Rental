<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($page_title) ? $page_title . ' - ' : ''; ?>AutoParts Tanzania</title>
    <?php 
    // Determine the correct path to assets based on current directory
    $assets_path = '';
    if (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) {
        $assets_path = '../assets/';
    } else {
        $assets_path = 'assets/';
    }
    ?>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo $assets_path; ?>/css/styles2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="nav-brand">
                <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../index.php' : 'index.php'; ?>">
                    <div class="brand-icon">
                        <i class="fas fa-car-side"></i>
                    </div>
                    <div class="brand-text">
                        <div class="brand-name">AutoParts TZ</div>
                        <div class="brand-tagline">Premium Auto Parts</div>
                    </div>
                </a>
            </div>
            
            <nav class="nav-menu">
                <ul>
                    <?php if (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false): ?>
                        <!-- Admin navigation -->
                        <li><a href="../index.php"><i class="fas fa-home"></i> Main Site</a></li>
                        <li><a href="dashboard.php"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                        <li><a href="products.php"><i class="fas fa-cogs"></i> Products</a></li>
                        <li><a href="categories.php"><i class="fas fa-tags"></i> Categories</a></li>
                        <li><a href="orders.php"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                        <li><a href="users.php"><i class="fas fa-users"></i> Users</a></li>
                    <?php else: ?>
                        <!-- Main site navigation -->
                        <li><a href="index.php" class="<?php echo basename($_SERVER['PHP_SELF']) == 'index.php' ? 'active' : ''; ?>">
                            <i class="fas fa-home"></i> Home
                        </a></li>
                        <li><a href="products.php" class="<?php echo basename($_SERVER['PHP_SELF']) == 'products.php' ? 'active' : ''; ?>">
                            <i class="fas fa-cogs"></i> Products
                        </a></li>
                        <li><a href="new_arrivals.php" class="<?php echo basename($_SERVER['PHP_SELF']) == 'new_arrivals.php' ? 'active' : ''; ?>">
                            <i class="fas fa-star"></i> New Arrivals
                        </a></li>
                        <li><a href="parts_catalog.php" class="<?php echo basename($_SERVER['PHP_SELF']) == 'parts_catalog.php' ? 'active' : ''; ?>">
                            <i class="fas fa-book"></i> Full Catalog
                        </a></li>
                        <li><a href="categories.php" class="<?php echo basename($_SERVER['PHP_SELF']) == 'categories.php' ? 'active' : ''; ?>">
                            <i class="fas fa-th-large"></i> Categories
                        </a></li>
                        <?php if (isLoggedIn()): ?>
                            <li><a href="my_orders.php" class="<?php echo basename($_SERVER['PHP_SELF']) == 'my_orders.php' ? 'active' : ''; ?>">
                                <i class="fas fa-receipt"></i> My Orders
                            </a></li>
                        <?php endif; ?>
                    <?php endif; ?>
                </ul>
            </nav>
            
            <div class="nav-actions">
                <?php if (strpos($_SERVER['SCRIPT_NAME'], '/admin/') === false): ?>
                    <a href="cart.php" class="cart-link">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count"><?php echo getCartItemCount(); ?></span>
                    </a>
                <?php endif; ?>
                
                <?php if (isLoggedIn()): ?>
                    <div class="user-menu">
                        <div class="user-dropdown">
                            <button class="user-dropdown-toggle">
                                <i class="fas fa-user-circle"></i> 
                                <?php echo htmlspecialchars($_SESSION['username']); ?>
                                <i class="fas fa-chevron-down"></i>
                            </button>
                            <div class="user-dropdown-menu">
                                <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../account.php' : 'account.php'; ?>">
                                    <i class="fas fa-user"></i> My Account
                                </a>
                                <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../my_orders.php' : 'my_orders.php'; ?>">
                                    <i class="fas fa-receipt"></i> My Orders
                                </a>
                                <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../edit_profile.php' : 'edit_profile.php'; ?>">
                                    <i class="fas fa-edit"></i> Edit Profile
                                </a>
                                <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../change_password.php' : 'change_password.php'; ?>">
                                    <i class="fas fa-key"></i> Change Password
                                </a>
                                <?php if (isAdmin() && strpos($_SERVER['SCRIPT_NAME'], '/admin/') === false): ?>
                                    <div class="dropdown-divider"></div>
                                    <a href="admin/dashboard.php">
                                        <i class="fas fa-cog"></i> Admin Panel
                                    </a>
                                <?php endif; ?>
                                <div class="dropdown-divider"></div>
                                <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../logout.php' : 'logout.php'; ?>">
                                    <i class="fas fa-sign-out-alt"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>
                <?php else: ?>
                    <div class="auth-buttons">
                        <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../login.php' : 'login.php'; ?>" class="btn btn-outline btn-sm">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </a>
                        <a href="<?php echo (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../register.php' : 'register.php'; ?>" class="btn btn-primary btn-sm">
                            <i class="fas fa-user-plus"></i> Register
                        </a>
                    </div>
                <?php endif; ?>
                
                <button class="mobile-menu-toggle">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>
    </header>
