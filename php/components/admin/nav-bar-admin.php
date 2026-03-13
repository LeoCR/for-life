<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
$adminID = isset($_SESSION['admin_id'])? (int)$_SESSION['admin_id']: 0;
if($adminID > 0){?>
<nav class="navbar navbar-expand-lg bg-body-tertiary border-bottom sticky-top">
  <div class="container">
    <a class="navbar-brand fw-semibold" href="/for-life/">
      <img style="max-width:80px;" class="logo" src="/for-life/assets/img/logo.jpg" alt="For Life S.A. Logo" title="For Life S.A. Logo" />
</a>
    <a class="navbar-brand fw-semibold" href="/for-life/">For Life S.A.</a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navMain"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMain">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="/for-life/admin/customers/">Clientes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/for-life/admin/admins/">Administradores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/for-life/admin/reviews/">Reseñas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/for-life/admin/logout/">Cerrar Sesión</a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>

<?php
}
?>
