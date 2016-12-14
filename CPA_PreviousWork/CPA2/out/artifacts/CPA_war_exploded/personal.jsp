<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="samples.loginAuth" %>
<%@ page import="samples.CSV" %>
<%@ page import="samples.ItemCF" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visual Admin Dashboard - Home</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">


</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"

                   url="jdbc:mysql://localhost:3306/cpa?useUnicode=true&characterEncoding=utf-8"
                   user="root"  password=""/>
<%
    String  Login = (String)session.getAttribute("Login");
    if (Login == null || !Login.equals("OK")) {
%>
<jsp:forward page="login.jsp"/>
<%
}else{
    String userName = (String)session.getAttribute("UserName");
%>
<sql:query dataSource="${snapshot}" var="user_result">
    SELECT * from login where name='<%=userName%>';
</sql:query>
<sql:query dataSource="${snapshot}" var="movie_result">
    SELECT * from movie_history;
</sql:query>

<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1>HELLO, <%= userName.toUpperCase()%></h1>
        </header>
        <div class="profile-photo-container">
            <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
            <div class="input-group">
                <button type="submit" class="fa fa-search"></button>
                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>Preferences</a></li>
                <li><a href="recommendation.jsp" class="active"><i class="fa fa-bar-chart fa-fw"></i>Recommended Movie</a></li>
                <li><a href="databases.jsp"><em class="fa fa-database fa-fw"></em>User History</a></li>
                <li><a href="personal.jsp"><i class="fa fa-info-circle fa-fw"></i>Personal</a></li>
                <li><a href="login.jsp"><i class="fa fa-eject fa-fw"></i>Sign Out</a></li>
            </ul>
        </nav>
    </div>
    <!-- Main content -->


    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">Admin Panel</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                   <table align="center" width="300" height="100" border="0">
 	
  	
	</table>

    </br></br>
                    <br class="templatemo-flex-row flex-content-row">
                        <div class="col-1">
                            <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                                <div class="panel-heading templatemo-position-relative"><h2 align="center" class="text-uppercase">Personal Information</h2></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <td>No.</td>
                                            <td>Username</td>
                                            <td>Password</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="row" items="${user_result.rows}">
                                            <tr>
                                                <td><c:out value="${row.id}"/></td>
                                                <td><c:out value="${row.name}"/></td>
                                                <td><c:out value="${row.password}"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        </br></br>
				<div align="center" class="form-group">
                                <button onClick="location.href='personalmodify.jsp'" type="submit" class="templatemo-blue-button" value="Submit">Modify</button>
                            </div>
                </div>
            </div>
            
           
            <footer class="text-right">
                <p>Copyright &copy; 2016 CPA Team
                    - Collect from Online Resources</p>
            </footer>
        </div>
    </div>
</div>
<%
   // }
    //}
    }
%>
</body>
</html>