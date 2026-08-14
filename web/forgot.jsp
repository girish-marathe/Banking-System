<%-- 
    Document   : forgot
    Created on : 22 Feb, 2018, 3:37:36 PM
    Author     : shri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>User Forgot Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!----webfonts--->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
        <!---//webfonts--->  
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>




    </head>
    <body id="login">
        <div class="login-logo">
            <!-- <a href="index.html"><img src="images/logo.png" alt=""/></a>-->
        </div>
        <h2 class="form-heading">Forgot Password</h2>
        <div class="app-cam">
            <form action="Forgot" method="post">
                <input type="text" class="text" value="Email ID" name="email" onfocus="this.value = '';" onblur="if (this.value == '') {
                            this.value = 'E-mail address';
                        }" >

                <div class="submit"><input type="submit" onclick="myFunction()" value="Send"></div>
                <div class="login-social-link">
                    <a href="index.html" class="facebook">
                        Facebook
                    </a>
                    <a href="index.html" class="twitter">
                        Twitter
                    </a>
                </div>
                <ul class="new">
                    <div class="clearfix"></div>
                </ul>
            </form>
        </div>
        <div class="copy_layout login">
            <p>Copyright &copy; 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>
    </body>
</html>
