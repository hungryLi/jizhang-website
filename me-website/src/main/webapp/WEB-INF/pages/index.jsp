<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>hungryLi</title>

        <!-- CSS -->
        <!-- files -->
        <link href="styles/css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/css/magnific-popup.css" rel="stylesheet">
        <link href="styles/css/owl.carousel.css" rel="stylesheet">
        <link href="styles/css/owl.carousel.theme.min.css" rel="stylesheet">
        <link href="styles/css/ionicons.css" rel="stylesheet">
        <link href="styles/css/main.css" rel="stylesheet">
        <link href="styles/font-awesome/css/font-awesome.css" rel="stylesheet"/>
        <!--
        	流式布局img的css
        -->
       <!--  <link href="styles/css/listpiccss/main.css" rel="stylesheet"> -->
        <link href="styles/css/listpiccss/main2.css" rel="stylesheet">
        <link href="styles/css/listpiccss/style.css" rel="stylesheet">

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

    <!-- Site Header -->
    	<jsp:include page="comm.jsp" flush="true"/>
        <div class="site-header-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <a href="index.html"><img src="styles/images/logo.png" alt="logo"></a>
                    </div>
                    <div class="col-sm-3 col-sm-offset-3 text-right" id="userInfo">
                    		<c:if test="${not empty userinfo}">
                         	欢迎：<a href="#" style="color: white;"> ${userinfo.userName}</a> / <a class="logout" style="color: white;" href="/logout">Logout</a>
                         	</c:if>
                         	<c:if test="${empty userinfo}">
	                         	<a href="javascript:void(0);" onclick="popLogin();" style="color: #777;"><span class="glyphicon glyphicon-user"></span> 登录</a>
	                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        
    <!-- Header -->

        <section id="header" class="main-header">
            <div class="container">

                <div class="row">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#site-nav-bar" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="collapse navbar-collapse" id="site-nav-bar">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="/">首页</a></li>
                                <li><a href="/nav/time">点滴</a></li>
                                <li><a href="javascript:void(0);">记录</a></li>
                                <li><a href="javascript:void(0);">简历</a></li>
                                <li><a href="javascript:void(0);">联系我</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </nav>
                </div>
                
                <div class="intro row">
                    <div class="overlay"></div>
                    <div class="col-sm-6 col-sm-offset-6">
                        <h2 class="header-quote">Save time and lower</h2>
                        <p>
                            Your sweeping costs with the
                        </p>
                        <h1 class="header-title">Robot<br><span class="thin">Factory</span></h1>
                    </div>
                </div> <!-- /.intro.row -->
            </div> <!-- /.container -->
            <div class="nutral"></div>
        </section> <!-- /#header -->

        <section id="product" class="product">
            <div class="container section-bg">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="title-box">
                            <h2 class="title">生活嘛 <span>需要点滴色彩</span></h2>
                            <a href="/nav/time" class="btn btn-default btn-robot">查看更多</a>
                        </div>
                    </div>
                </div>
                
                <div class="row" >
                	<div id="main" role="main" page="index">
	                    <ul id="tiles" class="tiles-wrap animated">
				        <!-- These are our grid blocks -->
					        <!-- <li onClick="location.href='single-page.html';">
					        	<img src="styles/images/pics/img1.jpg" width="200" height="200">
					        	<div class="post-info">
					        		<div class="post-basic-info">
						        		<h3><a href="#">Animation films</a></h3>
						        		<span><a href="#"><label> </label>Movies</a></span>
						        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
					        		</div>
					        		<div class="post-info-rate-share">
					        			<div class="rateit">
					        				<span> </span>
					        			</div>
					        			<div class="post-share">
					        				<span> </span>
					        			</div>
					        			<div class="clear"> </div>
					        		</div>
					        	</div>
					        </li>
					        <li onClick="location.href='single-page.html';">
					        	<img src="styles/images/pics/img2.jpg" width="200" height="299">
								<div class="post-info">
					        		<div class="post-basic-info">
						        		<h3><a href="#">Animation films</a></h3>
						        		<span><a href="#"><label> </label>Movies</a></span>
						        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
					        		</div>
					        		<div class="post-info-rate-share">
					        			<div class="rateit">
					        				<span> </span>
					        			</div>
					        			<div class="post-share">
					        				<span> </span>
					        			</div>
					        			<div class="clear"> </div>
					        		</div>
					        	</div>
							</li>
					        <li onClick="location.href='single-page.html';">
					        	<img src="styles/images/pics/img3.jpg" width="200" height="214">
					        	<div class="post-info">
					        		<div class="post-basic-info">
						        		<h3><a href="#">Animation films</a></h3>
						        		<span><a href="#"><label> </label>Movies</a></span>
						        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
					        		</div>
					        		<div class="post-info-rate-share">
					        			<div class="rateit">
					        				<span> </span>
					        			</div>
					        			<div class="post-share">
					        				<span> </span>
					        			</div>
					        			<div class="clear"> </div>
					        		</div>
					        	</div>
					        </li>
					        <li onClick="location.href='single-page.html';">
					        	<img src="styles/images/pics/img4.jpg" width="200" height="333">
					        	<div class="post-info">
					        		<div class="post-basic-info">
						        		<h3><a href="#">Animation films</a></h3>
						        		<span><a href="#"><label> </label>Movies</a></span>
						        		<p>Lorem Ipsum is simply dummy text of the printing & typesetting industry.</p>
					        		</div>
					        		<div class="post-info-rate-share">
					        			<div class="rateit">
					        				<span> </span>
					        			</div>
					        			<div class="post-share">
					        				<span> </span>
					        			</div>
					        			<div class="clear"> </div>
					        		</div>
					        	</div>
					        </li> -->
				        </ul>
                    
                    </div>
                </div>
            </div>
        </section>
        <div style="clear: both;"></div>
    <!-- Partner -->
        <section id="partner" class="partner">
            <div class="container section-bg">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="title-box">
                            <p>我的</p>
                            <h2 class="title mt0">一些图片</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="boxed">
                       <div class="col-sm-12">
                           <div id="partner-slider" class="owl-carousel">
                                <div class="item">
                                    <img src="styles/images/6.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/7.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/8.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/9.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/6.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/7.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/8.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/9.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/6.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/7.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/8.png" alt="partner">
                                </div>
                                <div class="item">
                                    <img src="styles/images/9.png" alt="partner">
                                </div>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
        </section>


    <!-- Footer -->
        <footer class="footer text-center">
            <h3> copyRight: LIKANG，91kangs.cn </h3>
        </footer>

    <!-- Scripts -->
        <script src="styles/js/jquery-1.12.3.min.js"></script>
        <script src="styles/js/bootstrap.min.js"></script>
        <script src="styles/js/jquery.magnific-popup.min.js"></script>
        <script src="styles/js/owl.carousel.min.js"></script>
        <script src="styles/js/script.js"></script>
		<script type="text/javascript" src="styles/js/listpicJs/jquery.imagesloaded.js" ></script>
		<script type="text/javascript" src="styles/js/wookmark.js" ></script>
		<script src="${pageContext.request.contextPath}/pages/comm/js/index.js"></script>
		
		<!--
        	流式布局的js效果
        -->
		<script type="text/javascript">
		    // (function ($){
		      /* var $tiles = $('#tiles'),
		          $handler = $('li', $tiles),
		          $main = $('#main'),
		          $window = $(window),
		          $document = $(document),
		          options = {
		            autoResize: true, // This will auto-update the layout when the browser window is resized.
		            container: $main, // Optional, used for some extra CSS styling
		            offset: 20, // Optional, the distance between grid items
		            itemWidth:280 // Optional, the width of a grid item
		          }; */
		      /**
		       * Reinitializes the wookmark handler after all images have loaded
		       */
		     /*  function applyLayout() {
		        $tiles.imagesLoaded(function() {
		          // Destroy the old handler
		          if ($handler.wookmarkInstance) {
		            $handler.wookmarkInstance.clear();
		          }
		
		          // Create a new layout handler.
		          $handler = $('li', $tiles);
		          $handler.wookmark(options);
		        });
		      } */
		      // Call the layout function for the first time
		    /*   applyLayout();
		      // Capture scroll event.
		    })(jQuery); */
		  </script>
    </body>
</html>