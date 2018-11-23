<?php

if ((isset($_POST["email"])) && (isset($_POST["password"])))
{
$hashed = password_hash($_POST["password"], PASSWORD_BCRYPT);
$search = "SELECT * FROM users WHERE email = '".$_POST["email"]."'; ";
$result = mysqli_query($mysqli, $search);
if (mysqli_num_rows($result) == 1)
{ 
$users = mysqli_fetch_assoc($result);

$search = "UPDATE users SET
    email = '".$_POST["email"]."',
    password = '".$hashed."',
    join_date = NOW(),
    level = 'member',
    WHERE user_id = ".$users["user_id"];

mysqli_query($mysqli, $search);
}

else {
    


if (isset($_POST["first_name"]))
{
	if (($_POST["first_name"] == "") || ($_POST["last_name"] == "") || ($_POST["email"] == "") || ($_POST["password"] == "") || ($_POST["psw_repeat"] == "") || ($_POST["dob"] == "") 
        ||  ($_POST["house_no"] == "") ||  ($_POST["street"] == "") ||  ($_POST["city"] == "") ||  ($_POST["postcode"] == "") ||  ($_POST["phone"] == ""))
	{

             print "<h4>Empty Fields!</h4>";
          
	}
	else
	{
		if ($_POST["password"] == $_POST["psw_repeat"])
		{
                     
$search = "INSERT INTO users (first_name, last_name, email, password, dob, join_date, level, house_no, street, city, postcode, phone)
VALUES
('".$_POST["first_name"]."','".$_POST["last_name"]."','".$_POST["email"]."','".$hashed."','".$_POST["dob"]."', NOW(),'member', '".$_POST["house_no"]."','".$_POST["street"]."','".$_POST["city"]."','".$_POST["postcode"]."','".$_POST["phone"]."');";



                    
                    print "<h2>Successful Registration!</h2>";
if (!mysqli_query($mysqli, $search))
  {
    die('Error: ' . mysql_error());
  }

		}
		else
		{
                    print "<h2>The Passwords are not identical!</h2>";
                   
                }    	
                
        }
}


  }
}

