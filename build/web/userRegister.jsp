<%-- 
    Document   : userRegister
    Created on : Dec 1, 2017, 12:53:11 AM
    Author     : PTPL-02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Registration</title>
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
        <script>
            function validation() {
                var fname = document.ureg.fname.value;
                var lname = document.ureg.lname.value;
                var address = document.ureg.address.value;
                var email = document.ureg.email.value;
                var uname = document.ureg.uname.value;
                var pass = document.ureg.pass.value;
                if (fname == 0) {
                    alert("Please enter first name");
                    document.ureg.fname.focus();
                    return false;
                }
                if (!isNaN(fname)) {
                    alert("Please check first name only enter character");
                    document.ureg.fname.focus();
                    return false;
                }
                if ((fname.length < 3) || (fname.length > 15)) {
                    alert("Your Character must be 5 to 15 Character");
                    document.ureg.fname.focus();
                    return false;
                }
                if (lname == 0) {
                    alert("Please enter last name");
                    document.ureg.lname.focus();
                    return false;
                }
                if (!isNaN(fname)) {
                    alert("Please check last name only enter character");
                    document.ureg.lname.focus();
                    return false;
                }
                if ((lname.length < 3) || (lname.length > 15)) {
                    alert("Your Character must be 5 to 15 Character");
                    document.ureg.lname.focus();
                    return false;
                }
                if (address == 0) {
                    alert("Please enter Address");
                    document.ureg.address.focus();
                    return false;
                }
                if (email == 0) {
                    alert("Please enter Email");
                    document.ureg.email.focus();
                    return false;
                }
                // var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                /* var reg = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/;
                 if (reg.test(email.value) == false)
                 {
                 alert('Invalid Email Address');
                 document.ureg.email.focus();
                 return false;
                 }*/
                if (uname == 0) {
                    alert("Please enter Username");
                    document.ureg.uname.focus();
                    return false;
                }
                if (!isNaN(uname)) {
                    alert("Please check Username only enter character");
                    document.ureg.uname.focus();
                    return false;
                }
                if ((uname.length < 5) || (uname.length > 15)) {
                    alert("Your Character must be 5 to 15 Character");
                    document.ureg.uname.focus();
                    return false;
                }
                if (pass == 0) {
                    alert("Please enter password");
                    document.ureg.pass.focus();
                    return false;
                }
                if (pass !== 0) {
                    if (document.ureg.pass.value.length < 6) {
                        alert("Error: Password must contain at least six characters!");
                        document.ureg.pass.focus();
                        return false;
                    }
                    re = /[@./#&+-]*$/;
                    if (!re.test(document.ureg.pass.value)) {
                        alert("Error: Password must contain at least one special symbol!");
                        document.ureg.pass.focus();
                        return false;
                    }
                    re = /[0-9]/;
                    if (!re.test(document.ureg.pass.value)) {
                        alert("Error: password must contain at least one number (0-9)!");
                        document.ureg.pass.focus();
                        return false;
                    }
                    re = /[a-z]/;
                    if (!re.test(document.ureg.pass.value)) {
                        alert("Error: password must contain at least one lowercase letter (a-z)!");
                        document.ureg.pass.focus();
                        return false;
                    }
                    re = /[A-Z]/;
                    if (!re.test(document.ureg.pass.value)) {
                        alert("Error: password must contain at least one uppercase letter (A-Z)!");
                        document.ureg.pass.focus();
                        return false;
                    }

                }
                return true;
            }
        </script>
    </head>
    <body id="login">
        <div class="login-logo">
            <!-- <a href="index.html"><img src="images/logo.png" alt=""/></a> -->
        </div>
        <h2 class="form-heading">Register</h2>
        <form name="ureg" id="ureg" class="form-signin app-cam" action="UserRegister" method="post" onsubmit="return validation();">
            <p>Enter your personal details below</p>
            <input type="text" class="form-control1" placeholder="First Name" autofocus="" name="fname" id="fname">
            <input type="text" class="form-control1" placeholder="Last Name" autofocus="" name="lname" id="lname">
            <input type="text" class="form-control1" placeholder="Address" autofocus="" name="address" id="address">
            <input type="text" class="form-control1" placeholder="Email" autofocus="" name="email" id="email">
            <div class="radios">
                <label for="radio-01" class="label_radio">
                    <input type="radio" checked="" id="gender" name="gender" value="male"> Male
                </label>
                <label for="radio-02" class="label_radio">
                    <input type="radio" checked="" id="gender" name="gender" value="female"> Female
                </label>
            </div>
            <p> Enter your account details below</p>
            <input type="text" class="form-control1" placeholder="User Name" autofocus="" name="uname" id="uname">
            <input type="password" class="form-control1" placeholder="Password" name="pass" id="pass">

            <input class="btn btn-lg btn-success1 btn-block" type="submit" value="Submit">
            <div class="registration">
                Already Registered.
                <a  href="login.jsp">
                    Login
                </a>
            </div>
        </form>
        <div class="copy_layout login register">
            <p>Copyright &copy; 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>
    </body>
</html>

