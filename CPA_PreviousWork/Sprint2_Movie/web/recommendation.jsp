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
                   url="jdbc:mysql://localhost:3306/CPA?useUnicode=true&characterEncoding=utf-8"
                   user="root"  password="zcpqweqwe123"/>
<%
    String  Login = (String)session.getAttribute("Login");
    if (Login == null || !Login.equals("OK")) {
%>
    <jsp:forward page="login.jsp"/>
<%
}else{
    String userName = (String)session.getAttribute("UserName");
%>
<%  String path = "/Users/Autman/IdeaProjects/jspdemo/input/movie_metadata.csv";
    int user_id = (int)session.getAttribute("user_id");
    double movie_rate = 5.0;
    if (request.getParameter("movieName").isEmpty()){
        out.println("Movie Title can not be empty!");
    }else{
        String movie_name = request.getParameter("movieName").trim().toLowerCase().replaceAll("[:\\\\/*\"?|<>']", "");
        int movie_id = CSV.findByName(new File(path), movie_name);
        ArrayList results = ItemCF.run(request.getParameter("movieName"));
        if (movie_id < 2 || results.isEmpty()){
            out.println("Movie Title does not exist!");
        }else{
            if(request.getParameter("rate").isEmpty()){
                movie_rate  = 5.0;
            }else {
                movie_rate = Double.parseDouble(request.getParameter("rate"));
            }
%>

<sql:update dataSource="${snapshot}" var="result">
    INSERT INTO movie_history (user_id,movie_id,movie_rate) VALUES ('<%=user_id%>', '<%=movie_id%>', '<%=movie_rate%>');
</sql:update>

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
                <li><a href="#" class="active"><i class="fa fa-bar-chart fa-fw"></i>Recommended Movie</a></li>
                <li><a href="databases.jsp"><i class="fa fa-database fa-fw"></i>Databases</a></li>
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
                    <table class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td><a  class="white-text templatemo-sort-by">Color <span class="caret"></span></a></td>
                            <td><a  class="white-text templatemo-sort-by">Movie Title <span class="caret"></span></a></td>
                            <td><a  class="white-text templatemo-sort-by">Genres <span class="caret"></span></a></td>
                            <td><a  class="white-text templatemo-sort-by">Director Name <span class="caret"></span></a></td>
                            <td><a  class="white-text templatemo-sort-by">Imdb Score <span class="caret"></span></a></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <%
                                out.print("<td> " + results.get(0) + "</td>");
                                out.print("<td> " + results.get(11) + "</td>");
                                out.print("<td> " + results.get(9) + "</td>");
                                out.print("<td> " + results.get(1) + "</td>");
                                out.print("<td> " + results.get(25) + "</td>");
                            %>
                        </tr>

                        </tbody>
                    </table>
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
    }
    }
    }
%>
</body>
</html>