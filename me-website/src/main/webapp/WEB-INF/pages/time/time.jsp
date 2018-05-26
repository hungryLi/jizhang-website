<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Time</title>

        <!-- CSS -->
        <!-- files -->
        <link href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/css/magnific-popup.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/css/owl.carousel.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/css/owl.carousel.theme.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/css/ionicons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/css/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/font-awesome/css/font-awesome.css" rel="stylesheet">

        <!--
        	流式布局img的css
        -->
        <link href="${pageContext.request.contextPath}/styles/css/listpiccss/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/styles/css/listpiccss/style.css" rel="stylesheet">
		<style type="text/css">
			footer{
				position: fixed;bottom: 2px;width: 100%;
			}
		</style>
</head>
<body>
	
    <!-- Site Header -->
    <jsp:include page="./../comm.jsp" flush="true"/>
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
                        <!-- <span class="ion-android-cart"></span> 0 products
                        <form>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="">
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-robot" type="button">Search</button>
                                </span>
                            </div>
                        </form> -->
                    </div>
                </div>
            </div>
        </div>
        
    <!-- Header -->

        <section id="header" class="main-header about-header inner-header">
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
                                <li><a href="/">首页</a></li>
                                <li class="active"><a href="/nav/time">点滴</a></li>
                                <li><a href="javascript:void(0);">记录</a></li>
                                <li><a href="javascript:void(0);">简历</a></li>
                                <li><a href="javascript:void(0);">联系我</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </nav>
                </div>
                
                <div class="intro row">
                    <div class="overlay"></div>
                    <div class="col-sm-12">
                        <ol class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="active">About</li>
                        </ol>
                    </div>
                </div> <!-- /.intro.row -->
            </div> <!-- /.container -->
            <div class="nutral"></div>
        </section> <!-- /#header -->

    <!-- About -->
        <section class="about">
            <div class="container page-bgc">

            <!-- Services -->
                <div class="service">
                    <div class="row">
						
						<div id="main" role="main">
	                    <ul id="tiles">
				        <!-- These are our grid blocks -->
					       <%--  <li onClick="location.href='single-page.html';">
					        	<img src="${pageContext.request.contextPath}/styles/images/pics/img1.jpg" width="200" height="200">
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
					        	<img src="${pageContext.request.contextPath}/styles/images/pics/img2.jpg" width="200" height="299">
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
					        	<img src="${pageContext.request.contextPath}/styles/images/pics/img3.jpg" width="200" height="214">
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
					        	<img src="${pageContext.request.contextPath}/styles/images/pics/img4.jpg" width="200" height="333">
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
					        </li> --%>
				        </ul>
                    
                    </div>
						
                    </div>
                </div>


            <!-- Team -->

            <!-- CTA -->

            </div>
        </section>
    	<!-- Footer -->
        <footer class="footer text-center">
            <h3> copyRight: LIKANG，91kangs.cn </h3>
        </footer>

    	<!-- Scripts -->
        <script src="${pageContext.request.contextPath}/styles/js/jquery-1.12.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/styles/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/styles/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/styles/js/script.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/listpicJs/jquery.imagesloaded.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/wookmark.js" ></script>
    	<script src="${pageContext.request.contextPath}/pages/comm/js/comm.js"></script>
    	<script src="${pageContext.request.contextPath}/pages/time/time.js"></script>
    	
    	<!--
        	流式布局的js效果
        -->
        <script type="text/javascript">
        	 /* var wookmark1 = new Wookmark('#tiles', {
	          outerOffset: 40, // Optional, the distance to the containers border
	          itemWidth: 280, // Optional, the width of a grid item
	          offset:20
			});  */
        </script>
		<script type="text/javascript">
			$(function() {  
	            var winH = $(window).height(); //页面可视区域高度  
	            var i = 1;  
	            var p=0;t=0;
	            $(window).scroll(function() {  
	                var pageH = $(document.body).height();  
	                var scrollT = $(window).scrollTop(); //滚动条top  
	                var aa = pageH - winH - scrollT;  // 距离底部的距离
	                //var aa = (pageH - winH - scrollT) / winH;  
	                p = $(this).scrollTop();
	                if (aa == 0 && t<=p) {  
	                	initList();
	                }  
	                t = p;
	            });  
	        });  
		</script>
    	
</body>
</html>