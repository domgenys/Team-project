<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="Organic Food">
  <meta name="keywords" content="organic, food, bio">
  <meta name="author" content="UWL Team">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- =======================-->

  <title>BioMarket</title>
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
  <!-- End -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
</head>
    <body class="<?php echo $page ?>">
       <header>
         <?php 
         
            // Change Menu after the login and the Register page is working
            include "html/header.html";
            
           /* TODO 
            if (!is_logged_in()){
                include "html/header.html"; // change header.html menu points
            }
            if (is_logged_in()){
                include "html/loggedInHeader.html";
            }
            */
         
         
         
         ?>
       </header>
           
        <div class="content">
         <?php echo $content ?>
         </div>
        
        <footer class="footer">
          <?php include "html/footer.html"; ?>
        </footer>
      
</body>

</html>