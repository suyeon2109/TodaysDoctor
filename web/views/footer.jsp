<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<body>

    <br><br><br><br><br><br>
   <footer id="footer" role="contentinfo">
         <a href="#" class="gotop js-gotop">To<i class="icon-arrow-up2">Top</i></a>
         <div class="container">
            <div class="">
               <div class="col-md-12 text-left">
               <hr style="border: solid 2px #52d3aa" width="100px" align="left">
               <p><font size="5">(주)오늘의 닥터 </font><br>
               <font color="#52d3aa">주소 : </font>서울시 강남구 테헤란로14길 6 &nbsp;
               <font color="#52d3aa">대표자 : </font>문열그조<br>
               <font color="#52d3aa">사업자등록번호 : </font>902-81-02019 &nbsp;
               <font color="#52d3aa">E-mail : </font>openthedoor@open.com<br>
               &copy; 2019 OpenTheDoor All Rights Reserved.</p>         
               </div>
            </div>
         </div>
    </footer>
    
    <!-- End demo purposes only -->
   <script>
      $(function(){
         $('#colour-variations ul').styleSwitcher({
            defaultThemeId: 'theme-switch',
            hasPreview: false,
            cookie: {
                   expires: 30,
                   isManagingLoad: true
               }
         });   
         $('.option-toggle').click(function() {
            $('#colour-variations').toggleClass('sleep');
         });
      });
   </script>
   <!-- End demo purposes only -->

   <!-- Main JS (Do not remove) -->
   <script src="views/js/main.js"></script>
</body>
</html>