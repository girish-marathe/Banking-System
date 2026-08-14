<%-- 
    Document   : addManager
    Created on : Dec 25, 2017, 10:12:51 PM
    Author     : PTPL-02
--%>

<%@page import="connection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Add Branch Manager</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Graph CSS -->
        <link href="css/lines.css" rel='stylesheet' type='text/css' />
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!----webfonts--->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
        <!---//webfonts--->  
        <!-- Nav CSS -->
        <link href="css/custom.css" rel="stylesheet">




        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>
        <script src="js/custom.js"></script>
        <!-- Graph JavaScript -->
        <script src="js/d3.v3.js"></script>
        <script src="js/rickshaw.js"></script>
        <script>
            function myValidation() {
                var branch = document.form1.branch.value;
                var fname = document.form1.fname.value;
                var lname = document.form1.lname.value;
                var uname = document.form1.uname.value;
                var pass = document.form1.pass.value;
                var email = document.form1.email.value;
                var address = document.form1.address.value;
                var mobile = document.form1.mobile.value;
                var adhar = document.form1.adhar_id.value;
                var pan = document.form1.pan_id.value;
                var bdate = document.form1.bdate.value;
                var jdate = document.form1.jdate.value;
                var file = document.form1.file.value;
                if (branch == 0) {
                    alert('Please select brannch');
                    document.form1.branch.focus();
                    return false;
                }
                if (fname == 0) {
                    alert("Please enter first name");
                    document.form1.fname.focus();
                    return false;
                }
                if (!isNaN(fname)) {
                    alert("Please check first name only enter character");
                    document.form1.fname.focus();
                    return false;
                }
                if (lname == 0) {
                    alert("Please enter last name");
                    document.form1.lname.focus();
                    return false;
                }
                if (!isNaN(lname)) {
                    alert("Please check last name only enter character");
                    document.form1.lname.focus();
                    return false;
                }
                if (uname == 0) {
                    alert("Please enter Username");
                    document.form1.uname.focus();
                    return false;
                }
                if (!isNaN(uname)) {
                    alert("Please check Username only enter character");
                    document.form1.uname.focus();
                    return false;
                }
                if ((uname.length < 5) || (uname.length > 15)) {
                    alert("Username Character must be 5 to 15 Character");
                    document.form1.uname.focus();
                    return false;
                }
                if (pass == 0) {
                    alert("Please enter password");
                    document.form1.pass.focus();
                    return false;
                }
                if (pass !== 0) {
                    if (document.form1.pass.value.length < 6) {
                        alert("Error: Password must contain at least six characters!");
                        document.form1.pass.focus();
                        return false;
                    }
                    re = /[@./#&+-]*$/;
                    if (!re.test(document.form1.pass.value)) {
                        alert("Error: Password must contain at least one special symbol!");
                        document.form1.pass.focus();
                        return false;
                    }
                    re = /[0-9]/;
                    if (!re.test(document.form1.pass.value)) {
                        alert("Error: password must contain at least one number (0-9)!");
                        document.form1.pass.focus();
                        return false;
                    }
                    re = /[a-z]/;
                    if (!re.test(document.form1.pass.value)) {
                        alert("Error: password must contain at least one lowercase letter (a-z)!");
                        document.form1.pass.focus();
                        return false;
                    }
                    re = /[A-Z]/;
                    if (!re.test(document.form1.pass.value)) {
                        alert("Error: password must contain at least one uppercase letter (A-Z)!");
                        document.form1.pass.focus();
                        return false;
                    }

                }
                 if (email == 0) {
                    alert('Please enter Email-ID');
                    document.form1.email.focus();
                    return false;
                }
                if (mobile == 0) {
                    alert('Please enter mobile number');
                    document.form1.mobile.focus();
                    return false;
                }
                if (isNaN(mobile)) {
                    alert('Please enter only number');
                    document.form1.mobile.focus();
                    return false;
                }
                if (mobile.length != 10) {
                    alert('mobile number must be 10 digit');
                    document.form1.mobile.focus();
                    return false;
                }
                if (adhar == 0) {
                    alert('Please enter ADHAR number');
                    document.form1.adhar_id.focus();
                    return false;
                }
                if (isNaN(adhar)) {
                    alert('Please enter only DIGIT');
                    document.form1.adhar_id.focus();
                    return false;
                }
                if (adhar.length != 12) {
                    alert('ADHAR number must be 12 digit');
                    document.form1.adhar_id.focus();
                    return false;
                }
                if (pan == 0) {
                    alert('Please enter PAN number');
                    document.form1.pan_id.focus();
                    return false;
                }
                if (pan.length != 10) {
                    alert('PAN number must be 10 digit');
                    document.form1.pan_id.focus();
                    return false;
                }
                if (bdate == 0) {
                    alert('Please enter Date of Birth');
                    document.form1.bdate.focus();
                    return false;
                }
                if (jdate == 0) {
                    alert('Please enter Date of Joining');
                    document.form1.jdate.focus();
                    return false;
                }
                if (file == 0) {
                    alert('Please browse the file');
                    document.form1.file.focus();
                    return false
                }
                return(true);
            }
        </script>
        <%
            HttpSession httpSession = request.getSession(false);
            try {
                if (httpSession.getAttribute("uname") == null) {
                    response.sendRedirect("login.jsp?message='expired'");
                }
            } catch (Exception e) {
                response.sendRedirect("login.jsp?message='expired'");
            }
            String uname = httpSession.getAttribute("uname").toString();
            httpSession.setAttribute("uname", uname);
        %>
    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Admin</a>
                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="images/1.png"><span class="badge"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-header text-center">
                                <strong>Account</strong>
                            </li>
                            <li class="m_2"><a href="logout.jsp"><i class="fa fa-lock"></i> Logout</a></li>	
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right">
                    <input type="text" class="form-control" value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                this.value = 'Search...';
                            }">
                </form>
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="adminHome.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-building-o nav_icon"></i>Bank Branch<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="addBranch.jsp">Add Branch</a>
                                    </li>
                                    <li>
                                        <a href="showBranch.jsp">Branch</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-building-o nav_icon"></i>Branch Manager<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="addManager.jsp">Add Branch Manager</a>
                                    </li>
                                    <li>
                                        <a href="showManager.jsp">Show Branch Manager</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="employeeDetail.jsp"><i class="fa fa-users nav_icon"></i>Employees</a>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-user nav_icon"></i>Customer<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="allUserDetail1.jsp">Customer Details</a>
                                    </li>
                                    <li>
                                        <a href="transaction1.jsp">Transaction Details</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
            <div id="page-wrapper">
                <div class="graphs">
                    <div class="xs">
                        <h3>Add Branch Manager</h3>

                        <div class="tab-content">
                            <div class="panel-body">
                                <form role="form" name="form1" class="form-horizontal" action="AddManager" method="post" enctype="multipart/form-data" onsubmit="return myValidation()">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Select Branch</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-building-o"></i>
                                                </span>
                                                <%
                                                    DBConnection db = new DBConnection();
                                                    String query = "Select * from tbl_branch";
                                                    ResultSet rs2 = db.Select(query);

                                                %>
                                                <select class="form-control1" name="branch" id="branch">
                                                    <option></option>
                                                    <%  while (rs2.next()) {
                                                    %>
                                                    <option value="<%=rs2.getString("branch_name")%>"><%=rs2.getString("branch_name")%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">First Name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="First Name"  name="fname" id="fname">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Last Name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="Last Name" name="lname" id="lname">
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Username</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="User Name" name="uname" id="uname">
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Password</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-lock"></i>
                                                </span>
                                                <input type="password" class="form-control1" placeholder="Enter Password"  name="pass" id="pass">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Address</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-map-marker"></i>
                                                </span>
                                                <input type="text" class="form-control1"  placeholder="Address"  name="address" id="address">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Email</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-envelope-o"></i>
                                                </span>
                                                <input type="email" class="form-control1" placeholder="Email Address"  name="email" id="email">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Gender</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-users"></i>
                                                </span>
                                                <select class="form-control1" name="gender" id="gender">
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Mobile Number</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-mobile-phone"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="Mobile" name="mobile"  id="mobile">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Adhar number</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-id-card" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="Adhar number" name="adhar_id" id="adhar_id">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">PAN Number</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-id-card" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="PAN Number" name="pan_id" id="pan_id">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Date of Birth</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </span>
                                                <input type="date" class="form-control1" id="bdate" placeholder="Date of Birth" name="bdate">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Date of Joining</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </span>
                                                <input type="date" class="form-control1" id="jdate" placeholder="Date of Birth" name="jdate">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Photo Upload</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-file-o"></i>
                                                </span>
                                                <input type="file" id="file" name="file">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <div class="submit"><input type="submit"  value="Save"></div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                        <div class="copy_layout">
                            <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                        </div>
                    </div>
                </div>
                <!-- /#page-wrapper -->
            </div>
            <!-- /#wrapper -->
            <!-- Nav CSS -->
            <link href="css/custom.css" rel="stylesheet">
            <!-- Metis Menu Plugin JavaScript -->
            <script src="js/metisMenu.min.js"></script>
            <script src="js/custom.js"></script>
            <script>
                                    $(document).ready(function () {
                                        var date_input = $('input[name="jdate"]'); //our date input has the name "date"
                                        var date_input1 = $('input[name="bdate"]');
                                        var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                        date_input.datepicker({
                                            format: 'mm/dd/yyyy',
                                            container: container,
                                            todayHighlight: true,
                                            autoclose: true,
                                        })
                                        date_input1.datepicker({
                                            format: 'mm/dd/yyyy',
                                            container: container,
                                            todayHighlight: true,
                                            autoclose: true,
                                        })
                                    })
            </script>
    </body>  
</html>

