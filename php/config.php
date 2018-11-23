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
// $hashed = password_hash($_POST["password"], PASSWORD_BCRYPT); 
$mysqli = mysqli_connect("localhost", "root", "", "biomarket");
$connect= false;    
$query = mysqli_query($mysqli, "SELECT * FROM users WHERE email='".mysqli_escape_string ($mysqli, $email)."' ");
 

    if ($query && mysqli_num_rows($query) ) {
     $users = mysqli_fetch_assoc ($query);
     if (password_verify($password, $users['password'])){
     $_SESSION["logged_in"]=true;
     $_SESSION["users"]=$users;
     $connect = true;}
    }
    return $connect;
}

function logout()
{
    $_SESSION["logged_in"] = false;
    unset ($_SESSION["users"]);
}


