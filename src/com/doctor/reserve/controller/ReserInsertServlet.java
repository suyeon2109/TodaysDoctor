package com.doctor.reserve.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.doctor.reserve.model.service.ReservationService;
import com.doctor.reserve.model.vo.Reservation;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class ReserInsertServlet
 */
@WebServlet("/rInsert.res")
public class ReserInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //기본 전송값 실시
      HttpSession session = request.getSession();
         
      User u = (User)session.getAttribute("user");        
            
        String hpcode = request.getParameter("hpcode");
        String hpname = request.getParameter("hpname");
        String hpindex= request.getParameter("hpindex");
        String hparea = request.getParameter("hparea");
        String hpadd  = request.getParameter("hpadd");
        String hpphone = request.getParameter("hpphone");
         int restime = Integer.parseInt(request.getParameter("restime"));
         int resmin = Integer.parseInt(request.getParameter("resmin"));
         String resdoctor = request.getParameter("resdoctor");
         String rescontent = request.getParameter("rescontent");
         String message = request.getParameter("message");
         String resdata = request.getParameter("resdata");    
        
         
         
         System.out.println(message);
         Date writeDate = null;
         
         if(resdata !="" && resdata !=null) {
            //날짜들어옴
            
            String[] dateArr = resdata.split("-");
            int[] intArr = new int[dateArr.length];
            
            //String-> int
            for(int i=0; i<dateArr.length; i++) {
               intArr[i] = Integer.parseInt(dateArr[i]);
            }
            
            writeDate = new Date(
                  new GregorianCalendar(
                        intArr[0],intArr[1]-1,intArr[2]).getTimeInMillis()
                  );
         }else {
            //날짜 안들어옴
            writeDate = new Date(new GregorianCalendar().getTimeInMillis());
         }
         if(message == "") {
        	 message = "증상불명";
         }
         Reservation r = new Reservation();                  
         r.setHpCode(hpcode);
         r.setHpName(hpname);
         r.setHpIndex(hpindex);
         r.setHpArea(hparea);
         r.setHpAddress(hpadd);
         r.setHpPhone(hpphone);
         r.setUserId(u.getUserId());
         r.setUserName(u.getUserName());
         r.setResTime(restime);
         r.setResMin(resmin);
         r.setResDate(writeDate);
         r.setHpDoctor(resdoctor);
         if(rescontent.equals("직접입력")) {
            r.setResContent(message);
         }else {
            r.setResContent(rescontent);
         }
         //System.out.println("서블릿 r : "+r);
         
         //view(JSP) -> Controller(Servlet) -> Service
        
         ReservationService rs = new ReservationService();
         
         String page = ""; 
         
         int result = rs.insertReservation(r);        
         
         System.out.println(result);
         
         if(result > 0) {
            //page = "resCh.res";
            page = "views/yeyeak2.jsp";
            request.setAttribute("Reservation", r);
            
         }else {
            page = "views/errorPage.jsp";
             request.setAttribute("msg", "게시글 상세보기 실패!!");
             
         }
         
         request.getRequestDispatcher(page).forward(request, response);   
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}