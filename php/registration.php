<?php
$userlevel = get_user_level();

if ($userlevel == "member")
{

 print "<br><h2>You are already registered!</h2>";
// include "html/registration.html";
 
}
else {
    
     include "register_me.php";
    
}

// To check if the user is Logged IN
if (!is_logged_in()) 
{
    if ((isset($_POST["email"])) && (isset($_POST["password"])))
        {
            
                if ($_POST["password"] != $_POST["psw_repeat"])
		{
                
                print "<br><h2>The passwords are not identical!</h2>"; 
  
                
                }
                else{
                     print "<br><h2>Congratulations on Joining the Bio Market!</h2>"; 
                        include "offers.php";
                        include "categories.php";
                     
                }
                
                
        }
        
    else{     
        $login_action = "?page=registration";

    ?>


<body>

<form action="?page=registration" method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
	
	<label for="first_name"><b>First Name</b></label>
    <input type="text" placeholder="Enter first name" name="first_name" required>
	
	<label for="last_name"><b>Last Name</b></label>
    <input type="text" placeholder="Enter last name" name="last_name" required>
    	<label for="dob"><b>Date of Birth</b></label>
    <input type="date" placeholder="Enter Date of Birth" name="dob" required>

	<label for="house_no"><b>House Number</b></label>
    <input type="text" placeholder="Enter house number" name="house_no" required>
    
    	<label for="street"><b>Street</b></label>
    <input type="text" placeholder="Enter street" name="street" required>
    	<label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter city" name="city" required>
	
	<label for="postcode"><b>Postcode</b></label>
    <input type="text" placeholder="Enter Postcode" name="postcode" required>
    	<label for="phone"><b>Phone Number</b></label>
    <input type="text" placeholder="Enter Phone Number" name="phone" required>
	
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <label for="psw_repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw_repeat" required>
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>

</body>
        
        
        
        
        
        

  
    <?php
    }

 
 
}












