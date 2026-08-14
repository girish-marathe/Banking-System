<%-- 
    Document   : sendMoney
    Created on : Dec 27, 2017, 10:08:10 PM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Send money</title>
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
                var email = document.form1.email.value;
                var amount = document.form1.amount.value;
                if (email == 0 && amount == 0) {
                    alert('Please fill all details');
                    return false;
                }
                if (email == 0) {
                    alert('Please select email');
                    document.form1.email.focus();
                    return false;
                }
                if (amount == 0) {
                    alert('Please enter amount');
                    document.form1.amount.focus();
                    return false;
                }
                if (isNaN(amount)) {
                    alert('Please enter valid amount');
                    document.form1.amount.focus();
                    return false;
                }

                return(true);
            }
            function myFunction() {
                var samount = document.form1.samount.value;
                var amount = document.form1.amount.value;
                var a=parseInt(amount);
                if (samount < a) {
                    alert('You have not sufficient balance');
                    return false;
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
                    <a class="navbar-brand" href="#">User</a>
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
                                        <a href="recieveMoney.jsp">All Transaction</a>
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
                        <h3>Send Money</h3>

                        <div class="tab-content">
                            <div class="panel-body">
                                <%
                                    String email = httpSession.getAttribute("email").toString();
                                    DBConnection db = new DBConnection();
                                    int amount = 0;

                                %>
                                <form role="form" name="form1" class="form-horizontal" action="AddImageDt" method="post"  onsubmit="return myValidation()">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Available Amount</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-money"></i>
                                                </span>
                                                <%                                                    try {
                                                        String sql1 = "select * from tbl_user_account where email='" + email + "'";
                                                        ResultSet rs1 = db.Select(sql1);
                                                        if (rs1.next()) {
                                                            amount = Integer.parseInt(rs1.getString("tamount"));
                                                        }
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                                <input type="hidden" class="form-control1" value="<%=amount%>"  name="samount" id="samount"  >
                                                <label><%=amount%></label>
                                            </div>
                                        </div>
                                    </div>
                                    <%                                        try {
                                            String sql = "select * from tbl_addaccount where semail='" + email + "'";
                                            ResultSet rs = db.Select(sql);
                                    %>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Select Email</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-envelope"></i>
                                                </span>
                                                <select class="form-control1" name="email" id="email">
                                                    <option value="">Select account</option>
                                                    <%                                                        while (rs.next()) {
                                                    %>
                                                    <option value="<%=rs.getString("remail")%>"><%=rs.getString("remail")%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <%} catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>


                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Enter Amount</label>
                                        <div class="col-md-8">
                                            <div class="input-group">							
                                                <span class="input-group-addon">
                                                    <i class="fa fa-money"></i>
                                                </span>
                                                <input type="text" class="form-control1" placeholder="Amount"  name="amount" id="amount" onfocusout="myFunction()" >
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
                                                <input type="password" class="form-control1" placeholder="Enter PIN" name="pin" id="pin">
                                            </div>
                                        </div>
                                    </div>    


                                    <div class="form-group">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <div class="submit"><input type="submit"  value="Send"></div>
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

    </body>  
</html>

