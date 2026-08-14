<%-- 
    Document   : adminHome
    Created on : Dec 1, 2017, 5:29:01 AM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%-- 
    Document   : index
    Created on : Nov 27, 2017, 3:11:05 AM
    Author     : PTPL-02
--%>

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
                    <div class="col_3">
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <i class="pull-left fa fa-users icon-rounded"></i>
                                <div class="stats">
                                    <%
                                        DBConnection db = new DBConnection();
                                        String sql1 = "Select count(uname)  from tbl_user_account ";
                                        int count = 0;
                                        try {
                                            ResultSet rs1 = db.Select(sql1);
                                            while (rs1.next()) {
                                                count = rs1.getInt(1);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                    <h5><strong><%=count%></strong></h5>
                                    <%%>
                                    <span>Customers</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <i class="pull-left fa fa-users user1 icon-rounded"></i>
                                <div class="stats">
                                    <%
                                        String sql2 = "Select count(uname)  from tbl_manager ";
                                        int count2 = 0;
                                        try {
                                            ResultSet rs2 = db.Select(sql2);
                                            while (rs2.next()) {
                                                count2 = rs2.getInt(1);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                    <h5><strong><%=count2%></strong></h5>
                                    <%%>
                                    <span>Employee</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <i class="pull-left fa fa-building-o user2 icon-rounded"></i>
                                <div class="stats">
                                    <%
                                        String sql3 = "Select count(id) from tbl_branch";
                                        int count3 = 0;
                                        try {
                                            ResultSet rs3 = db.Select(sql3);
                                            while (rs3.next()) {
                                                count3 = rs3.getInt(1);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                    <h5><strong><%=count3%></strong></h5>
                                    <%%>
                                    <span>Branch</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget">
                            <div class="r3_counter_box">
                                <i class="pull-left fa fa-dollar dollar1 icon-rounded"></i>
                                <div class="stats">
                                    <h5><strong>$450</strong></h5>
                                    <span>Profit Today</span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="col_1">
                        <div class="col-md-4 span_7">	
                            <div class="cal1 cal_2"><div class="clndr"><div class="clndr-controls"><div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div><div class="month">July 2015</div><div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div></div><table class="clndr-table" border="0" cellspacing="0" cellpadding="0"><thead><tr class="header-days"><td class="header-day">S</td><td class="header-day">M</td><td class="header-day">T</td><td class="header-day">W</td><td class="header-day">T</td><td class="header-day">F</td><td class="header-day">S</td></tr></thead><tbody><tr><td class="day adjacent-month last-month calendar-day-2015-06-28"><div class="day-contents">28</div></td><td class="day adjacent-month last-month calendar-day-2015-06-29"><div class="day-contents">29</div></td><td class="day adjacent-month last-month calendar-day-2015-06-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-01"><div class="day-contents">1</div></td><td class="day calendar-day-2015-07-02"><div class="day-contents">2</div></td><td class="day calendar-day-2015-07-03"><div class="day-contents">3</div></td><td class="day calendar-day-2015-07-04"><div class="day-contents">4</div></td></tr><tr><td class="day calendar-day-2015-07-05"><div class="day-contents">5</div></td><td class="day calendar-day-2015-07-06"><div class="day-contents">6</div></td><td class="day calendar-day-2015-07-07"><div class="day-contents">7</div></td><td class="day calendar-day-2015-07-08"><div class="day-contents">8</div></td><td class="day calendar-day-2015-07-09"><div class="day-contents">9</div></td><td class="day calendar-day-2015-07-10"><div class="day-contents">10</div></td><td class="day calendar-day-2015-07-11"><div class="day-contents">11</div></td></tr><tr><td class="day calendar-day-2015-07-12"><div class="day-contents">12</div></td><td class="day calendar-day-2015-07-13"><div class="day-contents">13</div></td><td class="day calendar-day-2015-07-14"><div class="day-contents">14</div></td><td class="day calendar-day-2015-07-15"><div class="day-contents">15</div></td><td class="day calendar-day-2015-07-16"><div class="day-contents">16</div></td><td class="day calendar-day-2015-07-17"><div class="day-contents">17</div></td><td class="day calendar-day-2015-07-18"><div class="day-contents">18</div></td></tr><tr><td class="day calendar-day-2015-07-19"><div class="day-contents">19</div></td><td class="day calendar-day-2015-07-20"><div class="day-contents">20</div></td><td class="day calendar-day-2015-07-21"><div class="day-contents">21</div></td><td class="day calendar-day-2015-07-22"><div class="day-contents">22</div></td><td class="day calendar-day-2015-07-23"><div class="day-contents">23</div></td><td class="day calendar-day-2015-07-24"><div class="day-contents">24</div></td><td class="day calendar-day-2015-07-25"><div class="day-contents">25</div></td></tr><tr><td class="day calendar-day-2015-07-26"><div class="day-contents">26</div></td><td class="day calendar-day-2015-07-27"><div class="day-contents">27</div></td><td class="day calendar-day-2015-07-28"><div class="day-contents">28</div></td><td class="day calendar-day-2015-07-29"><div class="day-contents">29</div></td><td class="day calendar-day-2015-07-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-31"><div class="day-contents">31</div></td><td class="day adjacent-month next-month calendar-day-2015-08-01"><div class="day-contents">1</div></td></tr></tbody></table></div></div>
                        </div>
                        <div class="col-md-4 span_8">
                            <div class="activity_box">
                                <div class="scrollbar" id="style-2">
                                    <div class="activity-row">
                                        <div class="col-xs-1"><i class="fa fa-thumbs-up text-info icon_13"> </i>  </div>
                                        <div class="col-xs-3 activity-img"><img src='images/5.png' class="img-responsive" alt=""/></div>
                                        <div class="col-xs-8 activity-desc">
                                            <h5><a href="#">Lorem Ipsum</a> liked <a href="#">random</a></h5>
                                            <p>Lorem Ipsum is simply dummy</p>
                                            <h6>8:03</h6>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="activity-row">
                                        <div class="col-xs-1"><i class="fa fa-comment text-info"></i> </div>
                                        <div class="col-xs-3 activity-img"><img src='images/3.png' class="img-responsive" alt=""/></div>
                                        <div class="col-xs-8 activity-desc">
                                            <h5><a href="#">simply random</a> liked <a href="#">passages</a></h5>
                                            <p>Lorem Ipsum is simply dummy</p>
                                            <h6>8:03</h6>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="activity-row">
                                        <div class="col-xs-1"><i class="fa fa-check text-info icon_11"></i></div>
                                        <div class="col-xs-3 activity-img"><img src='images/1.png' class="img-responsive" alt=""/></div>
                                        <div class="col-xs-8 activity-desc">
                                            <h5><a href="#">standard chunk</a> liked <a href="#">model</a></h5>
                                            <p>Lorem Ipsum is simply dummy</p>
                                            <h6>8:03</h6>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="activity-row1">
                                        <div class="col-xs-1"><i class="fa fa-user text-info icon_12"></i></div>
                                        <div class="col-xs-3 activity-img"><img src='images/4.png' class="img-responsive" alt=""/></div>
                                        <div class="col-xs-8 activity-desc">
                                            <h5><a href="#">perspiciatis</a> liked <a href="#">donating</a></h5>
                                            <p>Lorem Ipsum is simply dummy</p>
                                            <h6>8:03</h6>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 stats-info">
                            <div class="panel-heading">
                                <h4 class="panel-title">Browser Stats</h4>
                            </div>
                            <div class="panel-body">
                                <ul class="list-unstyled">
                                    <li>Google Chrome<div class="text-success pull-right">12%<i class="fa fa-level-up"></i></div></li>
                                    <li>Firefox<div class="text-success pull-right">15%<i class="fa fa-level-up"></i></div></li>
                                    <li>Internet Explorer<div class="text-success pull-right">18%<i class="fa fa-level-up"></i></div></li>
                                    <li>Safari<div class="text-danger pull-right">17%<i class="fa fa-level-down"></i></div></li>
                                    <li>Opera<div class="text-danger pull-right">10%<i class="fa fa-level-down"></i></div></li>
                                    <li>Mobile &amp; tablet<div class="text-success pull-right">14%<i class="fa fa-level-up"></i></div></li>
                                    <li class="last">Others<div class="text-success pull-right">5%<i class="fa fa-level-up"></i></div></li> 
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <!----Calender -------->
                    <link rel="stylesheet" href="css/clndr.css" type="text/css" />
                    <script src="js/underscore-min.js" type="text/javascript"></script>
                    <script src= "js/moment-2.2.1.js" type="text/javascript"></script>
                    <script src="js/clndr.js" type="text/javascript"></script>
                    <script src="js/site.js" type="text/javascript"></script>
                    <!----End Calender -------->
                    <div class="copy">
                        <p>Copyright &copy; 2026 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
