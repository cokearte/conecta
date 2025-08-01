<?php
// /index.php (Página de Login)
session_start();

// Si ya hay una sesión activa, redirige al dashboard correspondiente
if (isset($_SESSION['rol'])) {
    header('Location: ' . $_SESSION['rol'] . '/');
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - CONECTA</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="login-body">

    <main class="login-container">
        <div class="login-card">
            <header class="login-header">
                <a href="#" class="logo">
                    <img src="assets/images/icon.svg" alt="Conecta Logo">
                    <span>CONECTA</span>
                </a>
                <p>Bienvenido de vuelta. Ingresa tus credenciales.</p>
            </header>

            <form id="loginForm" novalidate>
                <div class="form-group">
                    <label for="email">Correo Electrónico</label>
                    <input type="text" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn-submit">Iniciar Sesión</button>
            </form>

            <div id="login-alert" class="alert-error d-none"></div>
            
            <footer class="login-footer-link">
                <a href="#">¿Olvidaste tu contraseña?</a>
            </footer>
        </div>
    </main>

    <script src="assets/js/login.js"></script>
</body>
</html>