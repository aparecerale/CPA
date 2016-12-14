<%@ page import="java.io.IOException" %>
<%@ page import="myPackage.CSV" %>
<%@ page import="java.io.File" %>
<%@ page import="myPackage.MySQL" %>
<%@ page import="myPackage.ItemCF" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>CPA</title>
    <meta name="description" content="Movie Recommender System">
    <meta name="author" content="Movie Picker Team">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->

</head>
<body>
<%
    String login = (String) session.getAttribute("Login");

    if(login == null){
        response.sendRedirect("login.jsp");
    }else{

        String movie = (String) request.getParameter("movie_title");

        if(movie == null || movie.isEmpty()){
            response.sendRedirect("index.jsp");
        }else{
            String movie_title = movie.trim().toLowerCase().replaceAll("\\u00A0","").replaceAll("[:\\\\/*\"?|<>']", "");
            request.setAttribute("movie_title", movie_title);
            if(session.getAttribute("user_id") != null){
                int user_id = Integer.parseInt(session.getAttribute("user_id").toString());
            }
            //int row = CSV.findByName(new File(path), movie_title);
            String[] movie_info = MySQL.movie_info(movie_title);

            if(movie_info == null || movie_info.length == 0) {
                response.sendRedirect("index.jsp");
            }else{
                String similarMovieName = "2 Guns";
                if (ItemCF.similarMovie(movie_title) != null && !ItemCF.similarMovie(movie_title).isEmpty()){
                    similarMovieName = ItemCF.similarMovie(movie_title);
                    //similarMovieName = similarMovie.get(11);
                }

%>
<div class="wrap-body">

    <!--////////////////////////////////////Header-->
    <header>
        <div class="top-bar">
            <div class="wrap-top zerogrid">
                <div class="row">
                    <div class="col-1-2">
                        <div class="wrap-col">
                            <ul>
                                <li class="mail"><p>tonycao@bu.edu</p></li>
                                <li class="phone"><p>+1(617)901-3066</p></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrap-header zerogrid">
            <div class="row">
                <div class="col-1-2">
                    <div class="wrap-col">
                        <div class="logo"><a href="index.jsp"><img src="images/logo_1.png"/></a></div>
                    </div>
                </div>
                <div class="col-1-2">
                    <div class="wrap-col f-right">
                        <form method="get" action="single.jsp" id="search"  >
                            <input name="movie_title" type="text" size="40" placeholder="Search..."/>
                            <input type="submit" value="Submit">
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="menu">
                    <nav>
                        <div class="wrap-nav">
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li class="active"><a href="single.jsp">SEARCH</a></li>
                                <li><a href="comedy.jsp">Genre</a></li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="login.jsp">SIGNOUT</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>


    <!--////////////////////////////////////Container-->
    <section id="container">
        <div class="wrap-container zerogrid">
            <div id="main-content" class="col-2-3">
                <div class="wrap-content">
                    <article>
                        <div class="art-header">
                            <div class="col-1-3">
                                <div class="wrap-col">
                                    <img src="images/boy7.PNG" />
                                </div>
                            </div>
                            <div class="col-2-3">
                                <div class="wrap-col">
                                    <ul>
                                        <li><p>Movie_Title: <a href="#"><%=movie%></a></p></li>
                                        <li><p>Director: <a href="#"><%=movie_info[0]%></a></p></li>
                                        <li><p>Genres: <a href="#"><%=movie_info[1]%></a></p></li>
                                        <li><p>Actor: <a href="#"><%=movie_info[2]%></a></p></li>
                                        <li><p>Imdb_link: <a href="#"><%=movie_info[3]%></a></p></li>
                                        <li><p>Language: <a href="#"><%=movie_info[4]%></a></p></li>
                                        <li><p>Nation: <a href="#"><%=movie_info[5]%></a></p></li>
                                        <li><a class="button bt1" href="video.jsp">Play</a>
                                                    <form action="rate.jsp?movie_title=<%=movie_title%>" method="POST" target="_blank">
                                                        <input type="radio" name="rate" value="1" /> 1
                                                        <input type="radio" name="rate" value="2" /> 2
                                                        <input type="radio" name="rate" value="3" /> 3
                                                        <input type="radio" name="rate" value="4" /> 4
                                                        <input type="radio" name="rate" value="5" /> 5
                                                        </br>
                                                        <input type="submit" name="submit" width="100" height="50" class="btn" value="Rate It! ">
                                                    </form>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <!--
                        <div class="art-content">
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
                                At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,
                                sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                                sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                            <img src="images/0.jpg" />
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
                                At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,
                                sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                                sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                            <blockquote><p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet vultatup duista.</p></blockquote>
                            <img src="images/17.jpg" />
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
                                At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,
                                sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,aaszx asqr amet vultatup duista.justo duo dolores et ea rebum</p>
                            <div class="note">
                                <ol>
                                    <li>Lorem ipsum</li>
                                    <li>Sit amet vultatup nonumy</li>
                                    <li>Duista sed diam</li>
                                </ol>
                                <div class="clear"></div>
                            </div>

                            <img src="images/16.jpg" />
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
                                At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,
                                sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                                sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
                                At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,
                                sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                                sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                            <div class="clear"></div>
                        </div>
                        -->
                    </article>
                </div>
            </div>
            <div id="sidebar" class="col-1-3">
                <div class="wrap-sidebar">
                    <div class="widget wid-last-updates">
                        <div class="wid-header">
                            <h5>Similar Movie</h5>
                        </div>
                        <div class="wid-content">
                            <div class="post">
                                <a href="#"><img src="images/1.jpg"/></a>
                                <div class="wrapper">
                                    <a href="single.jsp?movie_title=<%=similarMovieName.trim().toLowerCase().replaceAll("\\u00A0","").replaceAll("[:\\\\/*\"?|<>']", "")%>"><h6><%=similarMovieName%></h6></a>
                                    <p>March 1, 2015</p>
                                    <a href="single.jsp?movie_title=<%=similarMovieName.trim().toLowerCase().replaceAll("\\u00A0","").replaceAll("[:\\\\/*\"?|<>']", "")%>"><img src="images/star.png" /></a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!---- Start Widget ---->
                    <div class="widget wid-tag">
                        <div class="wid-header">
                            <h5>Tags</h5>
                        </div>
                        <div class="wid-content">
                            <ul>
                                <li><a href="adventure.jsp">Adventure</a></li>
                                <li><a href="thriller.jsp">Thriller</a></li>
                                <li><a href="comedy.jsp">Comedy</a></li>
                                <li><a href="family.jsp">Family</a></li>
                            </ul>
                        </div>
                    </div>
                    <!---- Start Widget ---->
                    <div class="widget wid-new-updates">
                        <div class="wid-header">
                            <h5>Hot Updates !</h5>
                        </div>
                        <div class="wid-content">
                            <ul>
                                <li><a href="single.jsp?movie_title=Sky On Fire">Sky On Fire</a><span><img src="images/hot.png"></span></li>
                                <li><a href="single.jsp?movie_title=Believe">Believe</a><span><img src="images/hot.png"></span></li>
                                <li><a href="single.jsp?movie_title=Incarnate">Incarnate</a><span><img src="images/hot.png"></span></li>
                                <li><a href="single.jsp?movie_title=Allied">Allied</a><span><img src="images/hot.png"></span></li>
                                <li><a href="single.jsp?movie_title=Bad Santa 2">Bad Santa 2</a><span><img src="images/hot.png"></span></li>
                            </ul>
                        </div>
                    </div>

                    <!---- Start Widget ---->

                    <!---- Start Widget ---->
                </div>
            </div>
        </div>
    </section>

    <!--////////////////////////////////////Footer-->
    <!--
    <footer>
        <div class="zerogrid">
            <div class="wrap-footer">
                <div class="row">
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <div class="widget wid-about">
                                <div class="wid-header">
                                    <h5>Welcome</h5>
                                </div>
                                <div class="logo"><a href="#"><img src="images/logo.png"/></a></div>
                                <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque quod maxime placeat
                                    facere possimus nihil impedit quo minus id quod maxime placeat facere possimus. </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <div class="widget wid-meta">
                                <div class="wid-header">
                                    <h5>Links List</h5>
                                </div>
                                <div class="widget-content">
                                    <div class="row">
                                        <ul>
                                            <li><a href="#">> Lorem ipsum dolor sit </a></li>
                                            <li><a href="#">> Nullam venenatis lacus a </a></li>
                                            <li><a href="#">> Morbi ut sapien nec nisl</a></li>
                                            <li><a href="#">> Integer a enim ac ex.</a></li>
                                            <li><a href="#">> Sed in nunc non eleifend  </a></li>
                                            <li><a href="#">> Integer a enim ac ex.</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <div class="widget wid-report">
                                <div class="wid-header">
                                    <h5>Report Link</h5>
                                </div>
                                <div class="wid-content">
                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
                                        eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
                                        At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr,
                                        sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-1-4">
                        <div class="wrap-col">
                            <div class="widget wid-meta">
                                <div class="wid-header">
                                    <h5>Links List</h5>
                                </div>
                                <div class="widget-content">
                                    <div class="row">
                                        <ul>
                                            <li><a href="#">> Lorem ipsum dolor sit </a></li>
                                            <li><a href="#">> Nullam venenatis lacus a </a></li>
                                            <li><a href="#">> Morbi ut sapien nec nisl</a></li>
                                            <li><a href="#">> Integer a enim ac ex.</a></li>
                                            <li><a href="#">> Sed in nunc non eleifend  </a></li>
                                            <li><a href="#">> Integer a enim ac ex.</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer">
            <div class="wrap-bottom ">
                <div class="copyright">
                    <p>©2015 - More Templates  - Collect from online resources</p>
                </div>
            </div>
        </div>
    </footer>
    -->


</div>

<%
            }
        }
    }
%>
</body>
</html>