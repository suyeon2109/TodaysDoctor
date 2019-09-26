<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp"%>

<title>Document</title>
<style>
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

.section-heading {
    padding-bottom: 0px;
    margin-bottom: 0px;
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
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">아이디 찾기</h2>
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>회원가입시 입력한 이메일을 입력해주세요.</h3>
						</div>
					
				</div>
			</div>	
				<!-- 아이디 -->
				<form method="GET" action="/todaysDoctor/idselect.me">
					<div class="form-group to-animate">
						<label for="email">이메일</label> <br> <input id="email"
							name="email" class="form-control" placeholder="Email" type="text"
							onkeyup="emailinput();" style="width: 100%;">
					</div>

					<div class="form-group to-animate">
						<input class="btn btn-primary btn-lg" value="아이디 찾기" type="submit"
							style="width: 100%">
					</div>
				</form>
				<br><br><br>
				
				<!--  비밀번호 찾기  -->
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">비밀번호 찾기</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>회원가입시 입력한 아이디, 이름, 주민번호를 입력해주세요.</h3>
						</div>
					</div>
				</div>
				<!-- 중복 폼 -->
				<form method="GET" action="/todaysDoctor/pwdSelect.me" onsubmit="return pwdck();">
					<div class="form-group to-animate">
						<label for="id">아이디</label> <br>
						
						<input id="id" name="id" class="form-control"
							placeholder="띄어쓰기 없이 영/숫자 6-10자" type="text" onkeyup="idinput();"
							style="width: 100%">
						<p id="idp" style="display: none"></p>
					</div>
					<script>
						function idinput() {
							var id = document.getElementById("id");
							// console.log(id.value);
							var idp = document.getElementById("idp");
							if (!chk(/^[a-z][a-z\d]{6,12}$/, id,
									"아이디의 첫글자는 영문  소문자,6~12자 입력할것!", idp))
								return;

							if (!chk(/[0-9]/, id, "아이디에 숫자 하나 이상 포함", idp))
								return false;

						}
					</script>
					<div class="form-group to-animate">
						<label for="name">이름</label> <br> <input id="name"
							name="name" class="form-control" placeholder="Name" type="text"
							style="width: 100%;" onkeyup="pnameinput();">
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
					<div class="form-group to-animate">
						<label for="pnumber">주민번호(-)포함</label> <br> <input
							id="pnumber" name="pnumber" class="form-control"
							placeholder="pnumber" type="text" onkeyup="pnuminput();"
							style="width: 100%;">
						<p id="pnump" style="display: none"></p>
					</div>
					<script>
						function pnuminput() {
							var pnumber = document.getElementById("pnumber");
							var pnump = document.getElementById("pnump");
							if (!chk(
									/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/,
									pnumber,
									"주민번호 형식이 잘못되었습니다. 끝까지 입력해주세요 (-)포함", pnump)) {
								return;
							}
						}
					</script>
					<div class="form-group to-animate">
						<input class="btn btn-primary btn-lg" value="비밀번호 찾기"
							type="submit" style="width: 100%">
					</div>
				</form>


				<div class="form-group to-animate">

					<span id="singUp" style="float: right"><a
						href="./signUp.jsp" data-nav-section="work"><span>회원가입</span></a>
					</span> <br> <br>
				</div>
			</div>
		</div>
	</section>

</body>
<%@ include file="footer.jsp"%>
</html>