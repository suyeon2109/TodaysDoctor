<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

   <title>Document</title>
   <style>
      * {
      font-family: "나눔바른고딕";
      }
      #fh5co-home,
      #fh5co-home .text-wrap {
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
   
   <script src="views/js/modernizr-2.6.2.min.js"></script>

<body>

<%@ include file="header.jsp" %> 

   <section id="fh5co-contact" data-section="contact">
      <div class="container">
         <div class="row">
            <div class="col-md-12 section-heading text-center to-animate">
               <h2 >로그인</h2>
               <div class="row">
                  <div class="col-md-8 col-md-offset-2 subtext ">
                     <h3>회원정보가 수정되었습니다 다시 로그인 해주세요!</h3>
                  </div>
               </div>
            </div>
            <!--  -->
            <form action="<%=request.getContextPath() %>/login.me" method="get" >
            <div class="form-group to-animate">
               <label for="id">아이디</label>
               <input id="id" name="id" class="form-control" placeholder="띄어쓰기 없이 영/숫자 6-10자" type="text"
                  onkeyup="idinput();">
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
            <div class="form-group to-animate">
               <label for="password">비밀번호</label>
               <input id="password" name="password" class="form-control" placeholder="6-15자의 영문 대소문자, 숫자 및 특수문자 조합" type="password"
                  onkeyup="pwinput();">
               <p id="pwp" style="display: none"></p>

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
            </div>

            <div class="form-group to-animate">
               <input class="btn btn-primary btn-lg" value="로그인" type="submit" style="width:100%">
            </div>
            </form>
            <div class="form-group to-animate">
               <span id="singUp" style="float: right"><a href="./signUp.jsp" data-nav-section="work"><span>회원가입</span></a>
                  &nbsp;&nbsp;
                  <a href="./idpwd.jsp" data-nav-section="testimonials"><span>아이디/비밀번호 찾기</span></a>
               </span>
            </div>
         </div>

         <div class="row row-bottom-padded-md">


            <div class="col-md-6 to-animate">


            </div>
         </div>

      </div>
      </div>
   </section>
</body>
   <%@ include file="footer.jsp" %> 
</html>