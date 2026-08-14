<%-- 
    Document   : showBranch
    Created on : Dec 4, 2017, 10:10:21 PM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Welcome Admin Home</title>
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

                        <%
                            try {
                                DBConnection db = new DBConnection();
                                String sql = "Select * from tbl_branch";
                                ResultSet rs = db.Select(sql);
                        %>
                        <div class="tab-content">
                            <div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
                                <div class="panel-heading">
                                    <h2>Branch Details</h2>
                                    <div class="panel-ctrls" data-actions-container="" data-action-collapse="{&quot;target&quot;: &quot;.panel-body&quot;}"><span class="button-icon has-bg"><i class="ti ti-angle-down"></i></span></div>
                                </div>
                                <div class="panel-body no-padding" style="display: block;">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr class="warning">
                                                <th>Id</th>
                                                <th>Branch Name</th>
                                                <th>IFSC</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%while (rs.next()) {%>
                                            <tr>
                                                <td><%=rs.getString("id")%></td>
                                                <td><%=rs.getString("branch_name")%></td>
                                                <td><%=rs.getString("ifsc")%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <%                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
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
