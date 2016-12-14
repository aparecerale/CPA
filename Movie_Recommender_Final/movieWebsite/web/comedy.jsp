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
                    <div class="col-1-2">
                        <div class="wrap-col f-right">
                            <ul>
                                <li></li>
                                <li></li>
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
                                <li><a href="single.jsp">SEARCH</a></li>
                                <li class="active"><a href="comedy.jsp">Genre</a></li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="login.jsp">SIGNOUT</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <div class="copyrights">Collect from Kaggle Dataset</div>

    <!--////////////////////////////////////Container-->
    <section id="container">
        <div class="wrap-container zerogrid">
            <div id="main-content" class="col-2-3">
                <div class="wrap-content">
                    <div class="movie">
                        <div class="row type">
                            <div class="title">
                                <center><h2>HOT MOVIES</h2></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co1.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Rush Hour 3" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                        <a href="single.jsp?movie_title=Rush Hour 3">
                                            <h3>Rush Hour 3</h3>
                                            <p>&nbsp;</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co2.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Wild Wild West" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Wild Wild West">
                                            <h3>Wild Wild West</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co3.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Big Hero 6" class="info" title="Full Image"><img  src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Big Hero 6">
                                            <h3>Big Hero 6</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co4.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Charlie and the Chocolate Factory" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Charlie and the Chocolate Factory">
                                            <h3>Charlie and the Chocolate Factory </h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co5.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Ratatouille" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Ratatouille">
                                            <h3>Ratatouille</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co6.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Night at the Museum: Battle of the Smithsonian" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Night at the Museum: Battle of the Smithsonian">
                                            <h3>Night at the Museum: Battle of the Smithsonian </h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co7.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Frozen" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Frozen">
                                            <h3>Frozen</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/co8.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Dark Shadows" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Dark Shadows">
                                            <h3>Dark Shadows</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <center></center>
                    </div>
                </div>
            </div>
            <div id="sidebar" class="col-1-3">
                <div class="wrap-sidebar">
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
                            <h5>Hot Updates</h5>
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
                    <div class="widget wid-post">
                        <div class="wid-header">
                            <h5>Upcoming movies</h5>
                        </div>
                        <div class="wid-content">
                            <div class="post">
                                <a href="#"><img src="images/90.jpg"/></a>
                                <div class="wrapper">
                                    <a href="#">
                                        <h6>Office Christmas Party</h6>
                                    </a>
                                    <p>December 8th, 2016</p>
                                    <a href="#"><img src="images/star.png" /></a>
                                </div>
                            </div>
                            <div class="post">
                                <a href="#"><img src="images/91.jpeg"/></a>
                                </br>
                                <div class="wrapper">
                                    <a href="#">
                                        <h6>Rogue One: A Star Wars Story</h6>
                                    </a>
                                    <p>December 15, 2016</p>
                                    <a href="#"><img src="images/star.png" /></a>
                                </div>
                            </div>
                            <div class="post">
                                <a href="#"><img src="images/92.jpg"/></a>
                                <div class="wrapper">
                                    <a href="#">
                                        <h6>Assassin's Creedy</h6>
                                    </a>
                                    <p>December 11, 2016</p>
                                    <a href="#"><img src="images/star.png" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!---- Start Widget ---->

                </div>
            </div>
        </div>
    </section>

    <!--////////////////////////////////////Footer-->
    <footer>
        <div class="zerogrid">

        </div>
        <div class="bottom-footer">
            <div class="wrap-bottom ">
                <div class="copyright">
                    <p>©2016<a href="https://github.com/aparecerale/CPA" target="_blank" title="模板之家">CPA</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">online sources</a></p>
                </div>
            </div>
        </div>
    </footer>


</div>
<script src="js/css3-mediaqueries.js"></script>
<script src="js/jquery.min.js"></script>
</body></html>