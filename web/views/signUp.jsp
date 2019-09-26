<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <title>Document</title>
   <%@ include file="header.jsp" %>
   <style>
      #a {
         float: left;
         width: 33.3%;
      }

      #b {
         float: left;
      }

      #fh5co-home,
      #fh5co-home .text-wrap {
         height: 120px;
         /*높이*/
      }

      /* .row-bottom-padded-md {
      padding-left:10em;
      } */


      .form-group {
         margin-left: 18%;
         width: 60%;
      }

      #idck{
         float:right;
      }
   </style>
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
<script src="js/jquery-3.4.1.min.js"> </script>
<body>
   <section id="fh5co-contact" data-section="contact">
      <div class="container">
         <div class="row">
            <div class="col-md-12 section-heading text-center">
               <h2 class="to-animate">회원가입</h2>
               <div class="row">
                  <div class="col-md-8 col-md-offset-2 subtext to-animate">
                     <h3>안녕하세요! 회원가입을 위한 회원정보를 입력해주세요</h3>
                  </div>
               </div>
            </div>

            <!--  -->
            <form class="form-inline" role="form" name="frm" onsubmit="return singck();"
               action="<%=request.getContextPath() %>/uInsert.me" method="get" >
               <div class="form-group to-animate">
                  <label for="id">아이디</label>
                  <br>
                  <!-- 중복 폼 -->
                  <input id="id" name="id" class="form-control" placeholder="띄어쓰기 없이 영/숫자 6-10자" type="text"
                     onkeyup="idinput();" value="${userId}" style="width:72%">
                  <input id="idck" class="btn btn-primary btn-lg" value="중복확인" type="button" style="width:23%; "
							onclick="idCheck();" name="reid">
				  <input type="text" id="idcheck1" name="idcheck1" value="0" style="display:none;">   
						<script>
							function idCheck() {
								var id = document.getElementById("id");
								if (submitchk(/^[a-z][a-z\d]{6,12}$/, id) == false || submitchk(/[0-9]/,id) == false) {
									alert("아이디를 영문,숫자 조합 6~12자 형식에 맞게 입력해주세요. ");
								}else{
									var count = 0;
									$.ajax({
										url:"<%=request.getContextPath()%>/idCheck.me",
										type:"post",
										data:{id : $('#id').val()},
										success:function(data){
											
											if(data=='ok'){
												$('input[name=idcheck1]').attr('value',"1");
												alert("사용 가능한 아이디입니다.");
												$(id).prop('readonly', true); // 아이디값 읽기 전용으로 적용
												count = 0;
											}else{
												$('input[name=idcheck1]').attr('value',"0");
												alert("이미 사용중인 아이디 입니다.");
												$('#id').select();
												count = 1;
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
							}
						</script>
                  <p id="idp" style="display: none"></p>
                  <script>
                     function idinput() {
                        var id = document.getElementById("id");
                        // console.log(id.value);
                        var idp = document.getElementById("idp");
                        if (!chk(/^[a-z][a-z\d]{6,12}$/, id, "아이디의 첫글자는 영문  소문자,6~12자 입력할것!", idp))
                           return;

                        if (!chk(/[0-9]/, id, "아이디에 숫자 하나 이상 포함", idp))
                           return false;


                     }
                  </script>

               </div>
               <br><br>
               <div class="form-group to-animate">
                  <label for="password">비밀번호(확인)</label>
                  <br>
                  <input id="password" name="password" class="form-control" placeholder="6-15자의 영문 대소문자, 숫자 및 특수문자 조합" type="password"
                     onkeyup="pwinput();" style="width:100%">
               </div>
               <script>
                  function pwinput() {
                     var password = document.getElementById("password");
                     var pwd = document.getElementById("pwp");

                     if (!chk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/, password, "6~20 영문 대소문자, 최소1개의 숫자 혹은 특수문자를 포함", pwp)) {

                        return;
                     } else {

                        return;
                     }
                  }

               </script>
               <br>
               <div class="form-group to-animate">
                  <input id="pwcheck" class="form-control" placeholder="비밀번호와 일치" type="password"
                     onkeyup="pwckinput();" style="width:100%; ">
                  <p id="pwp" style="display: none"></p>
               </div>
               <script>
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
               <br><br>
               <div class="form-group to-animate">
                  <label for="name">이름</label>
                  <br>
                  <input id="name" name="name" class="form-control" placeholder="Name" type="text" style="width:100%;" onkeyup="pnameinput();">
                  <p id="pname" style="display: none"></p>
               </div>
					<script>
						function pnameinput() {
							var name = document.getElementById("name");
							var pname = document.getElementById("pname");
							if (name.value == null || name.value == "") {
								pname.innerHTML = "*이름을 입력해주세요."
								pname.style.display = "block";
								pname.style.color = "red";

							} else {
								pname.style.display = "none";
							}
						}
					</script>

					<br><br>
               <div class="form-group to-animate">
                  <label for="pnumber">주민번호(-)포함</label>
                  <br>
                  <input id="pnumber" name="pnumber" class="form-control" placeholder="pnumber" type="text"
                     onkeyup="pnuminput();" style="width: 100%;">
                  <p id="pnump" style="display: none"></p>
               </div>
               <script>
                  function pnuminput() {
                     var pnumber = document.getElementById("pnumber");
                     var pnump = document.getElementById("pnump");
                     if (!chk(/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/,
                        pnumber, "주민번호 형식이 잘못되었습니다. 끝까지 입력해주세요 (-)포함", pnump)) {
                        return;
                     }
                  }
               </script>
               <br><br>
               <div class="form-group to-animate">
                  <label for="email">이메일</label>
                  <br>
                  <input id="email" name="email" class="form-control" placeholder="Email" type="text" onkeyup="emailinput();"
                     style="width:38%; ">



                  <input id="emailaf" name="emailaf" class="form-control" placeholder="@Email.com" type="text"
                     style="width:30%; ">

                  <select id="mails" class="form-control" onchange="emailf();" style="width:31%; float: right;">
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

               <br><br>
               <div class="form-group to-animate">
                  <label for="phone">휴대폰번호(-포함)</label><br>
                  <input id="phone" name="phone" class="form-control" placeholder="Phone" type="text" onkeyup="phoneinput();"
                     style="width: 100%;">
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
               <br><br>
               <div class="form-group to-animate">
                  <label for="area">거주지역</label><br>
                  <select style="color: #999; width:100%;" class="form-control" name="area" id="area">

                     <option hidden>지역</option>
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
               <br><br>
               <div class="form-group to-animate">
                  <input class="btn btn-primary btn-lg" value="회원 가입" type="submit" style="width:100%">

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
				

               
               function singck() {
                  var id = document.getElementById("id");
                  var idcheck1 = document.getElementById("idcheck1");
                  var password = document.getElementById("password");
                  var pwcheck = document.getElementById("pwcheck");
                  var name = document.getElementById("name");
                  var pnumber = document.getElementById("pnumber");
                  var email = document.getElementById("email");
                  var emailaf = document.getElementById("emailaf");
                  var emailfull = email.value+emailaf.value;
                  var phone = document.getElementById("phone");
                  var area = document.getElementById("area");
                  var area = document.getElementById("area");
                  var areaselect = area.options[area.selectedIndex].value;
                  
                  var err1 = "";
                  if(idcheck1.value == "0"){
                	  alert("중복체크를 해주세요!");
                	  return false;
                  }else{
                	  if (submitchk(/^[a-z][a-z\d]{6,12}$/, id) == false) {
                          err1 += "아이디 \n";
                       }
                       if (submitchk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/, password) == false) {
                          err1 += "비밀번호 \n";
                       }
                       if (name.value == null || name.value==""){
                          err1 += "이름 \n";
                       }
                       if(submitchk(/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/,pnumber)==false){
                          err1 += "주민번호 \n";
                       }
                       if(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(emailfull)==false){
                          err1 += "이메일 \n";
                       }
                       if(submitchk(/^\d{3}-\d{3,4}-\d{4}$/,phone)==false){
                          err1 += "휴대폰번호 \n";
                       }
                       if(areaselect == "지역"){
                          err1 += "거주지역 \n";
                       }
                       if(err1 != ""){
                          alert(err1+"를(을) 바르게 입력해주세요");
                          return false;
                       }
                  }
                  
               }

            </script>
         </div>
         <br><br>


      </div>
      </div>
   </section>

</body>
   <%@ include file="footer.jsp" %> 
</html>