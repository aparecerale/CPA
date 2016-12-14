<%@ page import="myPackage.CSV" %>
<%@ page import="java.io.File" %>
<%@ page import="myPackage.userRating" %>
<%@ page import="myPackage.MySQL" %><%--
  Created by IntelliJ IDEA.
  User: Autman
  Date: 12/9/16
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String path = "/Users/Autman/IdeaProjects/movieWebsite/input/movie_metadata.csv";
        int user_id = (int) session.getAttribute("user_id");
        String movie_title = request.getParameter("movie_title");
        //int row = CSV.findByName(new File(path), movie_title);
        //int movie_id = row - 1;
        String[] movie_info = MySQL.movie_info(movie_title);
        int movie_id = Integer.parseInt(movie_info[7]);
        double rate = Double.parseDouble(request.getParameter("rate"));
        userRating.build(user_id, movie_id, rate);
        session.setAttribute("new_user", "0");
        response.sendRedirect("single.jsp?movie_title="+movie_title);
    %>
</body>
</html>
