<%-- 
    Document   : createAccount.jsp
    Created on : Dec 3, 2017, 10:00:50 PM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Create user account</title>
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
        <script>
            function myValidation() {
                var branch = document.form1.branch.value;
                var mobile = document.form1.mobile.value;
                var adhar = document.form1.adhar.value;
                var pan = document.form1.pan.value;
                var bdate = document.form1.bdate.value;
                var file = document.form1.file.value;
                if (branch == 0) {
                    alert('Please select brannch');
                    document.form1.branch.focus();
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
                    document.form1.adhar.focus();
                    return false;
                }
                if (isNaN(adhar)) {
                    alert('Please enter only DIGIT');
                    document.form1.adhar.focus();
                    return false;
                }
                if (adhar.length != 12) {
                    alert('ADHAR number must be 12 digit');
                    document.form1.adhar.focus();
                    return false;
                }
                if (pan == 0) {
                    alert('Please enter PAN number');
                    document.form1.pan.focus();
                    return false;
                }
                if (pan.length != 10) {
                    alert('PAN number must be 10 digit');
                    document.form1.pan.focus();
                    return false;
                }
                if (bdate == 0) {
                    alert('Please enter Date of Birth');
                    document.form1.bdate.focus();
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
                                <a href="userHome.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-building-o nav_icon"></i>Account<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="checkAccount.jsp">Create Account</a>
                                    </li>
                                    <li>
                                        <a href="showUser.jsp">Account details</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-exchange nav_icon"></i>Transaction<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="addAccount.jsp">Add Beneficiary</a>
                                    </li>
                                    <li>
                                        <a href="sendMoney.jsp">Send Money</a>
                                    </li>
                                    <li>
                                        <a href="recieveMoney.jsp">Receive Money</a>
                                    </li>
                                </ul>
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
                        <h3>Create an Account</h3>

                        <div class="tab-content">
                            <div class="panel-body">
                                <form role="form" name="form1" class="form-horizontal" action="CreateAccount" method="post" enctype="multipart/form-data" onsubmit="return myValidation()">
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
                                                    <option>Select Branch</option>
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
                                    <%
                                        uname = uname;
                                        String sql = "Select * from tbl_user where uname='" + uname + "'";
                                        ResultSet rs = db.Select(sql);
                                        if (rs.next()) {

                                    %>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">First Name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="First Name" value="<%=rs.getString("fname")%>" name="fname" id="fname">
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
                                                <input type="text" class="form-control1" value="<%=rs.getString("lname")%>" name="lname" id="lname">
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
                                                <input type="text" class="form-control1"  placeholder="Address" value="<%=rs.getString("address")%>" name="address" id="address">
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
                                                <input type="text" class="form-control1" placeholder="Email Address" value="<%=rs.getString("email")%>" name="email" id="email">
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
                                                    <option value="<%=rs.getString("gender")%>"><%=rs.getString("gender")%></option>
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
                                                    <i class="fa fa-address-book-o" aria-hidden="true"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="Adhar number" name="adhar" id="adhar">
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
                                                <input type="text" class="form-control1" placeholder="PAN Number" name="pan" id="pan">
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
                                        <label class="col-md-2 control-label">PIN</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-key"></i>
                                                </span>
                                                <input type="password" class="form-control1" placeholder="Enter PIN" name="tpin" id="tpin">
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
                                    <%}%>
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

