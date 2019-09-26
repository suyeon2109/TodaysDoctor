<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idSelect = (String)request.getAttribute("selectID");
%>
<!DOCTYPE html>

<%@ include file="header.jsp"%>

<title>Document</title>
<style>
* {
	font-family: "나눔바른고딕";
}

#fh5co-home, #fh5co-home .text-wrap {
	height: 120px;
	/*높이*/
}

#a {
	float: left;
	width: 33.3%;
}

#b {
	float: left;
	width: 50%;
}

/* .row-bottom-padded-md {
      padding-left:10em;
      } */
#singUp a {
	color: #7A7A7A;
}

.form-group {
	margin-left: 18%;
	width: 60%;
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

<body>
	<section id="fh5co-contact" data-section="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center to-animate">
					<h2>비밀번호 재설정</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext ">
							<h3>재설정할 비밀번호를 입력해주세요!</h3>
						</div>
					</div>
				</div>
				<!--  -->
				<form method="GET" action="/todaysDoctor/pwdReset.me"
					onsubmit="return singck();">
					<div class="form-group to-animate">
						<label for="password">비밀번호(확인)</label> <br> <input
							id="password" name="password" class="form-control"
							placeholder="6-15자의 영문 대소문자, 숫자 및 특수문자 조합" type="text"
							onkeyup="pwinput();" style="width: 100%">
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
					<div class="form-group to-animate">
						<input id="pwcheck" class="form-control" placeholder="비밀번호와 일치"
							type="text" onkeyup="pwckinput();" style="width: 100%;">
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
				
				<div class="form-group to-animate">
					<input class="btn btn-primary btn-lg" value="비밀번호 재설정" type="submit"
						src="./login.jsp" style="width: 100%">
				</div>
						</form>
				<div class="form-group to-animate">
					<span id="singUp" style="float: right"><a
						href="./signUp.jsp" data-nav-section="work"><span>회원가입</span></a>
						&nbsp;&nbsp; <a href="/todaysDoctor/views/idpwd.jsp"
						data-nav-section="testimonials"><span>아이디/비밀번호 찾기</span></a> </span>
				</div>
			</div>
		</div>

		<script>
               function submitchk(re, ele) {
                  if (re.test(ele.value)) {
                     return true;
                  } else {
                     return false;
                  }
               }
				

               
               function singck() {
                  var password = document.getElementById("password");
                  var pwcheck = document.getElementById("pwcheck");
                  
                  var err1 = "";
                  
          
                   if (submitchk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/, password) == false) {
                      err1 += "비밀번호 \n";
                   }
                   if (submitchk(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/, pwcheck) == false) {
                       err1 += "비밀번호 확인 \n";
                   }
                   if(password.value != pwcheck.value){
                	   alert("비밀번호\n비밀번호 확인 이 일치하지않습니다.");
                	   return false;
                   }else if(err1 != ""){
                   		alert(err1+"를(을) 바르게 입력해주세요");
                        return false;
                   }
                  }
                  
               

            </script>
	</section>
</body>
<%@ include file="footer.jsp"%>
</html>