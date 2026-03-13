<?php


ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=utf-8');

include __DIR__ . "/../../php/config/db.php";

$mysqli  = null;
$products   = [];
$success = false;
$error   = null;

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        http_response_code(405);
        throw new Exception('Método no permitido. Usa GET.');
    }

    $mysqli = openConnection();
    if (!$mysqli) {
        throw new Exception('No se pudo conectar a la base de datos.');
    }

    $sqlProducts = 'SELECT * FROM products as t  ORDER BY t.created_at DESC';

    $stmt = $mysqli->prepare($sqlProducts);
    if (!$stmt) {
        throw new Exception('Error al preparar la consulta: ' . $mysqli->error);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    if (!$result) {
        throw new Exception('Error al ejecutar la consulta: ' . $mysqli->error);
    }

    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }

    $stmt->close();
    $success = true;

} catch (Exception $e) {
    $error = $e->getMessage();
    http_response_code(500);
} finally {
    if (isset($result) && $result instanceof mysqli_result) {
        $result->free();
    }
    if ($mysqli) {
        closeConnection($mysqli);
    }
}

echo json_encode(
    [
        "success" => $success,
        "count"   => count($products),
        "error"   => $success ? null : $error,
        "data"    => $products,
    ],
    JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK
);
