<footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>CarParts TZ</h3>
                    <p>Your trusted partner for quality auto parts in Tanzania. We provide genuine parts for all major car brands.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-whatsapp"></i></a>
                    </div>
                </div>
                
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <?php 
                        $base_path = (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../' : '';
                        ?>
                        <li><a href="<?php echo $base_path; ?>index.php">Home</a></li>
                        <li><a href="<?php echo $base_path; ?>products.php">Products</a></li>
                        <li><a href="<?php echo $base_path; ?>new_arrivals.php">New Arrivals</a></li>
                        <li><a href="<?php echo $base_path; ?>parts_catalog.php">Full Catalog</a></li>
                        <li><a href="<?php echo $base_path; ?>categories.php">Categories</a></li>
                    </ul>
                </div>
                
                <div class="footer-section">
                    <h4>Categories</h4>
                    <ul>
                        <li><a href="<?php echo $base_path; ?>products.php?category=2">Brake System</a></li>
                        <li><a href="<?php echo $base_path; ?>products.php?category=1">Engine Parts</a></li>
                        <li><a href="<?php echo $base_path; ?>products.php?category=4">Electrical</a></li>
                        <li><a href="<?php echo $base_path; ?>products.php?category=5">Filters</a></li>
                    </ul>
                </div>
                
                <div class="footer-section">
                    <h4>Contact Info</h4>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt"></i> Dar es Salaam, Tanzania</p>
                        <p><i class="fas fa-phone"></i> +255 123 456 789</p>
                        <p><i class="fas fa-envelope"></i> info@carparts.co.tz</p>
                    </div>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2024 CarParts Tanzania. All rights reserved.</p>
            </div>
        </div>
    </footer>
    
    <?php 
    $assets_path = (strpos($_SERVER['SCRIPT_NAME'], '/admin/') !== false) ? '../assets/' : 'assets/';
    ?>
    <script src="<?php echo $assets_path; ?>js/script.js"></script>
</body>
</html>
