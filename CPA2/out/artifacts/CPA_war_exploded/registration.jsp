<%--
  Created by IntelliJ IDEA.
  User: Autman
  Date: 10/29/16
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="samples.register" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Movie Recommender System</title>
    <link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">

    <link rel="stylesheet" type="text/css" href="./Wopop_files/jquery.ui.all.css">

</head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
    <div class="login_logo"><img src="./Wopop_files/logo_1.png" width="196" height="46"></div>
    <div class="login_boder"  >

        <div class="login_padding" id="login_model">

            <form method="POST" >
                <h2>USERNAME</h2>
                <input type="text" name="Name" class="txt_input txt_input2">
                <h2>PASSWORD</h2>
                <input type="password" name="Password" class="txt_input">
                <h2>REENTER PASSWORD</h2>
                <input type="password" name="PasswordConfirm" class="txt_input">





                <p class="forgot"><a id="iforget" href="login.jsp">Have an account?</a></p>
                <div class="rem_sub">
                    <label>
                        <input type="submit" class="sub_button" value="Sign Up" name="button" style="opacity: 0.7;">
                        <%
                            if (request.getParameter("Name") != null
                                && request.getParameter("Password") != null &&request.getParameter("PasswordConfirm")  != null ) {
                            if(register.confirm(request.getParameter("Password"),request.getParameter("PasswordConfirm"))) {
                            if (register.duplicate(request.getParameter("Name"))  ){
                                String Name = request.getParameter("Name").trim().toLowerCase();
                                String Password = request.getParameter("Password").trim().toLowerCase();
                                String PasswordConfirm = request.getParameter("PasswordConfirm").trim().toLowerCase();
                        %>
                        <!--
                        JDBC 驱动名及数据库 URL
                        数据库的用户名与密码，需要根据自己的设置
                        useUnicode=true&characterEncoding=utf-8 防止中文乱码
                         -->
                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                           url="jdbc:mysql://localhost:3306/cpa?useUnicode=true&characterEncoding=utf-8"
                                           user="root"  password=""/>
                        <!--
                        插入数据
                         -->
                        <sql:update dataSource="${snapshot}" var="insertion">
                            INSERT INTO login (name,password) VALUES ('<%=Name%>', '<%=Password%>');
                        </sql:update>
                        <%            session.setAttribute("Login", "OK");
                            session.setAttribute("UserName", Name);
                            //session.setAttribute("user_id", row.id);
                            //session.setAttribute("myCount", new Integer(1));
                            response.sendRedirect("index.jsp");
                        }else{
                           %>

                        <div class="rem_sub_l">
                            <label>User Name already exists!</label>
                        </div>
                        <%}
                        }
                        else
                        { %>
                        <div class="rem_sub_l">
                            <label>Passwords don't match!</label>
                        </div><%
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
