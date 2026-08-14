<%-- 
    Document   : userHome
    Created on : Dec 1, 2017, 5:29:26 AM
    Author     : PTPL-02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Welcome User Home</title>
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
            String email = httpSession.getAttribute("email").toString();
            httpSession.setAttribute("uname", uname);
            DBConnection db = new DBConnection();
            String imgpath = "";
            Double amount = 0.0;
            String sql = "Select * from tbl_user_account where email='" + email + "'";
            try {
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    imgpath = rs.getString("imgpath");
                    amount = Double.parseDouble(rs.getString("tamount"));
                    session.setAttribute("imgpath", imgpath);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
                    <div class="col_3">
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <a href="checkAccount.jsp"> <i class="pull-left fa fa-pencil icon-rounded"></i></a>
                                <div class="stats">
                                    <h5><strong>New account Create</strong></h5>
                                    <span></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <i class="pull-left fa fa-users user1 icon-rounded"></i>
                                <div class="stats">
                                    <%
                                        String sql1 = "Select count(semail)  from tbl_addaccount where semail='" + email + "'";
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
                                    <span>Beneficiary</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 widget widget1">
                            <div class="r3_counter_box">
                                <i class="pull-left fa fa-rupee dollar1 icon-rounded"></i>
                                <div class="stats">
                                    <h5><strong><%=amount%></strong></h5>
                                    <span>Total Balance</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="clearfix"> </div>
                    </div>
                    <div class="col_1">
                        <div class="col-md-4 span_7">	
                            <div class="cal1 cal_2"><div class="clndr"><div class="clndr-controls"><div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div><div class="month">July 2015</div><div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div></div><table class="clndr-table" border="0" cellspacing="0" cellpadding="0"><thead><tr class="header-days"><td class="header-day">S</td><td class="header-day">M</td><td class="header-day">T</td><td class="header-day">W</td><td class="header-day">T</td><td class="header-day">F</td><td class="header-day">S</td></tr></thead><tbody><tr><td class="day adjacent-month last-month calendar-day-2015-06-28"><div class="day-contents">28</div></td><td class="day adjacent-month last-month calendar-day-2015-06-29"><div class="day-contents">29</div></td><td class="day adjacent-month last-month calendar-day-2015-06-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-01"><div class="day-contents">1</div></td><td class="day calendar-day-2015-07-02"><div class="day-contents">2</div></td><td class="day calendar-day-2015-07-03"><div class="day-contents">3</div></td><td class="day calendar-day-2015-07-04"><div class="day-contents">4</div></td></tr><tr><td class="day calendar-day-2015-07-05"><div class="day-contents">5</div></td><td class="day calendar-day-2015-07-06"><div class="day-contents">6</div></td><td class="day calendar-day-2015-07-07"><div class="day-contents">7</div></td><td class="day calendar-day-2015-07-08"><div class="day-contents">8</div></td><td class="day calendar-day-2015-07-09"><div class="day-contents">9</div></td><td class="day calendar-day-2015-07-10"><div class="day-contents">10</div></td><td class="day calendar-day-2015-07-11"><div class="day-contents">11</div></td></tr><tr><td class="day calendar-day-2015-07-12"><div class="day-contents">12</div></td><td class="day calendar-day-2015-07-13"><div class="day-contents">13</div></td><td class="day calendar-day-2015-07-14"><div class="day-contents">14</div></td><td class="day calendar-day-2015-07-15"><div class="day-contents">15</div></td><td class="day calendar-day-2015-07-16"><div class="day-contents">16</div></td><td class="day calendar-day-2015-07-17"><div class="day-contents">17</div></td><td class="day calendar-day-2015-07-18"><div class="day-contents">18</div></td></tr><tr><td class="day calendar-day-2015-07-19"><div class="day-contents">19</div></td><td class="day calendar-day-2015-07-20"><div class="day-contents">20</div></td><td class="day calendar-day-2015-07-21"><div class="day-contents">21</div></td><td class="day calendar-day-2015-07-22"><div class="day-contents">22</div></td><td class="day calendar-day-2015-07-23"><div class="day-contents">23</div></td><td class="day calendar-day-2015-07-24"><div class="day-contents">24</div></td><td class="day calendar-day-2015-07-25"><div class="day-contents">25</div></td></tr><tr><td class="day calendar-day-2015-07-26"><div class="day-contents">26</div></td><td class="day calendar-day-2015-07-27"><div class="day-contents">27</div></td><td class="day calendar-day-2015-07-28"><div class="day-contents">28</div></td><td class="day calendar-day-2015-07-29"><div class="day-contents">29</div></td><td class="day calendar-day-2015-07-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-31"><div class="day-contents">31</div></td><td class="day adjacent-month next-month calendar-day-2015-08-01"><div class="day-contents">1</div></td></tr></tbody></table></div></div>
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
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="DecodeQR" id="qr" name="qr" method="post" enctype="multipart/form-data" >
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Get Transaction PIN</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- Profile show start-->
                                <table>
                                    <tr>
                                        <td>Browse Your 2LQR code<td>

                                        <td><input type="file" id="file1" name="file1"></td>
                                    </tr>
                                </table>
                                <!--Profile end-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"  data-dismiss="modal">Cancel</button>
                                <input type="submit" class="btn btn-primary" data-dismiss="modal" id="btnsave" value="Submit" name="btnsvae">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Get Transaction PIN</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Profile show start-->
                            <div id="result"></div>
                            <!--Profile end-->
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary" data-dismiss="modal" id="btnsave" value="OK" name="btnsvae">
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /#wrapper -->
        <link href="css/custom.css" rel="stylesheet">
        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>
        <script src="js/custom.js"></script>

        <script type="text/javascript">

                        $(document).ready(function () {
                            //show details of selected document..

                            $("[name='view_data']").click(function () {
                                $.ajax({
                                    success: function () {
                                        $('#myModal').modal("show");
                                        $("#btnsave").prop("disabled", false);
                                    }
                                });
                            });
                        });
                        $(document).ready(function () {

                            $("#btnsave").click(function (event) {

                                //stop submit the form, we will post it manually.
                                event.preventDefault();

                                // Get form
                                var form = $('#qr')[0];

                                // Create an FormData object
                                var data = new FormData(form);

                                // If you want to add an extra field for the FormData
                                data.append("CustomField", "This is some extra data, testing");

                                // disabled the submit button
                                $("#btnsave").prop("disabled", true);

                                $.ajax({
                                    type: "POST",
                                    enctype: 'multipart/form-data',
                                    url: "./DecodeQR",
                                    data: data,
                                    processData: false,
                                    contentType: false,
                                    cache: false,
                                    timeout: 600000,
                                    success: function (result) {

                                        $("#result").text(result);
                                        console.log("SUCCESS : ", result);
                                        $('#myModal1').modal("show");

                                    },
                                    error: function (e) {

                                        $("#result").text(e.responseText);
                                        console.log("ERROR : ", e);
                                        $("#btnSubmit").prop("disabled", false);

                                    }
                                });

                            });

                        });
        </script>
    </body>
</html>
