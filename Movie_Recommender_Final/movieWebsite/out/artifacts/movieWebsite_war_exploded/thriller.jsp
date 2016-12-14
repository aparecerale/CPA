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
                                <li class="active"><a href="thriller.jsp">Genre</a></li>
                                <li><a href="contact.html">Contact</a></li>
                                <li><a href="login.jsp">SIGNOUT</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>

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
                                            <img class="thumb" src="images/th1.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Blade: Trinity" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>

                                        </div>
                                        <div class="clear"></div>
                                        <a href="single.jsp?movie_title=Blade: Trinity">
                                            <h3>Blade: Trinity</h3>
                                            <p>&nbsp;</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/th2.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Resident Evil: Retribution" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Resident Evil: Retribution">
                                            <h3>Resident Evil: Retribution</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/th3.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Death Race" class="info" title="Full Image"><img  src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Death Race">
                                            <h3>Death Race</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/th4.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=The Long Kiss Goodnight" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=The Long Kiss Goodnight">
                                            <h3>The Long Kiss Goodnight</h3>
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
                                            <img class="thumb" src="images/th5.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Proof of Life" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Proof of Life">
                                            <h3>Proof of Life</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/th6.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=I, Frankenstein" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=I, Frankenstein">
                                            <h3>I, Frankenstein</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/th7.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Elektra" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Elektra">
                                            <h3>Elektra</h3>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="col-1-4">
                                <div class="wrap-col">
                                    <div class="post">
                                        <div class="view effect">
                                            <img class="thumb" src="images/th8.jpg"  />
                                            <div class="mask">
                                                <a href="single.jsp?movie_title=Sin City: A Dame to Kill For" class="info" title="Full Image"><img src="images/play_button_64.png" /></a>
                                            </div>
                                        </div>
                                        <a href="single.jsp?movie_title=Sin City: A Dame to Kill For">
                                            <h3>Sin City: A Dame to Kill For</h3>
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
                    <p>©2016<a href="https://github.com/aparecerale/CPA" target="_blank" title="Github">CPA</a> - Collect from online sources</p>
                </div>
            </div>
        </div>
    </footer>


</div>
<script src="js/css3-mediaqueries.js"></script>
<script src="js/jquery.min.js"></script>
</body></html>