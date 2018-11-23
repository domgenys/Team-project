<?php

$userlevel = get_user_level();

if ($userlevel == "visitor")
{
    // login form
    if (!is_logged_in()) {
       
        $login_action = "?page=home";
        include "offers.php";
        include "categories.php";
    
    }
    
}
else
{
        include "offers.php";
        include "categories.php";
}

