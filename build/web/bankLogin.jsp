<%-- 
    Document   : bankLogin
    Created on : Dec 25, 2017, 9:50:35 PM
    Author     : PTPL-02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Manager login</title>
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
        <h2 class="form-heading">login</h2>
        <div class="app-cam">
            <form action="BankLogin" method="post">
                <input type="text" class="text" value="Username" name="uname" onfocus="this.value = '';" onblur="if (this.value == '') {
                            this.value = 'E-mail address';
                        }" >
                <input type="password" value="Password" name="pass"  onfocus="this.value = '';" onblur="if (this.value == '') {
                            this.value = 'Password';
                        }" >
                <div class="submit"><input type="submit" onclick="myFunction()" value="Login"></div>
                <div class="login-social-link">
                   
                </div>
                <ul class="new">
                    <li class="new_left"><p><a href="forgot1.jsp">Forgot Password ?</a></p></li>
                                       <div class="clearfix"></div>
                </ul>
            </form>
        </div>
        <div class="copy_layout login">
            <p>Copyright &copy; 2026 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>
    </body>
</html>
