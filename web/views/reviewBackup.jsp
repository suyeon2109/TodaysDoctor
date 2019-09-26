<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.doctor.review.model.vo.*, java.util.*"%>
<%
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
	ReviewPageInfo pi = (ReviewPageInfo)request.getAttribute("pi");
	
	int listCount 	= pi.getListCount();
	int currentPage = pi.getCurrentPage();
	
	int maxPage 	= pi.getMaxPage();
	int startPage 	= pi.getStartPage();
	int endPage 	= pi.getEndPage();
	
 	int rowNum = (int)((double)rList.size()/3 + 0.7);
 	int colNum = rList.size()%3;
 	
 	String serv = (String)request.getAttribute("serv");
 	String keyword = (String)request.getAttribute("keyword");
 	String hpIndex = (String)request.getAttribute("hpIndex");
 	String hpArea = (String)request.getAttribute("hpArea");
 	String category = (String)request.getAttribute("category");
 	
 	if(keyword==null){
 		keyword="";
 	}
 	
 	if(hpIndex==null){
 		hpIndex="";
 	}
 	
 	if(hpArea==null){
 		hpArea="";
 	}
 	
 	
 	
 	String root = (String)request.getContextPath()+"/"+serv+"?";
 	
 	if(serv=="rSearch.su"){
 		root += "keyword="+keyword+"&hpIndex="+ hpIndex+"&hpArea="+hpArea+"&";
 	} else if(serv=="rSort.su"){
 		root += "keyword="+keyword+"&hpIndex="+ hpIndex+"&hpArea="+hpArea+"&category="+category+"&";
 	}
 	
 	System.out.println("serv : " + serv);
 	System.out.println("root : " + root);
 	System.out.println("rowNum : " + rowNum);
 	System.out.println("colNum : " + colNum);
 	
 	
%>
    
<!DOCTYPE html>


<%@ include file="header.jsp" %> 
	<style>
		#fh5co-home,
		#fh5co-home .text-wrap {
			height: 120px;
			/*높이*/
		}
		

</style>
	<!-- Modernizr JS -->

<body>
	<section id="fh5co-testimonials" data-section="testimonials">
	<form method="get" action="">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">병원 후기</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>다른 사람의 후기를 보고, 병원을 예약해보세요</h3>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-1 section-heading text-center to-animate form-inline">
					<select style="color: #999" class="form-control" id="hpIndex" name="hpIndex">
						<option value="">전체 진료과목</option>
						<option>소아청소년과</option>
						<option>내과</option>
						<option>피부과</option>
						<option>이비인후과</option>
						<option>치과</option>
						<option>정형외과</option>
						<option>안과</option>
						<option>가정의학과</option>
					</select>
					&nbsp;
					<select style="color: #999" class="form-control" id="hpArea" name="hpArea">
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
					</select>
					&nbsp;
					
					<input class="form-control" type="search" id="keyword" placeholder="병원 이름 검색">
					&nbsp;
					
					<select style="color:#eece49" class="form-control" id="search4">
						<option hidden>즐겨찾는 병원</option>
					</select>
					&nbsp;

					<div class="form-group">
						<input class="btn btn-primary btn-lg" type="button" value="검색" id="search5" onclick="search();">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				</div>
			</div>

			<div class="row">
				<ul class="form-inline to-animate" style="float: right">
					<li class="form-group" style="list-style:none;"><a href="<%=request.getContextPath()%>/rSort.su?keyword=<%=keyword %>&hpIndex=<%=hpIndex %>&hpArea=<%= hpArea %>&category=최신순;" id="category" ><span style="color:#666" >최신순</span></a></li>
					&nbsp;
					<li class="form-group" style="list-style:none;"><a href="<%=request.getContextPath()%>/rSort.su?keyword=<%=keyword %>&hpIndex=<%=hpIndex %>&hpArea=<%= hpArea %>&category=별점순;" id="category"><span style="color:#666">별점순</span></a></li>
					&nbsp;
					<li class="form-group" style="list-style:none; margin-right: 20px"><a href="<%=request.getContextPath()%>/rSort.su?keyword=<%=keyword %>&hpIndex=<%=hpIndex %>&hpArea=<%= hpArea %>&category=추천순;" id="category"><span style="color:#666">추천순</span></a></li>
				</ul>
			</div>
			<br>


		
	
	 		<% 
	 			for(int i=0; i<rowNum; i++){ 
	 		%>
				<div class="row">
				<% 
					for(int j=0; j<colNum; j++){ 
				%>
					<div class="col-md-4">
						<div class="box-testimony">
							<blockquote class="form-inline to-animate-2">
								<p>&ldquo; <%= rList.get(j + 3*i).getReview() %>&rdquo;</p>
									<i style="float:left; color:yellow; font-size: 14pt" class="icon-star"></i>&nbsp;<font size=3 style="color:#444;"><b><%= rList.get(j + 3*i).getHpAvgpoint() %></b></font>
									<!-- (별점에 마우스 클릭이나 갖다대면 상세점수 나오는거 해야함) -->
									<span style="float:right"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 17pt; color:#999; cursor:pointer;"></i>
									&nbsp;<font name="good" size=2; style="color:white;">0</font>&nbsp;&nbsp;
									<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 17pt; color:#999; cursor:pointer;"></i>
									&nbsp;<font name="bad" size=2; style="color:white;">0</font>
									</span>
								<br>
							</blockquote>
							<div class="author to-animate">
								<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
								<p>
									<%=rList.get(j + 3*i).getUserName()%> &nbsp;<a href="#"><%=rList.get(j + 3*i).getHpName() %>: 예약하기</a> <span class="subtext" style="font-size: 10pt;"><%=rList.get(j + 3*i).getReDate() %></span>
								</p>
							</div>
						</div>
					</div>
				<% 
				} 
				%>
				</div>
			<% 
				}
	 		%>
 
			
			<div class="row">
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2 form-inline">
							<p>&ldquo; 2019.08.07 저녁으로 먹은 간짜장은 매우 맛있었다. 맛집인듯하다.&rdquo;</p>
								<i style="float:left; color:yellow; font-size: 15pt" class="icon-star"></i>&nbsp;<font size=3 style="color:#444;"><b>4.5</b></font>
								<!-- (별점에 마우스 클릭이나 갖다대면 상세점수 나오는거 해야함) -->
								<span style="float:right"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 17pt; color:#999; cursor:pointer;"></i>
								&nbsp;<font name="good" size=2; style="color:white;">0</font>&nbsp;&nbsp;
								<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 17pt; color:#999; cursor:pointer;"></i>
								&nbsp;<font name="bad" size=2; style="color:white;">120</font>
								</span>
							<br>
						</blockquote>
						<div class="author to-animate">
							<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
							<p>
								이름 &nbsp;<a href="#">병원명: 예약하기</a> <span class="subtext">작성일</span>
							</p>
						</div>
					</div>
				</div>
			</div>


		
			<!-- <div class="row">
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2 form-inline">
							<p>&ldquo; 2019.08.07 저녁으로 먹은 간짜장은 매우 맛있었다. 맛집인듯하다.&rdquo;</p>
								<i style="float:left; color:yellow; font-size: 15pt" class="icon-star"></i>&nbsp;<font size=3 style="color:#444;"><b>4.5</b></font>
								(별점에 마우스 클릭이나 갖다대면 상세점수 나오는거 해야함)
								<span style="float:right"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 17pt; color:#999; cursor:pointer;"></i>
								&nbsp;<font id="good" size=2; style="color:white;">0</font>&nbsp;&nbsp;
								<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 17pt; color:#999; cursor:pointer;"></i>
								&nbsp;<font size=2; style="color:white;">120</font>
								</span>
							<br>
						</blockquote>
						<div class="author to-animate">
							<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
							<p>
								이름 &nbsp;<a href="#">병원명: 예약하기</a> <span class="subtext">작성일</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo; There was a ragged band that followed in our footsteps. Running before times took
								our dreams away. Leaving the&rdquo;</p>
								<i style="float:left; color:yellow; font-size: 15pt" class="icon-star"></i>&nbsp;<font size=3.5 style="color:#444;"><b>4.5</b></font>
								<figure style="float: right;"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 20pt; color:#999; cursor:pointer;"></i>
								&nbsp;&nbsp;<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 20pt; color:#999; cursor:pointer;"></i></figure>
							<br>
						</blockquote>
						<div class="author to-animate">
							<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
							<p>
								John Doe, Senior UI <a href="#">FREEHTML5.co</a> <span class="subtext">Creative
									Director</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo; The grass was greener. The light was brighter. When friends surrounded. The
								nights of wonder. &rdquo;</p>
							<i style="float:left; color:yellow; font-size: 15pt" class="icon-star"></i>&nbsp;<font size=3.5 style="color:#444;"><b>4.5</b></font>
							<figure style="float: right;"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 20pt; color:#999; cursor:pointer;"></i>
								&nbsp;&nbsp;<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 20pt; color:#999; cursor:pointer;"></i></figure>
							<br>
						</blockquote>
						<div class="author to-animate">
							<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
							<p>
								Chris Nash, Director <a href="#">FREEHTML5.co</a> <span class="subtext">Creative
									Director</span>
							</p>
						</div>
					</div>
				</div>				
			</div>


			<div class="row"> 다음줄 추가
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo; 2019.08.07 첫번째열 밑에 붙이기.&rdquo;</p>
							<i style="float:left; color:yellow; font-size: 15pt" class="icon-star"></i>&nbsp;<font size=3.5 style="color:#444;"><b>4.5</b></font>
							<figure style="float: right;"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 20pt; color:#999; cursor:pointer;"></i>
								&nbsp;&nbsp;<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 20pt; color:#999; cursor:pointer;"></i></figure>
							<br>
						</blockquote>
						<div class="author to-animate">
							<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
							<p>
								이름 <a href="#">병원명</a> <span class="subtext">작성일</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo; 2019.08.07 두번째열 밑에 붙이기.&rdquo;</p>
							<i style="float:left; color:yellow; font-size: 15pt" class="icon-star"></i>&nbsp;<font size=3.5 style="color:#444;"><b>4.5</b></font>
							<figure style="float: right;"><i class="icon-thumbs-up" onclick="iconChange(this)" name="icon1" title="" style="font-size: 20pt; color:#999; cursor:pointer;"></i>
								&nbsp;&nbsp;<i class="icon-thumbs-down" onclick="iconChange(this)" title="" name="icon2" style="font-size: 20pt; color:#999; cursor:pointer;"></i></figure>
							<br>
						</blockquote>
						<div class="author to-animate">
							<figure><i class="icon-reddit" style="font-size: 40pt; color:#777"></i></figure>
							<p>
								이름 <a href="#">병원명</a> <span class="subtext">작성일</span>
							</p>
						</div>
					</div>
				</div>
			</div> -->

		

      	<br><br><br><br>
		<div class="form-group to-animate" align="center">
	         <%-- <input class="btn btn-primary" type="button" onclick="location.href='<%= root %>?currentPage=1'+'&keyword='+keyword+'&hpIndex='+hpIndex+'&hpArea='+hpArea" value="<<"> --%>
	         <input class="btn btn-primary" type="button" onclick="location.href='<%= root %>currentPage=1'" value="<<">
	         <%  if(currentPage <= 1){  %>
	         <input disabled class="btn btn-primary" type="button" value="<">
	         <%  }else{ %>
	         <input class="btn btn-primary" type="button" onclick="location.href='<%= root %>currentPage=<%=currentPage - 1 %>'" value="<">
	         <%  } %>
	         
	         <% for(int p = startPage; p <= endPage; p++){
	               if(p == currentPage){   
	         %>
            		<input disabled class="btn btn-primary" type="button" value="<%= p %>">
	         <%    }else{ %>
	            	<input class="btn btn-primary" type="button" onclick="location.href='<%= root %>currentPage=<%= p %>'" value="<%= p %>">
	         <%    } %>
	         <% } %>
	            
	         <%  if(currentPage >= maxPage){  %>
	         <input disabled class="btn btn-primary" type="button" value=">">
	         <%  }else{ %>
	         <input class="btn btn-primary" type="button" onclick="location.href='<%= root %>currentPage=<%=currentPage + 1 %>'" value=">">
	         <%  } %>
	         <input class="btn btn-primary" type="button" onclick="location.href='<%= root %>currentPage=<%= maxPage %>'" value=">>">
      </div>

			
			<script>
				window.onload = function(){
				    // 문서가 로딩되고 난 후 바로 실행됨
				    
				    <%System.out.println("serv?" + serv);%>
					if(<%=serv!="rList.su"%>){
						$('#hpIndex').val('<%=hpIndex%>').prop("selected", true);
						$('#hpArea').val('<%=hpArea%>').prop("selected", true);
						$('#keyword').val('<%=keyword%>');
					}
				};

				function iconChange(obj) {
					var icon1 = document.getElementsByName("icon1");
					var icon2 = document.getElementsByName("icon2");
					
					for(var i in icon1){
						if(obj==icon1[i]){

							var good = $("[name=good]").eq(i);
							var bad = $("[name=bad]").eq(i);
							
							if(icon1[i].style.color=="red"){
								$.ajax({
									url: "/todaysDoctor/rEval.su",
									type: "get",
									data: {
										good : good.html(),
										addGood : '-1',
										bad : bad.html(),
										addBad : '0'
									}, 
									success: function(result){
										good.html(result.split(",")[0]);
										bad.html(result.split(",")[1]);
										
									}, error: function(){
										console.log("실패입니다."+good);
									}
								});
								
								icon1[i].style = "font-size: 17pt; color:#999; cursor:pointer;";
								icon2[i].style = "font-size: 17pt; color:#999; cursor:pointer;";
								
							} else {
								if(icon2[i].style.color=="blue"){
									$.ajax({
										url: "/todaysDoctor/rEval.su",
										type: "get",
										data: {
											good : good.html(),
											addGood : '1',
											bad : bad.html(),
											addBad : '-1'
										}, 
										success: function(result){
											good.html(result.split(",")[0]);
											bad.html(result.split(",")[1]);
											
										}, error: function(){
											console.log("실패입니다."+good);
										}
									});
																	
								} else {
									$.ajax({
										url: "/todaysDoctor/rEval.su",
										type: "get",
										data: {
											good : good.html(),
											addGood : '1',
											bad : bad.html(),
											addBad : '0'
										}, 
										success: function(result){
											good.html(result.split(",")[0]);
											bad.html(result.split(",")[1]);
											
										}, error: function(){
											console.log("실패입니다."+good);
										}
									});
								}

								icon1[i].style = "font-size: 17pt; color:red; cursor:pointer;";
								icon2[i].style = "font-size: 17pt; color:#999; cursor:pointer;";
							}
						} 
					};

					
					for(var i in icon2){
						if(obj==icon2[i]){
							if(icon2[i].style.color=="blue"){
								
								var good = $("[name=good]").eq(i);
								var bad = $("[name=bad]").eq(i);
								
								$.ajax({
									url: "/todaysDoctor/rEval.su",
									type: "get",
									data: {
										good : good.html(),
										addGood : '0',
										bad : bad.html(),
										addBad : '-1'
									}, 
									success: function(result){
										good.html(result.split(",")[0]);
										bad.html(result.split(",")[1]);
										
									}, error: function(){
										console.log("실패입니다."+good);
									}
								});
								
								icon1[i].style = "font-size: 17pt; color:#999; cursor:pointer;";
								icon2[i].style = "font-size: 17pt; color:#999; cursor:pointer;";
								
							} else {
								var good = $("[name=good]").eq(i);
								var bad = $("[name=bad]").eq(i);
								
								if(icon1[i].style.color=="red"){
									$.ajax({
										url: "/todaysDoctor/rEval.su",
										type: "get",
										data: {
											good : good.html(),
											addGood : '-1',
											bad : bad.html(),
											addBad : '1'
										}, 
										success: function(result){
											good.html(result.split(",")[0]);
											bad.html(result.split(",")[1]);
											
										}, error: function(){
											console.log("실패입니다."+good);
										}
									});
									
								} else {
									$.ajax({
										url: "/todaysDoctor/rEval.su",
										type: "get",
										data: {
											good : good.html(),
											addGood : '0',
											bad : bad.html(),
											addBad : '1'
										}, 
										success: function(result){
											good.html(result.split(",")[0]);
											bad.html(result.split(",")[1]);
											
										}, error: function(){
											console.log("실패입니다."+good);
										}
									});
								}
								
								icon2[i].style = "font-size: 17pt; color:blue; cursor:pointer;";
								icon1[i].style = "font-size: 17pt; color:#999; cursor:pointer;";
								
							}
						}
					}
				};
				
				function search(){
                    location.href="<%=request.getContextPath()%>/rSearch.su?keyword="+$('#keyword').val()
                    				+"&hpIndex="+$('#hpIndex option:selected').val()+"&hpArea="+$('#hpArea option:selected').val();
				}
				
				<%-- function sorting(){
					location.href="<%=request.getContextPath()%>/rSort.su?keyword="+$('#keyword').val()
    				+"&hpIndex="+$('#hpIndex option:selected').val()+"&hpArea="+$('#hpArea option:selected').val()+"&category="+$('#category').text();
					
				} --%>
			</script>
		</div>
	</form>
	</section>

</body>
	<%@ include file="footer.jsp" %>
</html>