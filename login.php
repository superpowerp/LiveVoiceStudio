<?php
/**
 * User Login Page
 */

require_once __DIR__ . '/config/config.php';

?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - <?php echo APP_NAME; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/login.css">
</head>
<body class="bg-dark">
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6 col-lg-4">
                <div class="card bg-secondary border-0 shadow-lg">
                    <div class="card-body p-5">
                        <h1 class="text-center text-white mb-4"><?php echo APP_NAME; ?></h1>
                        
                        <form method="POST" action="/api/auth/login.php">
                            <div class="mb-3">
                                <label for="username" class="form-label text-white">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label text-white">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="remember" name="remember">
                                <label class="form-check-label text-white" for="remember">
                                    Remember me
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100">
                                Login
                            </button>
                        </form>
                        
                        <hr class="bg-white">
                        
                        <p class="text-center text-white">
                            Default: <br>
                            Username: <code>admin</code><br>
                            Password: <code>admin123</code>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
