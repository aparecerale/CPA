<%--
  Created by IntelliJ IDEA.
  User: Autman
  Date: 10/29/16
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="samples.loginAuth"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Movie Recommender System</title>
    <link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">

    <link rel="stylesheet" type="text/css" href="./Wopop_files/jquery.ui.all.css">

</head>

<body class="login" mycollectionplug="bind">

<%  session.setAttribute("Login", "");
    session.setAttribute("UserName", "");%>

<div class="login_m">
    <div class="login_logo"><img src="./Wopop_files/logo_1.png" width="196" height="46"></div>
    <div class="login_boder">

        <div class="login_padding" id="login_model">

            <form method="POST" >
                <h2>USERNAME</h2>
                <input type="text" name="Name" class="txt_input txt_input2"><br>
                <h2>PASSWORD</h2>
                <input type="text" name="Password" class="txt_input"><br>





                <p class="forgot"><a id="iforget" href="registration.jsp">New Here? Sign-up</a></p>
                <div class="rem_sub">
                    <label>
                        <input type="submit" class="sub_button" value="Sign In" name="button" style="opacity: 0.7;">
                        <%
                            if (request.getParameter("Name") != null
                                    && request.getParameter("Password") != null) {
                                String Name = request.getParameter("Name").trim().toLowerCase();
                                String Password = request.getParameter("Password").trim().toLowerCase();
                                if (loginAuth.findUser(Name, Password) != -1) {

                                    session.setAttribute("Login", "OK");
                                    session.setAttribute("UserName", Name);
                                    //session.setAttribute("myCount", new Integer(1));
                                    response.sendRedirect("index.jsp");
                                }
                                else {
                        %>
                        <div class="rem_sub_l">
                            <label>Incorrect name or code!</label>
                        </div>
                        <%
                                }
                            }
                        %>
                    </label>
                </div>
            </form>
        </div>

        <div class="copyrights">Copyrights - Team of Customer Potential Application</div>








    </div><!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div><!--login_m end-->
<br> <br>
<p align="center"> Designed by CPA Group - Collect from Bootstrap template</p>



</body></html>
