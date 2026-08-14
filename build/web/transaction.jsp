<%-- 
    Document   : transaction
    Created on : Dec 28, 2017, 10:30:37 PM
    Author     : PTPL-02
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Transaction Details</title>
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
                    response.sendRedirect("bankLogin.jsp?message='expired'");
                }
            } catch (Exception e) {
                response.sendRedirect("bankLogin.jsp?message='expired'");
            }
            String uname = httpSession.getAttribute("uname").toString();
            String designation = httpSession.getAttribute("designation").toString();
            httpSession.setAttribute("uname", uname);
            DBConnection db = new DBConnection();
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
                    <a class="navbar-brand" href="#">Bank</a>
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
                                <a href="managerHome.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>Dashboard<span class="fa arrow"></span></a>
                            </li>
                            <li>
                                <a href="allUserDetails.jsp"><i class="fa fa-building-o nav_icon"></i>Activation<span class="fa arrow"></span></a>

                            </li>
                            <li>
                                <a href="addMoney.jsp"><i class="fa fa-building-o nav_icon"></i>Add Money<span class="fa arrow"></span></a>
                            </li>
                            <%if (designation.equals("manager")) {%>
                            <li>
                                <a href="addEmployee.jsp"><i class="fa fa-user nav_icon"></i>Add Employee<span class="fa arrow"></span></a>
                            </li>
                            <li>
                                <a href="showEmployee.jsp"><i class="fa fa-users nav_icon"></i>Show Employee<span class="fa arrow"></span></a>
                            </li>
                            <%}%>
                            <li>
                                <a href="transaction.jsp"><i class="fa fa-exchange nav_icon"></i>Transaction</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
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

                        String branch = "";

                        String query = "Select* from tbl_manager where uname='" + uname + "' ";
                        ResultSet rs = null, rs1 = null;
                        rs1 = db.Select(query);
                        if (rs1.next()) {
                            branch = rs1.getString("branch");
                        }
                        String sql = "Select * from tbl_transaction";
                        rs = db.Select(sql);
                %>
                <div class="tab-content">
                    <div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
                        <div class="panel-heading">
                            <h2>Transaction Details</h2>
                            <div class="panel-ctrls" data-actions-container="" data-action-collapse="{&quot;target&quot;: &quot;.panel-body&quot;}"><span class="button-icon has-bg"><i class="ti ti-angle-down"></i></span></div>
                        </div>
                        <div class="panel-body no-padding" style="display: block;">
                            <table class="table table-striped">
                                <thead>
                                    <tr class="warning">
                                        <th>Sender</th>
                                        <th>Receiver</th>
                                        <th>IFSC</th>
                                        <th>Account_No.</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Type</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%while (rs.next()) {%>
                                    <tr>
                                        <td><%=rs.getString("semail")%></td>
                                        <td><%=rs.getString("remail")%></td>
                                        <td><%=rs.getString("ifsc")%></td>
                                        <td><%=rs.getString("accno")%></td>
                                        <td><%=rs.getString("amount")%></td>
                                        <td><%=rs.getString("date")%></td>
                                        <td><%=rs.getString("type")%></td>
                                        <td><a href="#" onclick="return confirm('Are you sure you want to delete this item?');"><i class="fa  fa-trash-o" aria-hidden="true"></i></a></td>
                                    </tr>
                                    <%}
                                    %>
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

        <!-- /Start Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Personal Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Profile show start-->
                        <div id="user_profile"></div>

                        <!--Profile end-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /end Modal -->
        <!-- /#page-wrapper -->
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
                                                    var email_id = $(this).attr("id");


                                                    $.ajax({
                                                        url: 'userProfile.jsp',
                                                        data: {email_id: email_id},
                                                        type: "post",
                                                        async: false,
                                                        success: function (msg) {
                                                            $('#user_profile').html(msg);
                                                            $('#myModal').modal("show");

                                                        }
                                                    });
                                                });
                                            })
    </script>
</body>
</html>

