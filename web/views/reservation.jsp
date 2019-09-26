<%@page import="com.doctor.hospital.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.doctor.hospital.model.vo.Hospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Hospital> list = (ArrayList<Hospital>)request.getAttribute("list");

PageInfo pi = (PageInfo)request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int listCount   = pi.getListCount();
int maxPage     = pi.getMaxPage();
int limit       = pi.getLimit();
int startPage   = pi.getStartPage();
int endPage     = pi.getEndPage(); 
System.out.println("동하검색후 currentPage :"+currentPage+",listCount :"+listCount+", limit:"+limit+",maxPage"+maxPage+", startPage:"+startPage+", endPage:"+endPage);
String serv = (String)request.getAttribute("serv");
String keyword = (String)request.getAttribute("keyword");
String index = (String)request.getAttribute("index");
String area = (String)request.getAttribute("area");


%>

<!DOCTYPE html>
<html>


<style>
#a {
	/*버튼*/
	left: 0;
	position: alsolute;
	text-align: right;
	top: 0;
	width: 100%;
}

#fh5co-home, #fh5co-home .text-wrap {
	/*상단바*/
	height: 120px;
	/*높이*/
}

#img1 {
	/*float: right;*/
	position: absolute;
	right: 40px;
	top: 30px;
}

.fh5co-person {
	/*병원정보 박스*/
	border: 2px solid #999;
	padding: 50px 30px 30px 30px;
	width: 80%;
	height: 10%;
	float: center;
	margin: auto;
	position: relative;
}
</style>

<!-- End demo purposes only -->


<!-- Modernizr JS -->
<!-- <script src="views/js/modernizr-2.6.2.min.js"></script> -->
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->
<script>
      //$(function(){
       /*    $("#hpRes").mouseenter(function(){
             var hno = $("#hno").val();
             console.log(hno);
          }); */
          
      /*   $("#hpRes").click(function(){
            /* $("#hpRes").submit(); */
            //alert('a');
            <%-- var hno = $('#hno').val();
            console.log(hno);
            
            location.href="<%=request.getContextPath()%>/hopOne.ho?hdHospitalNo="+hno; --%>
            <%-- location.href="<%= request.getContextPath() %>/hopOne.ho?hname="+hname; --%>
         
      //});*/
</script>

<%@ include file="header.jsp"%>

<body>

	<!--먼가 여기 까지 쓸거 같아-->
	<section id="fh5co-contact" data-section="contact">
		<div class="container">
			<div class="row">

				<div class="row"></div>
			</div>

			<div class="col-md-6 to-animate">



				<section id="fh5co-person" data-section="person">
					<div class="container">
						<div class="row">
							<div class="col-md-12 section-heading text-center">
								<h2 class="to-animate">병원 예약</h2>
								<div class="row">
									<div class="col-md-8 col-md-offset-2 subtext to-animate">
										<h3>병원을 예약하세요.</h3>
									</div>
								</div>
							</div>

							<br> <br>

							<!--<section id="fh5co-contact" data-section="contact">-->
							<div class="container">
								<div class="row">
									<div class="col-md-1 section-heading text-center">
										<form action="<%= request.getContextPath() %>/hpSearch.ho"
											method="get" class="form-inline" role="form">

											<select name="index" style="color: #999" class="form-control"
												id="index">
												<option value="">전체 진료과목</option>
												<option>소아청소년과</option>
												<option>내과</option>
												<option>피부과</option>
												<option>이비인후과</option>
												<option>치과</option>
												<option>정형외과</option>
												<option>안과</option>
												<option>가정의학과</option>
											</select> &nbsp; <select name="area" style="color: #999"
												class="form-control" id="area">
												<option value="">지역</option>
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
											</select> &nbsp; <input class="form-control" type="search"
												id="keyword" placeholder="병원 이름 검색  "> &nbsp; <select
												style="color: #eece49" class="form-control" name="test">
												<option value="">즐겨찾는 병원</option>
												<%if(session.getAttribute("user") != null) {%> 
													<%if(user.getUserFavorite() != null){ 
	                                    				String[] favoHoList = user.getUserFavorite().split(",");
	                                    				for(String s : favoHoList){ %>
														<option style="color: #999"><%= s %></option>
														<%} }else{ } %>
														
												<%}else{%>

												<%}%>
											</select>

											<div class="form-group">
												<input class="btn btn-primary btn-lg" type="button"
													value="검색" id="search5" onclick="search();">
											</div>

										</form>


										<!--</section>-->
									</div>
								</div>
								<form method="post" action="/todaysDoctor/hopOne.ho">
									<% for(Hospital h : list){ %>
									<!-- 석영쓰 -->
									
									<input id="hpname" type="hidden" name="hpresname"
										class="fh5co-position" value="<%= h.getHpName() %>"> <input
										id="hno" type="hidden" name="hno" class="fh5co-position"
										value="<%= h.getHnum() %>"> <input id="hpcode"
										type="hidden" name="hpcode" class="fh5co-position"
										value="<%= h.getHpCode() %>"> <input id="hparea"
										type="hidden" name="hparea" value="<%= h.getHpArea()%>">
									<input id="hpadd" type="hidden" name="hpadd"
										value="<%= h.getHpAddress()%>"> <input id="hpphone"
										type="hidden" name="hpphone" value="<%= h.getHpPhone()%>">
									<!-- 석영쓰 -->
									<div class="fh5co-person to-animate" id="hplist"
										style="color: #999">
										<!-- 자동 즐겨찾기 시작 -->
										<%if(session.getAttribute("user") != null) {
											if(user.getUserFavorite()!=null && user.getUserFavorite().indexOf(h.getHpName())!= -1) { %>
											<img src="/todaysDoctor/views/images/star.png" id="img1" alt=1
												onclick="imgChange(this);" width="6%" height="9%">
	
											<%} else { %>
											<img src="/todaysDoctor/views/images/star_black.png" id="img1"
												alt=0 onclick="imgChange(this);" width="6%" height="9%">
											<%} %>
										<%}else{%>
										<img src="/todaysDoctor/views/images/star_black.png" id="img1"
											alt=0 onclick="imgChange(this);" width="6%" height="9%">
										<%}%>
										<!--  -->
										<h1><%= h.getHpName() %></h1>
										<p style="display: none"><%= h.getHpCode() %></p>

										<input id="hno" type="hidden" name="hdHospitalNo"
											class="fh5co-position" value="<%= h.getHnum() %>"> <span
											class="fh5co-position">진료과목 : &nbsp;<%= h.getHpIndex() %></span>
										<hr>

										<ul class="fh5co-contact-info">
											<li class="fh5co-contact-address"><i class="icon-home">
													병원 주소 : <%= h.getHpArea()%><br> <br>&nbsp;&nbsp;&nbsp;상세
													주소 : <%= h.getHpAddress() %></i><br></li>
											<br>
											<li class="fh5co-contact-address"><i class="icon-clock2">
													진료시간 : <%= h.getHpOpen() %>:00 ~ <%= h.getHpClose() %>:00<br>
													<br>&nbsp;&nbsp;&nbsp;점심시간 : <%= h.getHpLunchSt() %>:00
													~ <%= h.getHpLunchFi() %>:00
											</i><br></li>
											<br>
											<li><i class="icon-phone" id="hpon">&nbsp;전화번호 : <%= h.getHpPhone() %></i><br></li>
											<li><i class="icon-envelope">&nbsp;병원 Email : <%= h.getHpEmail() %></i><br></li>

											<img src="/todaysDoctor/views/images/grade1(예약2).png">
											<font size="4" id="avgpoint">&nbsp;&nbsp;&nbsp;<%=h.getAvgPoint() %>
											</font>



											<div class="form-group" id="a">
												<input class="btn btn-primary" value="예약" type="button" name="btnRes" id="hpRes"
												 onclick="location.href='<%=request.getContextPath()%>/hopOne.ho?hdHospitalNo=<%= h.getHnum() %>'"/>
												<script>
                                    function search(){
                                            if($('select[name=test]').val()!=""){
                                               keyword = $('select[name=test]').val();
                                               location.href="<%=request.getContextPath()%>/hpSearch.ho?index=&area=&keyword="+keyword;
                                               
                                            }else {
                                               location.href="<%=request.getContextPath()%>/hpSearch.ho?index="+$('#index option:selected').val()+"&area="+$('#area option:selected').val()+"&keyword="+$('#keyword').val();
                                               }
                                     }
                                   </script>
											</div>
										</ul>
									</div>
									<br> <br>


									<%} %>
									<%-- 페이지 처리 --%>
									<div class="form-group to-animate" align="center">
										<input class="btn btn-primary" type="button"
											onclick="location.href='<%= request.getContextPath() %>/<%=serv %>?currentPage=1'+'&keyword='+$('#keyword').val()+'&index='+$('#idex option:selected').val()+'&area='+$('#area option:selected').val()"
											value="<<">

										<%  if(currentPage <= 1){  %>
										<input disabled class="btn btn-primary" type="button"
											value="<">
										<%  }else{ %>
										<input class="btn btn-primary" type="button"
											onclick="location.href='<%= request.getContextPath() %>/<%=serv %>?currentPage=<%=currentPage - 1 %>'+'&keyword='+$('#keyword').val()+'&index='+$('#index option:selected').val()+'&area='+$('#area option:selected').val()"
											value="<">
										<%  } %>

										<% for(int p = startPage; p <= endPage; p++){
                  							if(p == currentPage){   
           								 %>
										<input disabled class="btn btn-primary" type="button"
											value="<%= p %>">
										<%    }else{ %>
										<input class="btn btn-primary" type="button"
											onclick="location.href='<%= request.getContextPath() %>/<%=serv %>?currentPage=<%= p %>'+'&keyword='+$('#keyword').val()+'&index='+$('#index option:selected').val()+'&area='+$('#area option:selected').val()"
											value="<%= p %>">
										<%    } %>
										<% } %>

										<%  if(currentPage >= maxPage){  %>
										<input disabled class="btn btn-primary" type="button"
											value=">">
										<%  }else{ %>
										<input class="btn btn-primary" type="button"
											onclick="location.href='<%= request.getContextPath() %>/<%=serv %>?currentPage=<%=currentPage + 1 %>'+'&keyword='+$('#keyword').val()+'&index='+$('#index option:selected').val()+'&area='+$('#area option:selected').val()"
											value=">">
										<%  } %>
										<input class="btn btn-primary" type="button"
											onclick="location.href='<%= request.getContextPath() %>/<%=serv %>?currentPage=<%= maxPage %>'+'&keyword='+$('#keyword').val()+'&index='+$('#index option:selected').val()+'&area='+$('#area option:selected').val()"
											value=">>">
									</div>
									<script>
             function imgChange(clickImg) {
            	 var favoriteHpName = $(clickImg).siblings('h1').text();
                 if (clickImg.alt == 0) { //즐겨찾기 추가
                    clickImg.src = "/todaysDoctor/views/images/star.png";
                    clickImg.alt = 1;
				 $.ajax({
					 url:'<%=request.getContextPath()%>/FavoritHoInsert.my',
           		  type:'get',
           		  data:{hpName : favoriteHpName},
           		  success: function(data){
        			alert("즐겨찾는 병원이 추가되었습니다.");
           		  },error:function(request,status,error){
                      console.log("---ERROR---");
                      console.log(request);
                      console.log(status);
                      console.log(error);
                      console.log("------------");
                   }
                    });

                 } else {  // 즐겨찾기 해제
                    clickImg.src = "/todaysDoctor/views/images/star_black.png";
                    clickImg.alt = 0;
                    $.ajax({
   					 url:'<%=request.getContextPath()%>/FavoritHoDelete.my',
              		  type:'get',
              		  data:{hpName : favoriteHpName},
              		  success: function(data){
            			alert("즐겨찾기가 해제되었습니다.");
              		  },error:function(request,status,error){
                         console.log("---ERROR---");
                         console.log(request);
                         console.log(status);
                         console.log(error);
                         console.log("------------");
                      }
                       });
                 }
              }
           </script>
									<script>
            window.onload = function(){
                // 문서가 로딩되고 난 후 바로 실행됨
               if(<%=serv=="hpSearch.ho"%>){
                  $('#index').val('<%=index%>').prop("selected", true);
                  $('#area').val('<%=area%>').prop("selected", true);
                  $('#keyword').val('<%=keyword%>');
               } 
            };
      		
            
      </script>

								</form>
							</div>
						</div>
					</div>

					<!-- -->
				</section>

				<!-- 별 사진 바꿔누는 function -->


				<script>
              /* function gohpRes(gores){
                 console.log(1);
                 location.href="/todayDoctor/hopOne.ho";
              } */
               
            </script>

				<br> <br>

				<div id="fh5co-contact" class="container">
</body>
<%@ include file="footer.jsp"%>
</html>