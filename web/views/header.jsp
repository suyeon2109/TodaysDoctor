<%@page import="com.doctor.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>오늘의 닥터 - 국내 1위 병원 예약페이지</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
   <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
   <meta name="author" content="FREEHTML5.CO" />

   <!-- Facebook and Twitter integration -->
   <meta property="og:title" content=""/>
   <meta property="og:image" content=""/>
   <meta property="og:url" content=""/>
   <meta property="og:site_name" content=""/>
   <meta property="og:description" content=""/>
   <meta name="twitter:title" content="" />
   <meta name="twitter:image" content="" />
   <meta name="twitter:url" content="" />
   <meta name="twitter:card" content="" />

   <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
   <link rel="shortcut icon" href="favicon.ico">
  <!-- Animate.css -->
   <link rel="stylesheet" href="/todaysDoctor/views/css/animate.css">
   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="/todaysDoctor/views/css/icomoon.css">
   <!-- Simple Line Icons -->
   <link rel="stylesheet" href="/todaysDoctor/views/css/simple-line-icons.css">
   <!-- Magnific Popup -->
   <link rel="stylesheet" href="/todaysDoctor/views/css/magnific-popup.css">
   <!-- Bootstrap  -->
   <link rel="stylesheet" href="/todaysDoctor/views/css/bootstrap.css">

   <!-- 
   Default Theme Style 
   You can change the style.css (default color purple) to one of these styles
   
   1. pink.css
   2. blue.css
   3. turquoise.css
   4. orange.css
   5. lightblue.css
   6. brown.css
   7. green.css
   -->

   <link rel="stylesheet" href="/todaysDoctor/views/css/style.css">
   <!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
   <link rel="stylesheet" id="theme-switch" href="/todaysDoctor/views/css/style.css">
   <!-- End demo purposes only -->
   <link rel="stylesheet" href="/todaysDoctor/views/css/mainStyle.css">
      <script src=views/js/jquery-3.4.1.min.js></script>
    
</head>



   <script src="views/js/modernizr-2.6.2.min.js"></script>
   <!-- jQuery -->
   <script src="views/js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script src="views/js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <script src="views/js/bootstrap.min.js"></script>
   <!-- Waypoints -->
   <script src="views/js/jquery.waypoints.min.js"></script>
   <!-- Stellar Parallax -->
   <script src="views/js/jquery.stellar.min.js"></script>
   <!-- Counter -->
   <script src="views/js/jquery.countTo.js"></script>
   <!-- Magnific Popup -->
   <script src="views/js/jquery.magnific-popup.min.js"></script>
   <script src="views/js/magnific-popup-options.js"></script>

   <!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
   <script src="views/js/jquery.style.switcher.js"></script>

<body>
    <header role="banner" id="fh5co-header">
            <div class="container">
                <div class="row">
                <nav class="navbar navbar-default">
                <div class="navbar-header">
                    <!-- Mobile Toggle Menu Button -->
                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                <a class="navbar-brand" href="/todaysDoctor/views/main.jsp">오늘의 닥터</a> 
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">   
                    <li><a href="#" onclick="reservation();" ><span>예약하기</span></a></li>
               <li><a href="#" onclick="review();"><span>병원후기</span></a></li>
               <li><a href="#" onclick="medicalCheck();"><span>건강정보</span></a></li>
               <%if(user != null) { %>
                  <li><a href="#" onclick="myPage();"><span>마이페이지</span></a></li>
                  <li><a href="#" onclick="logout();"><span>로그아웃</span></a></li>
               <%}else { %>
                       <li><a href="/todaysDoctor/views/login.jsp" onclick="login();"><span>로그인</span></a></li>
                    <%} %>
                       <script>
                        function reservation(){
                           location.href = "/todaysDoctor/selectList.ho";
                        }
         
                        function review(){
                            <%if( user !=null) { %>
                               location.href = "/todaysDoctor/rList.su";
                            <%} else {%>
                               alert("로그인이 필요합니다");
                               location.href = "/todaysDoctor/views/login.jsp";
                            <%}%>
                        }
         
                        function medicalCheck(){
                           location.href = "/todaysDoctor/views/medicalCheck.jsp";
                        }
         
                        function myPage(){
                           location.href = "/todaysDoctor/favoriteList.my";
                        }
                        
                        function login(){
                           location.href = "/todaysDoctor/views/login.jsp";
                        }
                        
                        function logout(){
                                 location.href = "/todaysDoctor/logout.me";
                             }
                  </script>
                    </ul>
                </div>
                </nav>
            </div>
            </div>
    </header>

    <section id="fh5co-home" data-section="home" style="background-image: url(/todaysDoctor/views/images/doctor.jpg);" data-stellar-background-ratio="0.5">
      <div class="gradient"></div>
    </section>
    
    
</body>
</html>