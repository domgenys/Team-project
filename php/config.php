<?php
function is_logged_in()
{
    return isset($_SESSION["logged_in"]) && ($_SESSION["logged_in"] == true);
}

function get_user_level()
{
    $level = "visitor";
    if (is_logged_in())
    {
        $level = $_SESSION["users"]["level"];      
    }
    return $level;
}

function login($email, $password)
{
 
$mysqli = mysqli_connect("localhost", "root", "", "biomarket");
$connect= false;    
$query = mysqli_query($mysqli, "SELECT * FROM users WHERE email='".mysqli_escape_string ($mysqli, $email)."' AND password = '" .password_hash($password, PASSWORD_BCRYPT) ."'");
 

    if ($query && mysqli_num_rows($query) ) {
     $users = mysqli_fetch_assoc ($query);
     $_SESSION["logged_in"]=true;
     $_SESSION["users"]=$users;
     $connect = true;
    }
    return $connect;
}

function logout()
{
    $_SESSION["logged_in"] = false;
    unset ($_SESSION["users"]);
}


