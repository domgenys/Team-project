<?php


$userlevel = get_user_level();

if ($userlevel == "visitor")
{

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
<title> Biomarket login</title>

<link rel="stylesheet" type="text/css" href="css/stylelogin.css">

</head>


<body>
  <form action="?page=login" method="post">
  <div class="login-wrap">
    <h2>Login to an existing account</h2>
        <p>Email address</p>
    <input type="text" name="email" placeholder="Your email address ...">
        <p>Password</p>
    <input type="password" name="password" placeholder="Your password ...">
    <p class="forgot-password"><a href="?page=resetpassword">Forgot password?</a></p>

    <button class="btn-login" type="submit">LOGIN</button>

    <p>New user?</p>

    <button class="btn-register">Register</button>
  </div>
 </form>

    
</body>
</html>
<?php
}

if (!is_logged_in()){
    
      $login_action = "?page=login";
}
if (is_logged_in()){
    
    $login_action = "?page=login";

    print " <br><h2>Welcome:    ".$_SESSION["users"]["first_name"]. "</h2>"; 
}
?>