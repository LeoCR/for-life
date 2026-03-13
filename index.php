<?php

/**
 * Usado para renderizar el Home Page
 */
header("Content-Type: text/html; charset=UTF-8");
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['lang'])) {
    $_SESSION['lang'] = 'es'; // Idioma por defecto español
}

$adminID = isset($_SESSION['userId']) ? (int)$_SESSION['userId'] : 0;

if($adminID <= 0){
    header("Location: /for-life/auth/login/");
    exit();
}
else{
  header("Location: /for-life/reviews/");
  exit();
}