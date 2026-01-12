<?php
// 1. Incluimos la conexión a la base de datos
require 'db.php';

// --- LOGICA DE POST (CREAR PRODUCTO) ---
// Si el servidor detecta que ha llegado un formulario (método POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recogemos los datos del formulario
    $name = $_POST['name'];
    $price = $_POST['price'];
    $stock = $_POST['stock'];
    $category_id = $_POST['category_id'];
    $supplier_id = $_POST['supplier_id'];

    // PREPARED STATEMENT (Muy importante para seguridad)
    // Esto evita Inyecciones SQL. A los alemanes les encanta la seguridad.
    $insertSql = "INSERT INTO products (name, price, stock_quantity, category_id, supplier_id) 
                  VALUES (:name, :price, :stock, :category_id, :supplier_id)";

    $stmt = $pdo->prepare($insertSql);
    $stmt->execute([
        ':name' => $name,
        ':price' => $price,
        ':stock' => $stock,
        ':category_id' => $category_id,
        ':supplier_id' => $supplier_id
    ]);

    // Recargamos la página para limpiar el formulario y ver el nuevo producto
    header("Location: index.php");
    exit;
}

// --- LOGICA DE GET (LEER PRODUCTOS) ---
// Consulta para llenar la tabla
$sql = "SELECT p.id, p.name, p.price, p.stock_quantity, c.name as category_name, s.company_name 
        FROM products p 
        LEFT JOIN categories c ON p.category_id = c.id
        LEFT JOIN suppliers s ON p.supplier_id = s.id
        ORDER BY p.id DESC"; // Ordenamos por ID descendente para ver el último añadido arriba

$stmt = $pdo->query($sql);
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Consultas extra para llenar los desplegables (Selects) del formulario
$categories = $pdo->query("SELECT * FROM categories")->fetchAll(PDO::FETCH_ASSOC);
$suppliers = $pdo->query("SELECT * FROM suppliers")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Inventario Dubaro - Gestión</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
        }

        h1 {
            color: #333;
        }

        /* Estilos del Formulario */
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #218838;
        }

        /* Estilos de la Tabla */
        table {
            border-collapse: collapse;
            width: 100%;
            background: white;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>

<body>

    <h1>📦 Sistema de Gestión de Inventario</h1>

    <div class="form-container">
        <h3>Añadir Nuevo Componente</h3>
        <form action="index.php" method="POST">
            <div class="form-group">
                <label>Nombre del Componente:</label>
                <input type="text" name="name" required placeholder="Ej: Kingston Fury Beast 16GB">
            </div>

            <div class="form-group">
                <label>Precio (€):</label>
                <input type="number" step="0.01" name="price" required placeholder="0.00">
            </div>

            <div class="form-group">
                <label>Stock Inicial:</label>
                <input type="number" name="stock" required placeholder="0">
            </div>

            <div class="form-group">
                <label>Categoría:</label>
                <select name="category_id">
                    <?php foreach ($categories as $cat): ?>
                        <option value="<?php echo $cat['id']; ?>"><?php echo $cat['name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label>Proveedor:</label>
                <select name="supplier_id">
                    <?php foreach ($suppliers as $sup): ?>
                        <option value="<?php echo $sup['id']; ?>"><?php echo $sup['company_name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <button type="submit">➕ Añadir al Inventario</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Componente</th>
                <th>Categoría</th>
                <th>Proveedor</th>
                <th>Precio</th>
                <th>Stock</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $product): ?>
                <tr>
                    <td><?php echo $product['id']; ?></td>
                    <td><?php echo htmlspecialchars($product['name']); ?></td>
                    <td><?php echo htmlspecialchars($product['category_name']); ?></td>
                    <td><?php echo htmlspecialchars($product['company_name']); ?></td>
                    <td><?php echo number_format($product['price'], 2); ?> €</td>
                    <td style="font-weight: bold; color: <?php echo $product['stock_quantity'] < 5 ? 'red' : 'green'; ?>">
                        <?php echo $product['stock_quantity']; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

</body>

</html>