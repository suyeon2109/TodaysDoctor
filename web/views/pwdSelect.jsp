<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idSelect = (String)request.getAttribute("selectID");
%>
<!DOCTYPE html>

<%@ include file="header.jsp" %> 

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

<body>
   <section id="fh5co-contact" data-section="contact">
      <div class="container">
         <div class="row">
            <div class="col-md-12 section-heading text-center to-animate">
               <h2 >비밀번호 재설정</h2>
               <div class="row">
                  <div class="col-md-8 col-md-offset-2 subtext ">
                     <h3>비밀번호가 재설정 되었습니다.</h3>
                  </div>
               </div>
            </div>
            <!--  -->
            
            <div class="form-group to-animate">
              <input class="btn btn-primary btn-lg" value="로그인"
							id="logpass"type="button" style="width: 100%" onclick="loginSrc();">
                 <script>
                 	function loginSrc(){
                 		location.href = "/todaysDoctor/views/login.jsp";
                 	}
                 </script>
            </div>
         </div>

      </div>
   </section>
</body>
	<%@ include file="footer.jsp" %> 
</html>