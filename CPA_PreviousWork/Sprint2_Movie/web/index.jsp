<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="samples.loginAuth" %>

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
<%
    String  Login = (String)session.getAttribute("Login");
    if (Login == null || !Login.equals("OK")) {
%>
    <jsp:forward page="login.jsp"/>
<%
    }else{
        String userName = (String)session.getAttribute("UserName");
        session.setAttribute("user_id", loginAuth.findUserId(userName));
%>
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
                <li><a href="#" class="active"><i class="fa fa-home fa-fw"></i>Preferences</a></li>
                <li><a href="recommendation.jsp"><i class="fa fa-bar-chart fa-fw"></i>Recommended Movie</a></li>
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
                        <li><a href="" class="active">Admin panel</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="col-1">
                <div class="panel panel-default margin-10">
                    <div class="panel-heading"><h2 class="text-uppercase">What movie do you like</h2></div>
                    <div class="panel-body">
                        </br>
                        <form action="recommendation.jsp" class="templatemo-login-form">
                            <div class="form-group">
                                <label for="inputEmail">Movie Title</label>
                                <input type="text" name="movieName" class="form-control" id="inputEmail" placeholder="Enter a movie">
                                </br>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Your Rate</label>
                                <input type="text" name="rate" class="form-control" placeholder="Enter your rate">
                                </br>
                            </div>


                            <div class="form-group">
                                <button type="submit" class="templatemo-blue-button" value="Submit">Submit</button>
                            </div>
                        </form>
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
    }
%>
</body>