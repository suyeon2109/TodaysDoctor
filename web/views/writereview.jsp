<%@page import="com.doctor.reserve.model.vo.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Reservation reservation = (Reservation)request.getAttribute("reservation"); %>
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

<body>
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
      
      <form onsubmit="return reviewInsert();" role="form" method="post" action="/todaysDoctor/rInsert.su" >      
         <div class="container">
            <div class="row">
               <div class="form-inline col-md-1 section-heading text-center to-animate">
               		<div id="reservationInfo">
               			<div id="reservationContents">
               				<i class="icon-user"></i><font size="5" color="#52d3aa">&nbsp;회원진료정보&nbsp;</font><i class="icon-user"></i><br>
               				<hr width="50%">
               				<div id="contents"></div>
               				<div id="contents">       
               					<input type="hidden" name="resNum" value="<%=reservation.getResNum()%>">  
               					<input type="hidden" name="hpCode" value="<%=reservation.getHpCode()%>">  
               					<input type="hidden" name="hpName" value="<%=reservation.getHpName()%>"> 
               					<input type="hidden" name="resDate" value="<%=reservation.getResDate()%>">  				
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
                             
                  <!-- <h3>
                     <strong>회원진료정보</strong>
                  </h3>
                  <div class="form-group">
                     <input id="name" class="form-control" placeholder="이름" type="text">
                      
                      
                     <input style="color: #999" placeholder="datetime input" type="date" class="form-control" name="reDate">
                  </div>
                  <br><br> 
                  <select style="color: #999" class="form-control" id="search1" type="text">
                     
                    
                  </select> &nbsp; 
                  <select style="color: #999" class="form-control" id="search2">
                     <option hidden>지역</option>
                    
                  </select> &nbsp; 
                  <input class="form-control" type="text" id="search3" placeholder="병원명" name="hpName"> &nbsp;

                  <div class="form-group">
                     
                  </div> -->
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

                     <input type="radio" name="hpPoint1" value="5"/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="4"/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="3"/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="2"/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint1" value="1"/>
                     <font>매우불만족</font>
                  
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/nurse.png">&nbsp;&nbsp;<span> 간호사친절성은 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="hpPoint2" value="5" />
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="4"/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="3"/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="2"/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint2" value="1"/>
                     <font>매우불만족</font>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/clean.png">&nbsp;&nbsp;<span> 청결성은 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="hpPoint3" value="5"/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="4"/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="3"/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="2"/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint3" value="1"/>
                     <font>매우불만족</font>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/time.png">&nbsp;&nbsp;<span> 대기시간 만족도는 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="hpPoint4" value="5"/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="4"/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="3"/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="2"/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint4" value="1"/>
                     <font>매우불만족</font>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <img src="/todaysDoctor/views/icon/money.png">&nbsp;&nbsp;<span>가격 만족도는 어떠셨나요?</span>
      
                     <br><br>
      
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="hpPoint5" value="5"/>
                     <font>매우만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="4"/>
                     <font>만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="3"/>
                     <font>보통</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="2"/>
                     <font>불만족</font>&nbsp;&nbsp;&nbsp;&nbsp;
      
                     <input type="radio" name="hpPoint5" value="1"/>
                     <font>매우불만족</font>
      
                     <br><br>

               </div>

               <br>
               <input class="form-control" type="text" id="search3" placeholder="제목(작성한 글은 후기게시판에 게시됩니다)" name="reTitle"><br>
               <textarea class="form-control" cols="5" rows="5" placeholder="후기를 작성해주세요.(200자 이하)" maxlength="200" name="review"></textarea>
               <br><br><br>
            </div>
         </div>
         <br><br>
           
         <div class="form-group text-center to-animate">
            <input class="btn btn-primary btn-lg" value="제출하기" type="submit">
         </div> 
      </form>
      <script>
         function reviewInsert() {
            
            var checkedRadio = $("input:radio:checked");   
            

            var title = $("input[name='reTitle']").val(); 
            var review = $("textarea[name='review']").val();


            if (checkedRadio.length != 5) {
               alert("모든 설문에 답하셔야 합니다.");
               return false;
            }else if (title == "") {
               alert("제목을 입력해주세요.");
               return false;
            }else if (review == "") {
               alert("내용을 입력해주세요.");
               return false;
            }else{
               alert("제출되셨습니다.");
            }
         }
      </script>


   </section>
   

</body>
<%@ include file="footer.jsp"%>
</html>