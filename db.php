<?php
// db.php - Database Connection File

$host = 'localhost';
$dbname = 'pc_inventory_db'; // El nombre que pusimos en el script SQL
$username = 'root';          // Usuario por defecto de XAMPP
$password = '';              // En XAMPP, la contraseña por defecto suele estar vacía

try {
    // Creamos la conexión usando PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);

    // Configuración de errores: Lanzar excepciones si algo falla (Best Practice)
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Opcional: Descomentar para probar si conecta (luego vuélvelo a comentar)
    // echo "Conexión exitosa a la base de datos";

} catch (PDOException $e) {
    // Si falla, paramos todo y mostramos el error
    die("Connection failed: " . $e->getMessage());
}
?>