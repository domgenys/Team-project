<?php
session_start();

// Database connection
$sql_host = "localhost";
$sql_user = "root";
$sql_password = "";
$sql_database = "biomarket";

$mysqli = mysqli_connect ($sql_host, $sql_user, $sql_password, $sql_database);


if ($mysqli->connect_errno) {
echo "Sorry, this website is experiencing problems.";
echo "Error: " . $mysqli->connect_error . "\n";
exit;
    
}    
if (!$sql_database) { die("Database Selection Error: ". $mysqli->connect_error  ); }
mysqli_query  ($mysqli, "SET NAMES UTF8");    

include "php/config.php";

if (isset($_POST["password"]) && isset($_POST["email"])) {
    login($_POST["email"], $_POST["password"]);
}
//unset (login());
if (isset($_GET["logout"])) {
    logout();
}


// Show the Site
$page = "home";
if (isset($_GET["page"])) {
    $page = basename($_GET["page"]);
}

$content = "";
if (file_exists("php/".$page.".php")) {
    ob_start();
    include "php/".$page.".php";
    $content = ob_get_clean();
}

include "layout.php";

