<%@page import="com.doctor.reserve.model.vo.Reservation"%>
<%@page import="com.doctor.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 	Review review = (Review)request.getAttribute("review");
	Reservation reservation = (Reservation)request.getAttribute("reservation");
%>

<!DOCTYPE html>

<%@ include file="header.jsp"%>

<style>
	#fh5co-home, #fh5co-home .text-wrap { /*상단바*/
	   height: 120px; /*높이*/
	}
	
	#imagestar {
	   /*float: right;*/
	   position: absolute;
	   right: 40px;
	   top: 30px;
	}
	
	.fh5co-person { /*병원정보 박스*/
	   border: 2px solid #52d3aa;
	   padding: 50px 30px 30px 30px;
	   margin: auto;
	   width: 90%;
	   position: relative;
	}
	
	.form-group {
	   margin: auto;
	   position: relative;
	}
	
	#reservationInfo {
		width: 90%;
		height: 270px;
		border: 2px solid lightgray;
		margin: auto;
		font-family: "나눔바른고딕";
		padding: 3px;
		
	}
	
	#reservationContents {
		padding: 20px;
	}
	
	#contents{
		float:left;
		color:black;
		text-align:left;
		padding: 30px;
	}
</style>

<!-- End demo purposes only -->





<!-- Modernizr JS -->



<!-- FOR IE9 below -->

<!--[if lt IE 9]>

   <script src="js/respond.min.js"></script>

   <![endif]-->

<body onload="hpPointChecked();">
   <section id="fh5co-testimonials" data-section="testimonials">
      <div class="container">
         <div class="row">
            <div class="col-md-12 section-heading text-center">
               <h2 class="to-animate">후기 작성</h2>
               <div class="row">
                  <div class="col-md-8 col-md-offset-2 subtext to-animate">
                     <h3>방문했던 병원의 후기를 작성해보세요</h3>
                  </div>
               </div>
            </div>
         </div>
      </div>
      

         <div class="container">
            <div class="row">
               <div class="form-inline col-md-1 section-heading text-center to-animate">
               		<div id="reservationInfo">
               			<div id="reservationContents">
               				<i class="icon-user"></i><font size="5" color="#52d3aa">&nbsp;회원진료정보&nbsp;</font><i class="icon-user"></i><br>
               				<hr width="50%">
               				<div id="contents"></div>
               				<div id="contents">       		
	               				진료과목 : <%=reservation.getHpIndex() %><br>
	               				병원명 : <%=reservation.getHpName() %><br>
	               				지역 : <%=reservation.getHpArea() %>&nbsp;<%=reservation.getHpAddress() %>
	               				</div><div id="contents"></div><div id="contents"></div>
	               				<div id="contents">
	               				의사 : <%=reservation.getHpDoctor() %><br>
	               				예약일 : <%=reservation.getResDate() %><br>
	               				증상 : <%=reservation.getResContent() %>
               				</div>
               			</div>
               		</div>		    
               </div>
            </div>
         </div>
   
         <div class="container">
            <div class="fh5co-person to-animate ">
               <div class="text-center">
                  <font size="10" style="color: black">만족도 조사</font><br>
                  <hr width="50%">
                  <br> <br>
               </div>

               <div class="form-group">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/doctor.png">&nbsp;&nbsp;<span>의사진료만족도는 어떠셨나요?</span>

                        <br><br>

                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" id="hpPoint1Value" value="<%=review.getHpPoint1() %>">
                     <input type="radio" name="hpPoint1" value="5" disabled/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="4" disabled/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="3" disabled/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="2" disabled/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="1" disabled/>
                     <font>매우불만족</font>
                  
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/nurse.png">&nbsp;&nbsp;<span> 간호사친절성은 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="hidden" id="hpPoint2Value" value="<%=review.getHpPoint2() %>">
                     <input type="radio" name="hpPoint2" value="5" disabled/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="4" disabled/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="3" disabled/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="2" disabled/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="1" disabled/>
                     <font>매우불만족</font>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/clean.png">&nbsp;&nbsp;<span> 청결성은 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="hidden" id="hpPoint3Value" value="<%=review.getHpPoint3() %>">
                     <input type="radio" name="hpPoint3" value="5" disabled/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="4" disabled/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="3" disabled/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="2" disabled/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="1" disabled/>
                     <font>매우불만족</font>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/time.png">&nbsp;&nbsp;<span> 대기시간 만족도는 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="hidden" id="hpPoint4Value" value="<%=review.getHpPoint4() %>">
                     <input type="radio" name="hpPoint4" value="5" disabled/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="4" disabled/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="3" disabled/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="2" disabled/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="1" disabled/>
                     <font>매우불만족</font>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/money.png">&nbsp;&nbsp;<span>가격 만족도는 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="hidden" id="hpPoint5Value" value="<%=review.getHpPoint5() %>">
                     <input type="radio" name="hpPoint5" value="5" disabled/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="4" disabled/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="3" disabled/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="2" disabled/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="1" disabled/>
                     <font>매우불만족</font>
      
                     <br><br>

               </div>

               <br>
               <input class="form-control" type="text" id="search3" placeholder="<%=review.getReTitle()%>" name="reTitle" readonly><br>
               <textarea class="form-control" cols="5" rows="5" placeholder="<%=review.getReview()%>" maxlength="200" name="review" readonly></textarea>
               <br><br><br>
            </div>
         </div>
         <br><br>
           
         <div class="form-group text-center to-animate">
            <input class="btn btn-primary btn-lg" value="목록으로" onclick="history.back(-1);">
         </div> 
         
      <script>
         function hpPointChecked() {
             var hpPoint1Value = document.getElementById("hpPoint1Value");
             var hpPoint2Value = document.getElementById("hpPoint2Value");
             var hpPoint3Value = document.getElementById("hpPoint3Value");
             var hpPoint4Value = document.getElementById("hpPoint4Value");
             var hpPoint5Value = document.getElementById("hpPoint5Value");
             
             switch(hpPoint1Value.value){
             	case "1":
             		$('[name=hpPoint1]').eq(4).prop('checked', true);
             		break;
             	case "2":
             		$('[name=hpPoint1]').eq(3).prop('checked', true);
             		break;
             	case "3":
             		$('[name=hpPoint1]').eq(2).prop('checked', true);
             		break;
             	case "4":
             		$('[name=hpPoint1]').eq(1).prop('checked', true);
             		break;
             	case "5":
             		$('[name=hpPoint1]').eq(0).prop('checked', true);
             		break;
             }
             
             switch(hpPoint2Value.value){
	          	case "1":
	          		$('[name=hpPoint2]').eq(4).prop('checked', true);
	          		break;
	          	case "2":
	          		$('[name=hpPoint2]').eq(3).prop('checked', true);
	          		break;
	          	case "3":
	          		$('[name=hpPoint2]').eq(2).prop('checked', true);
	          		break;
	          	case "4":
	          		$('[name=hpPoint2]').eq(1).prop('checked', true);
	          		break;
	          	case "5":
	          		$('[name=hpPoint2]').eq(0).prop('checked', true);
	          		break;
          	}
             
            switch(hpPoint3Value.value){
	          	case "1":
	          		$('[name=hpPoint3]').eq(4).prop('checked', true);
	          		break;
	          	case "2":
	          		$('[name=hpPoint3]').eq(3).prop('checked', true);
	          		break;
	          	case "3":
	          		$('[name=hpPoint3]').eq(2).prop('checked', true);
	          		break;
	          	case "4":
	          		$('[name=hpPoint3]').eq(1).prop('checked', true);
	          		break;
	          	case "5":
	          		$('[name=hpPoint3]').eq(0).prop('checked', true);
	          		break;
          	}
            
            switch(hpPoint4Value.value){
	         	case "1":
	         		$('[name=hpPoint4]').eq(4).prop('checked', true);
	         		break;
	         	case "2":
	         		$('[name=hpPoint4]').eq(3).prop('checked', true);
	         		break;
	         	case "3":
	         		$('[name=hpPoint4]').eq(2).prop('checked', true);
	         		break;
	         	case "4":
	         		$('[name=hpPoint4]').eq(1).prop('checked', true);
	         		break;
	         	case "5":
	         		$('[name=hpPoint4]').eq(0).prop('checked', true);
	         		break;
	        }
            
            switch(hpPoint5Value.value){
	         	case "1":
	         		$('[name=hpPoint5]').eq(4).prop('checked', true);
	         		break;
	         	case "2":
	         		$('[name=hpPoint5]').eq(3).prop('checked', true);
	         		break;
	         	case "3":
	         		$('[name=hpPoint5]').eq(2).prop('checked', true);
	         		break;
	         	case "4":
	         		$('[name=hpPoint5]').eq(1).prop('checked', true);
	         		break;
	         	case "5":
	         		$('[name=hpPoint5]').eq(0).prop('checked', true);
	         		break;
         	}
         }
      </script>
   </section>
   

</body>
<%@ include file="footer.jsp"%>
</html>