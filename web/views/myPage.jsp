<%@page import="com.doctor.reserve.model.vo.Reservation"%>
<%@page import="com.doctor.hospital.model.vo.PageInfo"%>
<%@page import="com.doctor.review.model.vo.Review"%>
<%@page import="com.doctor.hospital.model.vo.Hospital"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	ArrayList<Hospital> hospitalList = (ArrayList<Hospital>)request.getAttribute("favoriteList");
%>
<!DOCTYPE html>
<%@ include file="header.jsp" %> 
    <style>
         .fh5co-person { /*병원정보 박스*/
         border: 2px solid #f2f2f2;
         padding: 50px 30px 30px 30px;
         width: 80%;
         height: 30%;
         float: center;
         margin: auto;
         position: relative;
      }
        #img1 {
         /*float: right;*/
         position: absolute;
         right: 40px;
         top: 30px;
        }


        #reservationDiv {
            width: 100%;
            border: 1px solid lightgray;
            font-family: "나눔바른고딕";
            padding: 3px;
        }

        #reservationContents {
            padding: 20px;
        }

        #cancelButton {
            float: right;
        }

        i {
            font-family: "나눔바른고딕";
        }

        #deleteButton {
            border-radius: 8px;
            background-color: #EAEAEA;
            color: #f64662;
        }

        .form-group {
            margin-left: 18%;
            width: 60%;
        }

        #a {
            float: left;
            width: 33.3%;
        }
        .fh5co-person {
            /*병원정보 박스*/
            border: 2px solid #f2f2f2;
            padding: 50px 30px 30px 30px;
            width: 80%;
            height: 10%;
            margin: auto;
            position: relative;
        }

        /* For demo purpose only */

        /* For Demo Purposes Only ( You can delete this anytime :-) */

 </style>
    <!-- End demo purposes only -->


    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->
    <br><br>
    <div class="container">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#bookmark">즐겨찾는 병원</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">예약 관리</a>
                <div class="dropdown-menu">
                    <font size="4"><a class="dropdown-item" data-toggle="tab" href="#new_reservation" onclick="newReservation();">실시간 예약내역</a>
                    </font>
                    <br>
                    <font size="4"><a class="dropdown-item" data-toggle="tab" href="#old_reservation" onclick="lastReservation();">지난 예약내역</a>
                    </font>
                    <br>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#review" onclick="reviewList();">후기 관리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#updateInfo">내 정보 수정</a>
            </li>
        </ul>
    </div>
    
    <!-- ajax로 탭 페이지 이동 구현 -->   
    <script>
 	// 실시간 예약 내역
    function newReservation(){
    	$.ajax({
    		url:"<%=request.getContextPath()%>/newReservation.my",
    		type:"get",
    		success:function(data){
    			var newReservationHtml = "";
    			if(data.newReservationList != null){
    				for(var index in data.newReservationList){
    					var reservation = data.newReservationList[index];

    					newReservationHtml += "<br><div id='reservationDiv'><div id='reservationContents'>"
    						+ "<input type='hidden' name='resNum' value='" + reservation.resNum + "'>"
							+ "<font size='6' color='black'><span name='hpName'>" + reservation.hpName + "</span></font>"
							+ "<div id='cancelButton'><input class='btn btn-primary btn-lg' value='취소' type='button' name='cancelButton' onclick='cancelReservation(this);' style='width: 50px padding: 6px 10px;'></div><br><hr>"
							+ "<i class='icon-home'></i>&nbsp;&nbsp;주소 : " + reservation.hpArea + " " + reservation.hpAddress
							+ "<br><i class='icon-phone'></i>&nbsp;&nbsp;번호 : " + reservation.hpPhone
							+ "<br><i class='icon-clock2'></i>&nbsp;&nbsp;예약일 : "
							+ "<span name='resMonth'>" +reservation.resMonth + "</span>월<span name='resDay'>" + reservation.resDay + "</span>일 " + "<span name='resTime'>" +reservation.resTime + "</span>" +"시 " + "<span name='resMin'>" + reservation.resMin + "</span>" +"분"
							+ "<br><i class='icon-comment-o'></i>&nbsp;&nbsp;증상 : " + reservation.resContent
							+ "</div></div>";
    				}
    				$('#new_reservation').html(newReservationHtml);				
    			}else{
    				$('#new_reservation').html("<br><h3><font color='gray'>실시간 예약 내역이 없습니다.</font></h3>");
    			}
    		},error:function(request,status,error){
				alert("통신실패");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
    	});
    }
   		
	// 지난 예약 내역
 	function lastReservation() {
 		$.ajax({
 			url:"<%=request.getContextPath()%>/lastReservation.my",
 			type:"get",
 			success:function(data){
 				if(data.lastReservationList != null){
 					var oldReservationHtml = "<br><table class='table table-striped'>"
										+ "<tr><th>진료과목</th><th>병원명</th><th>지역</th><th>원장</th><th>예약일</th><th>&nbsp;&nbsp;후기</th></tr>";
										
 					for(var index in data.lastReservationList){
 						var reservation = data.lastReservationList[index];
						
 						oldReservationHtml += "<input type='hidden' name='lastResNum' value='" + reservation.resNum + "'>"
 											+ "<tr><td>" + reservation.hpIndex + "</td>"
 											+ "<td>" + reservation.hpName + "</td>"
 											+ "<td>" + reservation.hpArea + "</td>"
 											+ "<td>" + reservation.hpDoctor + "</td>"
 											+ "<td>" + reservation.resYear +"." + reservation.resMonth + "." + reservation.resDay+ "</td>"
 											+ "<td><input class='btn btn-primary btn-lg' value='작성' name='reviewBtn' type='submit' style='padding: 6px 10px;' onclick='writeReview(this);'></td>"
 											+ "</tr>"
 					}
 					oldReservationHtml += "</table>";

 					$('#old_reservation').html(oldReservationHtml);
 				}else{
 					$('#old_reservation').html("<br><h3><font color='gray'>지난 예약 내역이 없습니다.</font></h3>");
 				}
 			},error:function(request,status,error){
				alert("통신실패");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
 		});
 	}
 	
 	// 후기
	function reviewList(){
   		$.ajax({
			url:"<%=request.getContextPath()%>/reviewList.my",
			type:"get",
			success:function(data){
				if(data.myReviewList != 0) {
					var reviewHtml = "<br><table class='table table-striped'>"
									+ "<tr><th>번호</th><th>병원명</th><th>제목</th><th>예약일</th><th></th></tr>";
					/* var pagingHtml = ""; */
					
					for(var index in data.myReviewList){
						var review = data.myReviewList[index];
						
						reviewHtml += "<tr><td name='reNum'>" + review.reviewNo + "</td>"
								+ "<td>" + review.hospitalName + "</td>"
								+ "<td><a name='reTitle' style='color: #7F7F7F' href='#' onclick='reviewDetail(this);'>" + review.reviewTitle + "</a></td>"
								+ "<td>" + review.reviewDate + "</td>"
								+ "<td>"
								+ "<input class='btn btn-primary btn-lg' value='삭제' type='button' name='deleteBtn' onclick='deleteReview(this);' style='padding: 6px 10px;'></td>"
			                    + "</tr>";
					}
					reviewHtml += "</table>";
					<%-- pagingHtml += "<div class='form-group to-animate' align='center'>"
							+ "<input class='btn btn-primary' type='button' onclick='location.href='todaysDoctor/reviewList.my?currentPage=1'' value='<<'>"
							+ "<%  if(review.currentPage <= 1){  %>"
							+ "<input disabled class='btn btn-primary' type='button' value='<'>"
							+ "<%  }else{ %>"
							+ "<input class='btn btn-primary' type='button' onclick='location.href='todaysDoctor/rList.su?currentPage=" + review.currentPage - 1 + "'value='<'>" --%>


					$('#review').html(reviewHtml);
				}else {
					$('#review').html(
						 "<br><h3><font color='gray'>등록한 후기가 없습니다.</font></h3>"
					);
				}
			},error:function(request,status,error){
				alert("통신실패");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
   		});
	}
    </script>
    
 	<script>
 	// 후기 상세보기
 	function reviewDetail(obj){
 		var reTitle = document.getElementsByName("reTitle");
 		
 		for(var i in reTitle){
 			if(obj == reTitle[i]){
 				var reNum = $('[name=reNum]').eq(i);
 			}
 		}
 		location.href = "/todaysDoctor/reviewSelectOne.my?reNum=" + reNum.html();
 	}
 	
 	// 예약했었던 병원 후기 작성
 	function writeReview(obj){
 		var reviewBtn = document.getElementsByName("reviewBtn");		
 		
 		for(var i in reviewBtn){
 			if(obj == reviewBtn[i]){
 				var lastResNum = $('[name=lastResNum]').eq(i);
 			}
 		}
 		location.href="/todaysDoctor/lastReservationOne.res?resNum=" + lastResNum.val();
 	}
    </script> 
    
    <script>
    // 실시간 예약 취소
    function cancelReservation(obj){
    	var cancelBtn = document.getElementsByName("cancelButton");
    	var sysDateMonth = new Date().getMonth() + 1;
    	var sysDateDay = new Date().getDate();
    	var sysDateHours = new Date().getHours() * 60;
    	var sysDateMin = new Date().getMinutes();
 		
    	for(var i in cancelBtn){
    		if(obj == cancelBtn[i]){
    			var resNum = $('[name=resNum]').eq(i);
    			var resMonth = $('[name=resMonth]').eq(i);
    			var resDay = $('[name=resDay]').eq(i);
    			var resTime = $('[name=resTime]').eq(i);
    			var resMin = $('[name=resMin]').eq(i);
    		}   		
    	}

    	var max, min;
    	if((sysDateHours + sysDateMin) > (Number((resTime.html() * 60)) + Number(resMin.html()))) {
    		max = sysDateHours + sysDateMin;
    		min = Number((resTime.html() * 60)) + Number(resMin.html());
    	}else {
    		max = Number((resTime.html() * 60)) + Number(resMin.html());
    		min = sysDateHours + sysDateMin;
    	}
    	
    	 if(confirm("예약을 취소하시겠습니까?")){   		
    		/* if(sysDateMonth + sysDateDay == Number(resMonth.html()) + Number(resDay.html())){  
    			if(max - min <= 120){
    				alert("예약시간 2시간 전에는 취소가 불가능합니다.");
    			}
    		}else{ */
    			alert("취소되었습니다.");
	       		location.href = "/todaysDoctor/newReservationDelete.my?resNum="+resNum.val();
    		/* } */   		
    	}
    }
    
    
    // 후기 삭제
    function deleteReview(obj){
    	var deleteBtn = document.getElementsByName("deleteBtn");
    	for(var i in deleteBtn){
    		if(obj==deleteBtn[i]){
    			var reNum = $('[name=reNum]').eq(i);
    		}
    	}
    	console.log(reNum.html());
    	if(confirm("정말 삭제하시겠습니까?")){
    		alert("삭제가 완료되었습니다.");
    		location.href = "/todaysDoctor/reviewDelete.my?reNum="+reNum.html();
    		reviewList();
    	}
    }
    </script>
    <div class="tab-content">
        <div id="bookmark" class="container tab-pane active">

			<section id="fh5co-contact" data-section="contact">
                <div class="container">
                    <div class="row">
                        <div class="row">
                            <div class="col-md-6">
                                <section id="fh5co-person" data-section="person">
                                    <div class="container">
                                    <%if(hospitalList != null) { %>
										<!-- <form method="get" action="/todaysDoctor/selectList.ho"> -->
						
		        						<%for(Hospital hospital : hospitalList) { %>
					                        <div class="fh5co-person">
					
					                           <img src="/todaysDoctor/views/images/star.png" id="img1" alt=0 onclick="imgChange(this);" width="50px"
					                              height="50px">                          
					
					                           <h1 id="favoriteHpName"><%=hospital.getHpName()%></h1>
					
					                           <span class="fh5co-position">진료과목:&nbsp;<%=hospital.getHpIndex() %></span>
					                           <hr>
					
					                           <ul class="fh5co-contact-info">
					                              <li class="fh5co-contact-address"><i class="icon-home">
					                                    	병원 주소 : <%=hospital.getHpArea() %><br>
					                                    <br>&nbsp;&nbsp;&nbsp;상세 주소 : <%=hospital.getHpAddress() %></i><br>
					                              </li><br>
					
					                              <li class="fh5co-contact-address"><i class="icon-clock2">
					                                   	 진료시간 : 오전 <%=hospital.getHpOpen() %>:00 ~ 오후 <%=hospital.getHpClose() %>:00<br>
					                                    <br>&nbsp;&nbsp;&nbsp;점심시간 : 오전 <%=hospital.getHpLunchSt() %>:00 
					                                    ~ 오후 <%=hospital.getHpLunchFi() %>:00</i><br>
					                              </li><br>
					
					                              <li><i class="icon-phone">&nbsp;전화번호 : <%=hospital.getHpPhone() %></i><br></li>
					                              <li><i class="icon-envelope">&nbsp;병원 Email : <%=hospital.getHpEmail() %></i><br></li>
					
					                              <font size="4">평점&nbsp;&nbsp;&nbsp;</font><img src ="/todaysDoctor/views/images/grade5(예약1).png">
					                              
					                                <input class="btn btn-primary" value="예약" type="submit" onclick="location.href='<%=request.getContextPath()%>/hopOne.ho?hdHospitalNo=<%= hospital.getHnum() %>'" style="float: right;">
					                                <!-- <script>
					                                function yeyeak1(){
					                                   location.href = "/todaysDoctor/";
					                                }
					                                </script> -->
					
					                           </ul>
					                        </div>    
			                    
						         		<!-- </form> --><br>                       
							         <%} %>
									</div>
		         				</section>
								    <%}else { %>                
								       <section id="fh5co-person" data-section="person">
								           <div class="container">
								           		<h3><font color="gray">즐겨찾는 병원이 없습니다.</font></h3>
								           </div>
								       </section><br>    
								                                
							        <%} %>                        
                            </div>
                        </div>
                    </div>
            </section>

        </div>
        <div id="new_reservation" class="container tab-pane"><br>
        
        </div>
        <div id="old_reservation" class="container tab-pane"><br>
        
        </div>
        <div id="review" class="container tab-pane"><br>
        
        </div>
        <div id="updateInfo" class="container tab-pane"><br>
        <!-- 동하 -->
		<%   
		   String userId = user.getUserId();
		   String userName = user.getUserName();
		   String userPno = user.getUserPno();
		   String userPwd = user.getUserPwd();
		   String userEmail = user.getUserEmail();
		   String userEmailLast = userEmail.substring(userEmail.lastIndexOf("@"));
		   String userEmailFirst = userEmail.substring(0,userEmail.indexOf("@"));
		   
		   String userPhone = user.getUserPhone();
		   String userArea = user.getUserArea();
		%>
		   <div id="firstDiv">
		   <section id="fh5co-contact" data-section="contact">
		         <div class="container">
		            <div class="row">
		               <div class="col-md-12 section-heading text-center ">
		                  <h2>회원 정보 수정</h2>
		                  <div class="row">
		                     <div class="col-md-8 col-md-offset-2 subtext ">
		                        <h3>비밀번호를 입력해주세요!</h3>
		                     </div>
		                  </div>
		               </div>
		            </div>
		         </div>
		   </section>
		         <div class="form-group">
		         <label for="id1">아이디</label> <input id="id1" name="id1" class="form-control"
		            placeholder="<%= userId %>" value="<%= userId %>" type="text" readonly>
		      </div>
		      <div class="form-group">
		      <label for="password1">비밀번호</label>
		      <input id="password1"   class="form-control" name="password1" placeholder="6-15자의 영문 대소문자, 숫자 및 특수문자 조합"
		            type="password" onkeyup="pwinput();">
		            <br>
		            <script>
		      function updatepw(){
		         $.ajax({
		            url:'<%=request.getContextPath()%>/userMypage.me',
		            type:'post',
		            data:{id1 : $('#id1').val() ,password1 : $('#password1').val()},
		            success:function(data){
		               if(data=='ok'){
		                  $('#firstDiv').attr('style','display:none');
		                  $('#secondDiv').attr('style','display:block');
		               }else{
		                  alert("비밀번호가 일치하지 않습니다.");
		               }
		               
		            },error:function(request,status,error){
		               console.log("---ERROR---");
		               console.log(request);
		               console.log(status);
		               console.log(error);
		               console.log("------------");
		            }
		         });
		      }
		      </script>
		      <input id="pwck" class="btn btn-primary btn-lg" value="회원정보 수정" type="button" style="width:100%;" onclick="updatepw();" >
		
		      </div>
		      </div>
		<script>
		
		 
		function chk(re, ele, msg, p) {
		    if (!re.test(ele.value)) {
		       console.log(ele.value);
		       p.innerHTML = "*" + msg;
		       p.style.display = "block";
		       p.style.color = "red";
		       return false;
		    } else {
		       p.style.display = "none";
		    }
		    return true;
		 }
		</script>
		
		   <form  action="<%=request.getContextPath() %>/uUpdate.me" id="secondDiv" method="get" onsubmit="return updateck();" style="display:none" >
		      <div class="form-group">
		         <label for="id">아이디</label> <input id="id" name="id" class="form-control"
		            placeholder="<%= userId %>" value="<%= userId %>" type="text" readonly>
		         
		      </div>
		      <div class="form-group">
		         <label for="name">이름</label> <input id="name" name="name" class="form-control"
		            placeholder="<%= userName %>" value="<%= userName %>" type="text" readonly>
		      </div>
		      <div class="form-group">
		         <label for="pnumber">주민번호(-)포함</label> <input id="pnumber"
		            name="pnumber" class="form-control" placeholder="<%=userPno %>"
		             value="<%= userPno %>" type="text" readonly>
		         <p id="pnump" style="display: none"></p>
		      </div>
		      <div class="form-group">
		         <label for="password"><a id="pwAtag" value="false"
		            onclick="pwdisable();">비밀번호 변경</a></label>
		            
		            <input id="password"
		            class="form-control" name="password" placeholder="6-15자의 영문 대소문자, 숫자 및 특수문자 조합"
		            type="password" style="display: none" value="<%=userPwd %>"
		            onkeyup="pwinput();">
		      </div>
		      <div class="form-group">
		         <input id="pwcheck" class="form-control" placeholder="비밀번호와 일치"
		            type="password" style="display: none" value="<%=userPwd %>"
		            onkeyup="pwckinput();">
		         <p id="pwp" style="display: none"></p>
		      </div>
		      <script>
		                function pwdisable() {
		                    var pwAtag = document.getElementById("pwAtag");
		                    var password = document.getElementById("password");
		                    var pwcheck = document.getElementById("pwcheck");
		
		                    if (pwAtag.value == "false") {
		                        password.style.display = "block";
		                        pwcheck.style.display = "block";
		                        pwAtag.value = "ture";
		                        password.value=null;
		                        pwcheck.value=null;
		                        
		                    } else {
		                        password.style.display = "none";
		                        pwcheck.style.display = "none";
		                        pwAtag.value = "false";
		                        password.value="<%=userPwd %>";
		                        pwcheck.value="<%=userPwd %>";
		                    }
		
		
		
		                }
		                function pwinput() {
		                   var password = document.getElementById("password");
		                   var pwd = document.getElementById("pwp");
		
		                   if (!chk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/, password, "6~20 영문 대소문자, 최소1개의 숫자 혹은 특수문자를 포함", pwp)) {
		
		                      return;
		                   } else {
		
		                      return;
		                   }
		                }
		
		                function pwckinput() {
		                    var password = document.getElementById("password");
		                    var pwcheck = document.getElementById("pwcheck");
		                    var pwd = document.getElementById("pwp");
		                    if (!chk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/, password, "6~20 영문 대소문자, 최소1개의 숫자 혹은 특수문자를 포함", pwp)) {
		
		                        return;
		                    } else if ((pwd.style.display == "none") && (password.value != pwcheck.value)) {
		                        pwd.style.display = "block";
		                        pwd.style.color = "red";
		                        pwp.innerHTML = "비밀번호와 일치하지 않습니다!";
		                    } else {
		                        pwd.style.display = "none";
		                    }
		                }
		
		            </script>
		
		      <br>
		
		      <div class="form-group">
		         <label for="email">이메일</label><br> <span id="a"> <input id="email" name="email" class="form-control" placeholder="Email" type="text"
		            value="<%=userEmailFirst%>"onkeyup="emailinput();">
		
		         </span> <span id="a"> <input id="emailaf" name="emailaf" class="form-control"
		            placeholder="@Email.com" value="<%=userEmailLast%>" type="text">
		         </span> <span id="a"> <select id="mails" class="form-control"
		            onchange="emailf();">
		               <option value="">직접입력</option>
		               <option value="@naver.com">naver.com</option>
		               <option value="@daum.net">daum.net</option>
		               <option value="@hotmail.com">hotmail.com</option>
		               <option value="@nate.com">nate.com</option>
		               <option value="@yahoo.co.kr">yahoo.co.kr</option>
		               <option value="@paran.com">paran.com</option>
		               <option value="@empas.com">empas.com</option>
		               <option value="@dreamwiz.com">dreamwiz.com</option>
		               <option value="@freechal.com">freechal.com</option>
		               <option value="@lycos.co.kr">lycos.co.kr</option>
		               <option value="@korea.com">korea.com</option>
		               <option value="@gmail.com">gmail.com</option>
		               <option value="@hanmir.com">hanmir.com</option>
		         </select>
		         </span>
		         <p id="emp" style="display: none"></p>
		      </div>
		
		      <script>
		                function emailinput() {
		                    var email = document.getElementById("email");
		                    var emp = document.getElementById("emp");
		                    if (!chk(/^[A-Za-z0-9]{6,12}$/, email, "숫자,문자 포함 6~12자리 입력", emp)) {
		                        return;
		                    }
		                }
		                function emailf() {
		                    var emailselect = document.getElementById("mails");
		
		                    var net = emailselect.options[emailselect.selectedIndex].value;
		                    console.log(net);
		                    var emailaf = document.getElementById("emailaf");
		                    emailaf.value = net;
		                    // 동하 바보 내가 성공해놓음
		                }
		            </script>
		
		      <br>
		      <br>
		      <br>
		      <div class="form-group">
		         <label for="phone">휴대폰번호(-포함)</label> <input id="phone"
		            name="phone" class="form-control"  placeholder="Phone" type="text"
		            value="<%=userPhone %>" onkeyup="phoneinput();">
		         <p id="nump" style="display: none"></p>
		      </div>
		      <script>
		                function phoneinput() {
		                    var phone = document.getElementById("phone");
		                    var nump = document.getElementById("nump");
		                    if (!chk(/^\d{3}-\d{3,4}-\d{4}$/, phone, "000-000~0-0000 입력해주세요", nump)) {
		                        return;
		                    }
		                }
		            </script>
		      <br>
		      <div class="form-group">
		         <label for="area">거주지역</label><br> <select style="color: #999"
		            class="form-control" name="area" id="area">
		            <option hidden><%=userArea %></option>
		            <option>강남구</option>
		            <option>강동구</option>
		            <option>강서구</option>
		            <option>강북구</option>
		            <option>관악구</option>
		            <option>광진구</option>
		            <option>구로구</option>
		            <option>금천구</option>
		            <option>노원구</option>
		            <option>동대문구</option>
		            <option>도봉구</option>
		            <option>동작구</option>
		            <option>마포구</option>
		            <option>서대문구</option>
		            <option>성동구</option>
		            <option>성북구</option>
		            <option>서초구</option>
		            <option>송파구</option>
		            <option>영등포구</option>
		            <option>용산구</option>
		            <option>양천구</option>
		            <option>은평구</option>
		            <option>종로구</option>
		            <option>중구</option>
		         </select>
		      </div>
		
		      <div class="form-group">
		         <input class="btn btn-primary btn-lg" value="회원정보 수정" type="submit"
		            style="width: 100%">
		      </div>
		      <div class="form-group">
		               <span id="singUp" style="float: right">
		               <a style="color : #A9A9A9;" data-nav-section="work" onclick="deleteUser();">회원탈퇴</a>
		               </span>
		               <script>
		               function deleteUser(){
		                  var deleteUser = confirm("정말 회원탈퇴를 하시겠습니까?");
		                  $.ajax({
		                    url:'<%=request.getContextPath()%>/deleteUser.me',
		                    type:'post',
		                    data:{id : $('#id').val()},
		                    success:function(){
		                       alert('회원탈퇴 되었습니다.');
		                       location.href="/todaysDoctor/views/main.jsp";
		                    },error:function(){
		                       
		                    }
		                  });
		               }
		               </script>
		            </div>
		      </form>
		      <script>
		               function submitchk(re, ele) {
		                  if (re.test(ele.value)) {
		                     return true;
		                  } else {
		                     return false;
		                  }
		               }
		            
		
		               
		               function updateck() {
		                  var password = document.getElementById("password");
		                  var pwcheck = document.getElementById("pwcheck");
		                  var email = document.getElementById("email");
		                  var emailaf = document.getElementById("emailaf");
		                  var emailfull = email.value+emailaf.value;
		                  var phone = document.getElementById("phone");
		                  var area = document.getElementById("area");
		                  var areaselect = area.options[area.selectedIndex].value;
		                  
		                 
		         var err1 = "";
		
		         if(password.value != pwcheck.value){
		            alert("비밀번호가 일지하지 않습니다.");
		            return false;
		         }
		         if (submitchk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/,
		               password) == false) {
		            err1 += "비밀번호 \n";
		         }
		         if (/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
		               .test(emailfull) == false) {
		            err1 += "이메일 \n";
		         }
		         if (submitchk(/^\d{3}-\d{3,4}-\d{4}$/, phone) == false) {
		            err1 += "휴대폰번호 \n";
		         }
		         if (areaselect == "지역") {
		            err1 += "거주지역 \n";
		         }
		         if (err1 != "") {
		            alert(err1 + "를(을) 바르게 입력해주세요");
		            return false;
		         }
		
		      }
		   </script>
		      
		   </div>
   
   <!-- 동하 -->          
    </div>
   		<script>
		function imgChange(clickImg) {
			var favoriteHpName = $(clickImg).siblings('h1').text();
			console.log(favoriteHpName);
			/* if (clickImg.alt == 0) {
				clickImg.src = "/todaysDoctor/views/images/star.png";
				clickImg.alt = 1;
			} else {
				clickImg.src = "/todaysDoctor/views/images/star_black.png"; */
			var check = confirm("즐겨찾기를 해제하시겠습니까?");
			if(check){
				alert("즐겨찾기가 해제되었습니다.");
				location.href="/todaysDoctor/favoriteDelete.my?hpName=" + favoriteHpName;
			}
			/* clickImg.alt = 0;
			} */
		}
         </script>
    
</body>
<%@ include file="footer.jsp" %> 
</html>