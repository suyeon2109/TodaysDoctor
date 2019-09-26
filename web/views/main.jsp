<%@page import="com.doctor.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

   <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>오늘의 닥터 - 국내 1위 병원 예약페이지</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
   <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
   <meta name="author" content="FREEHTML5.CO" />

  <!-- 
   //////////////////////////////////////////////////////

   FREE HTML5 TEMPLATE 
   DESIGNED & DEVELOPED by FREEHTML5.CO
      
   Website:       http://freehtml5.co/
   Email:          info@freehtml5.co
   Twitter:       http://twitter.com/fh5co
   Facebook:       https://www.facebook.com/fh5co

   //////////////////////////////////////////////////////
    -->

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


   <style>
   /* For demo purpose only */
   
   /* For Demo Purposes Only ( You can delete this anytime :-) */
   
   #colour-variations {
      padding: 10px;
      -webkit-transition: 0.5s;
        -o-transition: 0.5s;
        transition: 0.5s;
      width: 140px;
      position: fixed;
      left: 0;
      top: 100px;
      z-index: 999999;
      background: #fff;
      /*border-radius: 4px;*/
      border-top-right-radius: 4px;
      border-bottom-right-radius: 4px;
      -webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
      -moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
      -ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
      box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
   }
   #colour-variations.sleep {
      margin-left: -140px;
   }
   #colour-variations h3 {
      text-align: center;;
      font-size: 11px;
      letter-spacing: 2px;
      text-transform: uppercase;
      color: #777;
      margin: 0 0 10px 0;
      padding: 0;;
   }
   #colour-variations ul,
   #colour-variations ul li {
      padding: 0;
      margin: 0;
   }
   #colour-variations li {
      list-style: none;
      display: block;
      margin-bottom: 5px!important;
      float: left;
      width: 100%;
   }
   #colour-variations li a {
      width: 100%;
      position: relative;
      display: block;
      overflow: hidden;
      -webkit-border-radius: 4px;
      -moz-border-radius: 4px;
      -ms-border-radius: 4px;
      border-radius: 4px;
      -webkit-transition: 0.4s;
      -o-transition: 0.4s;
      transition: 0.4s;
   }
   #colour-variations li a:hover {
        opacity: .9;
   }
   #colour-variations li a > span {
      width: 33.33%;
      height: 20px;
      float: left;
      display: -moz-inline-stack;
      display: inline-block;
      zoom: 1;
      *display: inline;
   }
   

   .option-toggle {
      position: absolute;
      right: 0;
      top: 0;
      margin-top: 5px;
      margin-right: -30px;
      width: 30px;
      height: 30px;
      background: #f64662;
      text-align: center;
      border-top-right-radius: 4px;
      border-bottom-right-radius: 4px;
      color: #fff;
      cursor: pointer;
      -webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
      -moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
      -ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
      box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
   }
   .option-toggle i {
      top: 2px;
      position: relative;
   }
   .option-toggle:hover, .option-toggle:focus, .option-toggle:active {
      color:  #fff;
      text-decoration: none;
      outline: none;
   }
   * {
      font-family: "나눔바른고딕";
   }

   .to-animate {
      font-family: "나눔바른고딕";
   }

   h2 {
      font-family: "나눔바른고딕";
   }

   a {
      font-family: "나눔바른고딕";
   }
   </style>
   <!-- End demo purposes only -->


   <!-- Modernizr JS -->
   <script src="views/js/modernizr-2.6.2.min.js"></script>
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->

   </head>
   <body>
   
   <header role="banner" id="fh5co-header">
         <div class="container">
            <div class="row">
             <nav class="navbar navbar-default">
              <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                <%if( user ==null) { %>
                  <li><a href="/todaysDoctor/views/login.jsp" data-nav-section="work" onclick="login();"><span>로그인</span></a></li>
               <li><a href="/todaysDoctor/views/signUp.jsp" data-nav-section="testimonials" onclick="signUp();"><span>회원가입</span></a></li>
               <%} else { %>
               <li><a href="#" data-nav-section="work" onclick="myPage();"><span>마이페이지</span></a></li>
               <li><a href="/todaysDoctor/views/signUp.jsp" data-nav-section="testimonials" onclick="logout();"><span>로그아웃</span></a></li>
               
               <%} %>
               
               <script>
                     function login(){
                        location.href = "/todaysDoctor/views/login.jsp";
                    }

                    function signUp(){
                        location.href = "/todaysDoctor/views/signUp.jsp";
                    }
                     
                    function myPage(){
                        location.href = "/todaysDoctor/favoriteList.my";
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
      <div class="container">
         <div class="text-wrap">
            <div class="text-inner">
               <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                     <h2 class="to-animate"><i>Today's Doctor</i></h2>   
                     <h1 class="to-animate">오늘의 닥터</h1>
                     <h2 class="to-animate">병원 예약과 후기, 건강정보까지 한눈에!</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="slant"></div>
   </section>

   <section id="fh5co-intro">
      <div class="container">
         <div class="row row-bottom-padded-lg" style="margin:auto">
            <div class="fh5co-block to-animate" style="background-image: url(/todaysDoctor/views/images/reservation.jpg);">
               <div class="overlay-darker"></div>
               <div class="overlay"></div>
               <div class="fh5co-text">
                  <img class="medical-icon" src="/todaysDoctor/views/images/reservation.png" width="70px" height="70px"><br><br>
                  <h2>예약</h2>
                  <p>지금 예약 가능한 병원을 찾아<br>원하는 시간대에 예약해보세요</p>
                  <p><a href="/todaysDoctor/selectList.ho" class="btn btn-primary">예약하러 가기</a></p>
               </div>
            </div>
            <div class="fh5co-block to-animate" style="background-image: url(/todaysDoctor/views/images/review.jpg);">
               <div class="overlay-darker"></div>
               <div class="overlay"></div>
               <div class="fh5co-text">
                  <img class="medical-icon" src="/todaysDoctor/views/images/review.png" width="70px" height="70px"><br><br>
                  <h2>후기</h2>
                  <p>다른 사람의 후기를 보고,<br>병원을 예약해보세요</p>
                  <p><a href="#" class="btn btn-primary" onclick="review();">병원 후기 보러가기</a></p>
               </div>
            </div>
            <div class="fh5co-block to-animate" style="background-image: url(/todaysDoctor/views/images/healthInfo.jpg);">
               <div class="overlay-darker"></div>
               <div class="overlay"></div>
               <div class="fh5co-text">
                  <img class="medical-icon" src="/todaysDoctor/views/images/healthInfo.png" width="70px" height="70px"><br><br>
                  <h2>건강정보</h2>
                  <p>생활 속 다양한 건강 꿀팁들이 가득! 현재 나의 건강 상태는 어떨까요?</p>
                  <p><a href="/todaysDoctor/views/medicalCheck.jsp" class="btn btn-primary">건강정보 보러가기</a></p>
               </div>
            </div>
         </div>
      </div>
   </section>
   
   <script>   
   
      function review(){
         <%if( user !=null) { %>
            location.href = "/todaysDoctor/rList.su";
         <%} else {%>
            alert("로그인이 필요합니다");
            location.href = "/todaysDoctor/views/login.jsp";
         <%}%>
      }
   
   </script>
   
   
   
   

   <footer id="footer" role="contentinfo">
         <a href="#" class="gotop js-gotop">To<i class="icon-arrow-up2">Top</i></a>
         <div class="container">
            <div class="">
             <div class="col-md-12 text-left">
               <hr style="border: solid 2px #52d3aa" width="100px" align="left">
               <p><font size="5">(주)오늘의 닥터 </font><br>
               <font color="#52d3aa">주소 : </font>서울시 강남구 테헤란로14길 6 &nbsp;
               <font color="#52d3aa">대표자 : </font>문열그조<br>
               <font color="#52d3aa">사업자등록번호 : </font>902-81-02019 &nbsp;
               <font color="#52d3aa">E-mail : </font>openthedoor@open.com<br>
               &copy; 2019 OpenTheDoor All Rights Reserved.</p>         
             </div>
            </div>
         </div>
        </footer>
   
   <!-- End demo purposes only -->

   <script src=views/js/jquery-3.4.1.min.js></script>
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
   <script>
      $(function(){
         $('#colour-variations ul').styleSwitcher({
            defaultThemeId: 'theme-switch',
            hasPreview: false,
            cookie: {
                   expires: 30,
                   isManagingLoad: true
               }
         });   
         $('.option-toggle').click(function() {
            $('#colour-variations')W.toggleClass('sleep');
         });
      });
   </script>
   <!-- End demo purposes only -->

   <!-- Main JS (Do not remove) -->
   <script src="views/js/main.js"></script>

   </body>
</html>
