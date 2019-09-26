<%@page import="com.doctor.reserve.model.vo.Reservation"%>
<%@page import="com.doctor.hospital.model.vo.Hospital"%>
<%@page import="com.doctor.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Calendar" %>

    
<%
   Hospital h = (Hospital)request.getAttribute("Hospital");
   User u = (User)session.getAttribute("user");
   Reservation r = (Reservation)request.getAttribute("Reservation");
   Calendar cal = Calendar.getInstance();
   DecimalFormat df = new DecimalFormat("00");
   Calendar currentCalendar = Calendar.getInstance();
   String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
   String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
   String strDay = df.format(currentCalendar.get(Calendar.DATE)+1);
   String strDate = strYear + strMonth + strDay;
   

%>
<!DOCTYPE html>

<%@ include file="header.jsp" %> 
   <style>
      #fh5co-home, #fh5co-home .text-wrap {
       height: 120px; /*높이*/
      }
      #img1{
         position: fixed;
         left: 20px;
      }
      #user{
         list-style: none;
         padding-left: 0px;
      }
   </style>

   <!-- Modernizr JS -->
   <!-- <script src="js/modernizr-2.6.2.min.js"></script> -->
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->
   
   <body>
<!--먼가 여기 까지 쓸거 같아-->
   <section id="fh5co-contact" data-section="contact">
   <form class="form-inline" method="get" action="/todaysDoctor/rInsert.res">  
      <div class="container">
         <div class="row-bottom-padded-md">
            <div class="col-md-6 to-animate">
               <h3>병원 정보</h3>
               <ul class="fh5co-contact-info">
                  <p style="color: black"><%= h.getHpName() %></p>
                  
              <input id="hpname" type="hidden" name="hpname" class="fh5co-position" value="<%= h.getHpName() %>">                  
              <input id="hno" type="hidden" name="hdHospitalNo" class="fh5co-position" value="<%= h.getHnum() %>">                  
                  <input id="hpcode" type="hidden" name="hpcode" class="fh5co-position" value="<%= h.getHpCode() %>">
                  <input id="hpindex" type="hidden" name="hpindex" class="fh5co-position" value="<%= h.getHpIndex() %>">
                  <input id="hparea" type="hidden" name="hparea" value="<%= h.getHpArea()%>">
                  <input id="hpadd" type="hidden" name="hpadd" value="<%= h.getHpAddress()%>">
                  <input id="hpphone" type="hidden" name="hpphone" value="<%= h.getHpPhone()%>">
                  
                  <li class="fh5co-contact-address"><i class="icon-home">
                       병원 주소 : <%= h.getHpArea()%><br>
                          <br>&nbsp;&nbsp;&nbsp;상세 주소 : <%= h.getHpAddress() %></i><br>
                   </li><br>
                  <li><i class="icon-clock2" ></i>진료시간 : <%= h.getHpOpen() %>:00시 ~ <%= h.getHpClose() %>:00시</li>
                  <li style="color: red">
                        <i class="icon-clock2"></i> 
                           점심시간은 <%= h.getHpLunchSt() %>:00 ~ <%= h.getHpLunchFi() %>:00 입니다
                     </li>
                  <li><i class="icon-phone"></i> 병원 전화번호 : <%= h.getHpPhone() %></li>
                  <li><i class="icon-envelope"></i>병원 메일 : <%= h.getHpEmail() %></li>
                  <img src="/todaysDoctor/views/images/grade1(예약2).png"><font size="4">&nbsp;<%=h.getAvgPoint() %>&nbsp;&nbsp;</font>
               </ul>
               
                  
            </div>
            
            
            
            &nbsp;
            &nbsp;
            &nbsp;

            <div class="col-md-6 to-animate">
               <h3>병원예약</h3>
               <div class="form-group ">
                    <p name ="userid" type ="hidden"><%= u.getUserId() %></p>
                  <p name ="username"><%= u.getUserName() %></p>
                  <p name ="useremail"><%= u.getUserEmail() %></p>
                  <p name ="userphone"><%= u.getUserPhone() %></p>
                  
                  <!--<label for="name" class="sr-only">Name</label>-->
                  <!--<input id="name" class="form-control" placeholder="Name" type="text">-->
               </div>

               <div >
                  
                     <input name ="resdata" style="color: #999" type="date" class="form-control" onchange="test();" min="<%=strYear %>-<%=strMonth %>-<%=strDay %>" placeholder="datetime input" id="date">
                   
                        
                     <select name="restime" style="color: #999" class="form-control" id ="time_find" >
                        <option hidden >시간 선택</option>
                        <option value="09">오전 9시</option>
                        <option value="10">오전 10시</option>
                        <option value="11">오전 11시</option>
                        <option value="12">오후 12시</option>
                        <option value="14">오후 2시</option>
                        <option value="15">오후 3시</option>
                        <option value="16">오후 4시</option>
                        <option value="17">오후 5시</option>
                        <option value="18">오후 6시</option>
                     </select>
                     
                     <select name="resmin" style="color: #999 " class="form-control">
                        <option value="00"> 정각</option>
                        <option value="30"> 30분</option>
                     </select>
                  
               </div>
               <br>
               
               <div>
                     <select name="resdoctor" style="color: #999" class="form-control" id="Director_cho">
                        <option value="선택안함">원장님 선택하지 않음</option>
                        <option><%= h.getHpDoctor1() %></option>
                        <option><%= h.getHpDoctor2() %></option>
                        <option><%= h.getHpDoctor3() %></option>
                     </select>
               </div><br>
            
               <div class="form-group">
                  <select name="rescontent" style="color: #999" class = "form-control" id="show" onchange="view();">
                     <option>증상불명</option>
                     <option>직접입력</option>
                  </select>
               </div>

               <script>
                  function view(){
                     var value = $("#show option:selected").val();
                     
                     var showmessage = document.getElementById("message");
                     //console.log(value);
                     if(value =="직접입력"){
                        showmessage.style.display = "block";
                        reserve.style.display = "block";
                        
                     }else{
                        showmessage.style.display = "none";
                        reserve.style.display = "block";
                     }
                  }
               </script>              

               <div id="message" style="display:none" class="form-group ">
                     <label for="message" class="sr-only">Message</label>
                     <textarea name="message" id="message" cols="30" rows="5" class="form-control" placeholder="원장님께 알려드릴 증상을 입력하세요"></textarea>
               </div>
              
               <br><br>
               <div class="form-group ">
                     <input class="btn btn-primary" value="예약" type="submit" id="btn-reserve" onclick="location.href='<%=request.getContextPath()%>/rInsert.res'"/>
                     <script>
                     function yeyeak2(){
                                 location.href = "./yeyeak2.jsp";
                              }
                     </script>
               </div>

               
            </div>

         </div>
      </div>
      </form>
   </section>
   
   <link rel="stylesheet" type="text/css" href="starRating.css"/>
   
   </body>
   <%@ include file="footer.jsp" %> 
</html>