<?php
// /setup_password.php

// --- INSTRUCCIONES ---
// 1. Escribe la contraseña que deseas usar para todos los usuarios aquí abajo.
// 2. Guarda el archivo.
// 3. Abre este archivo en tu navegador (ej: http://localhost/conecta-taller/setup_password.php).
// 4. Copia el resultado que aparece en pantalla.
// 5. Pégalo en el script SQL del Paso 3.

// Escribe aquí la contraseña que quieres usar (por ejemplo, '123456')
$password_plana = '123456';

// Este código genera el hash seguro
$hash_seguro = password_hash($password_plana, PASSWORD_DEFAULT);

// Muestra el resultado en un formato fácil de copiar
echo "<h1>Hash de Contraseña Generado</h1>";
echo "<p>Copia la siguiente línea completa y pégala en tu script SQL:</p>";
echo "<pre style='background-color:#f0f0f0; padding:15px; border-radius:5px; font-size:16px;'>";
echo htmlspecialchars($hash_seguro);
echo "</pre>";

?>