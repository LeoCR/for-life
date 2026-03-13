<?php
/**
 * Usado para renderizar el Menu
 */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['lang'])) {
    $_SESSION['lang'] = 'es'; // Idioma por defecto español
}

include ROOT_PATH . 'language/lang_' . $_SESSION['lang'] . '.php'; 

$html_lang = $_SESSION['lang'];
?>
<nav class="barra-navegadora navbar navbar-expand-lg">
  <div class="container-fluid">
    <button
      class="menu-hamburger navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarNav"
      aria-controls="navbarNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <div id="nav-icon3">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav m-auto">
        <?php
        if(isset($_SESSION['userId'])){
          ?>
         <li class="nav-item barra-navegadora-li">
          <a href="/for-life/profile/" class="nav-link" title="<?php echo $lang['editar_perfil']; ?>"
            ><i class="bi bi-person-bounding-box display-6"></i
          ></a>
        </li>
          <?php
        }
        ?>
        <li class="nav-item barra-navegadora-li">
          <a href="/for-life/"
            >
            <img class="logo" src="/for-life/assets/img/logo.jpg" alt="For Life S.A. Logo" title="For Life S.A. Logo" />
        </a>
        </li>
        <?php
        if(isset($_SESSION['userId'])){
          ?>
        <li class="nav-item barra-navegadora-li">
          <a href="/for-life/reviews/" class="nav-link"><?php echo $lang['reseñas'] ?? 'Reseñas'; ?></a>
        </li>
        <?php } ?>
        <?php
        if(!isset($_SESSION['userId'])){
          ?>
        <li class="nav-item barra-navegadora-li">
          <a href="/for-life/auth/login/" class="nav-link" title="<?php echo $lang['iniciar_sesion']; ?>"
            ><i class="bi bi-person-circle display-6"></i
          ></a>
        </li>
        <?php 
        } ?>
          <li class="nav-item barra-navegadora-li d-flex align-items-center">
            <label for="language-switch"><?php if (isset($_SESSION['lang']) && $_SESSION['lang'] == 'es') { echo '<img src="/for-life/assets/img/spain-flag.png" alt="Español" class="flag"/>'; } else { echo '<img src="/for-life/assets/img/usa-flag.webp" class="flag" alt="English"/>'; } ?></label>
            <select id="language-switcher" class="form-select form-select-sm">
                <option value="es" <?php if (isset($_SESSION['lang']) && $_SESSION['lang'] == 'es') echo 'selected'; ?>> Español</option>
                <option value="en" <?php if (isset($_SESSION['lang']) && $_SESSION['lang'] == 'en') echo 'selected'; ?>> English</option>
            </select>
        </li>
        <?php
        if(isset($_SESSION['userId'])){
          ?>
          <li class="nav-item barra-navegadora-li">
            <a href="/for-life/logout/" class="nav-link" title="Cerrar Session"> <i class="display-6 bi bi-box-arrow-right"></i></a>
          </li>
          <?php
        }
        ?>
        
      </ul>
    </div>
  </div>
</nav>
<script src="/for-life/assets/js/language-component.js"></script>
