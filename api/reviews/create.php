<?php
/***
 * API Endpoint para guardar los reviews
 */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("../../php/config/db.php");

$mysqli = openConnection();

$errors = [];
$success = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = isset($_POST['nombre']) ? trim((string)$_POST['nombre']) : '';
    $productId = isset($_POST['productId']) ? (int)$_POST['productId'] : 0;
    $customerId = isset($_POST['customerId']) ? (int)$_POST['customerId'] : 0;
    $calificacion = isset($_POST['calificacion']) ? (int)$_POST['calificacion'] : 0;
    $comentario = isset($_POST['comentario']) ? trim((string)$_POST['comentario']) : '';

    // Validaciones
    if ($nombre === '') {
        $errors[] = 'El Nombre es obligatorio';
    }

    if($productId <= 0){
        $errors[] = 'El Producto es incorrecto.';
    }
    if($customerId <= 0){
        $errors[] = 'El ID del usuario no ha sido especificado.';
    }

    if($calificacion <= 0 || $calificacion > 5 ){
        $errors[] = 'La calificacion no puede ser mayor a 5 y ni menor a 0.';
    }
    if($comentario === ''){
        $errors[] = 'El Comentario es obligatorio';
    }

    if (empty($errors)) {
        $mysqli->begin_transaction();

        try {
            $sqlInserReview = "INSERT INTO feedback (
                score,
                product_id,
                customer_id,
                full_name,
                comment,
                status
            ) VALUES (?,?,?,?,?, ?)";

            $stmtReview = $mysqli->prepare($sqlInserReview);
            if (!$stmtReview) {
                $errors[] = "Error al preparar INSERT feedback: " . $mysqli->error;
            }

            $typesReview = 'iiisss';
            $status = 'Pendiente';

            $stmtReview->bind_param(
                $typesReview,
                $calificacion,
                $productId,
                $customerId,
                $nombre,
                $comentario,
                $status
            );

            if (!$stmtReview->execute()) {
                $errors[] = "Error al ejecutar INSERT feedback: " . $stmtReview->error;
            }

            $stmtReview->close();

            $mysqli->commit();
            $success = true;
        } catch (Exception $e) {
            $mysqli->rollback();
            $errors[] = $e->getMessage();
            $success = false;
        }
    }

    $data = [
        'success' => $success && empty($errors),
        'message' => ($success && empty($errors))
            ? 'Reseña creada exitosamente'
            : (string)$errors[0],
        'error'   => empty($errors) ? null : $errors,
    ];

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data);
}

closeConnection($mysqli);

?>
