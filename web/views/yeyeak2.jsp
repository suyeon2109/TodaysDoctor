<%@page import="com.doctor.hospital.model.vo.Hospital"%>
<%@page import="com.doctor.reserve.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Reservation r = (Reservation)request.getAttribute("Reservation");
%>
<!DOCTYPE html>

<%@ include file="header.jsp" %> 

<link rel="stylesheet" href="css/mainStyle.css">

   <!-- Modernizr JS -->
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->

   <body>
   <section id="fh5co-contact" data-section="contact">
   <form class="form-inline" method="get" action="/todaysDoctor/resCh.res">  
      <div class="container">
         <div class="row">
   
            <div class="row">
            
         </div>
      </div>
   
      <section id="fh5co-person" data-section="person">
      <div class="container">
         <div class="row">
               <div class="col-md-12 text-center">
                   <h1 class="to-animate"> 예약이 <font color="#52d3aa">완료</font> 되었습니다</h1>
               </div>
         </div>
         
         <div class="fh5co-person to-animate">
            <input id="rno" type="hidden" name="resHospitalNo" class="fh5co-position" value="<%= r.getResNum() %>">                                 
               <h3 style="color: black" id="name"><i class="icon-user"></i>&nbsp;<%= r.getUserName() %> 님</h3>
               <br>
               <input id="rno" type="hidden" name="rho" class="fh5co-position" value="<%= r.getResNum() %>">                                
               <p><i class="icon-hospital-o"></i>&nbsp; 병원명 : <%= r.getHpName() %></p>
               <p><i class="icon-home"></i>&nbsp; 주소 : <%= r.getHpArea() %> <%= r.getHpAddress() %> </p>
               <p><i class="icon-phone"></i>&nbsp; 전화번호 : <%= r.getHpPhone() %></p>
               <p><i class="icon-clock2"></i>&nbsp; 예약 시간 :  <%= r.getResTime() %> : 
               <%if(r.getResMin() == 30){%>
               			 <%= r.getResMin()%>
                <%}else{ %>
                00
                <%} %>
                </p>
               <p><i class="icon-comment-o"></i>&nbsp; 증상 : <%= r.getResContent() %></p>
           </div> 
       
      </div>
 
   
  
   
      </div>
   </form>
   
    <!--버튼-->
      <br><br>
      <div class="col-md-1 section-heading text-center">
            <div class="form-group to-animate">
                <input class="btn btn-primary btn-lg" value="HOME" type="submit" onclick="homeMove();">
                <script>
                   function homeMove(){
                      location.href = "views/main.jsp";
                   }
                </script>
                &nbsp;
            </div>
        </div>
   </section>
   
      </body>
      <%@ include file="footer.jsp" %> 
   </html>