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
	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/stylea.css">
	<link rel="stylesheet" href="css/responsive.css">
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
    session.setAttribute("user_id", loginAuth.findUserId(userName.toLowerCase()));
%>
<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1  style="color:#2CD3DB"class="text-uppercase">HELLO,<%= userName.toUpperCase()%></h1>
        </header>
        <div class="profile-photo-container">
            <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form style="background-color: black" class="templatemo-search-form" role="search">
            <div class="input-group">
                <button style="color: white" type="submit" class="fa fa-search"></button>
                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="#" class="active"><i class="fa fa-home fa-fw"></i>Preferences</a></li>
                <li><a href="index.jsp"><i class="fa fa-bar-chart fa-fw"></i>Recommended Movie</a></li>
                <li><a href="databases.jsp"><i class="fa fa-database fa-fw"></i>Databases</a></li>
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
                            <div class="form-group col-md-5">
                                <label for="inputEmail">Movie Title</label>
                                <input type="text" name="movieName" class="form-control" id="inputEmail" placeholder="Enter a movie">
                                </br>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputEmail">Your Rate</label>
                                <input type="text" name="rate" class="form-control" placeholder="Enter your rate">
                                </br>
                            </div>

							</br>
                            <div align="center" class="form-group col-md-4">
                                <button type="submit" class="templatemo-blue-button" value="Submit">Submit</button>
                            </div>
                        </form>
                        
                    </div>
                     <div class="panel-heading"><h2 class="text-uppercase">Hot Movies</h2></div>
                    <section id="container">
	<div class="wrap-container zerogrid">
		<div id="main-content" class="col-2-3">
			<div class="wrap-content">
				<div class="movie">
					<div class="row type"> </div>
					<div class="row">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="images/1.jpg"  />
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									  
									</div>
									<div class="clear"></div>
									<a href="moviedetail.jsp"><h3>Lethal Weapon 4</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/2.jpg"  /> 
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Film's Name</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									 <img class="thumb" src="images/4.jpg"  /> 
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a> 
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Lord Of War</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect"> 
									  <img class="thumb" src="images/5.jpg"  />  
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>The Sorcerer's Apprentice</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/3a.jpg"  />   
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a> 
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>National Treasure</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/6a.jpg"  />   
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Seeking Justice</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/7a.jpg"  /> 
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Season Of The Witch</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/8a.jpg"  />   
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Three Mustketeers</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="serie">
					<div class="row type"> </div>
                        <div class="row">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/12a.jpg"  />   
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a> 
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Film's Name</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/13a.jpg"  />   
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Film's Name</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/19a.jpg"  /> 
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Film's Name</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src="images/20a.jpg"  />   
									  <div class="mask">  
										<a href="moviedetail.jsp" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="moviedetail.jsp"><h3>Film's Name</h3></a>
									<span>Lorem ipsum dolor sit</span>
								</div>
							</div>
						</div>
					</div>
</div>
			</div>
		</div>
		<div id="sidebar" class="col-1-3">
			<div class="wrap-sidebar">
				<!---- Start Widget ---->
				
				<!---- Start Widget ---->
				
				<!---- Start Widget ---->
				
				<!---- Start Widget ---->
			</div>
		</div>
	</div>
</section>
                    
                    
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