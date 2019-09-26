package com.doctor.review.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.doctor.hospital.model.service.HospitalService;
import com.doctor.hospital.model.vo.Hospital;
import com.doctor.reserve.model.service.ReservationService;
import com.doctor.reserve.model.vo.Reservation;
import com.doctor.review.model.service.ReviewService;
import com.doctor.review.model.vo.Review;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/rInsert.su")
public class ReviewInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // 전송값 받기
	   int resNum = Integer.parseInt(request.getParameter("resNum"));
	   String hpCode = request.getParameter("hpCode");
	   String hpName = request.getParameter("hpName");
	   String reTitle = request.getParameter("reTitle");
	   String review = request.getParameter("review");
	   String writeDate = request.getParameter("resDate");
	   System.out.println(hpName);
	   System.out.println(writeDate);
	   int hpPoint1 = Integer.parseInt(request.getParameter("hpPoint1"));
	   int hpPoint2 = Integer.parseInt(request.getParameter("hpPoint2"));
	   int hpPoint3 = Integer.parseInt(request.getParameter("hpPoint3"));
	   int hpPoint4 = Integer.parseInt(request.getParameter("hpPoint4"));
	   int hpPoint5 = Integer.parseInt(request.getParameter("hpPoint5"));
  
	   Date reDate = null;  
		
	   if(writeDate != "" && writeDate != null) {
		   // 날짜가 들어 왔다면
	         
	       // 2019-08-16 -> 2019,8,16
	       String[] dateArr = writeDate.split("-");
	       int[] intArr = new int[dateArr.length];
	         
	       // String -> int
	       for(int i=0; i<dateArr.length; i++) {
	          intArr[i] = Integer.parseInt(dateArr[i]);
	       }
	         
	       reDate = new Date(
	             new GregorianCalendar(
	                   intArr[0],intArr[1]-1,intArr[2]
	                ).getTimeInMillis()
	             );
	         
	    }else {
	       // 날짜가 들어오지 않았다면
	       reDate = new Date(new GregorianCalendar().getTimeInMillis());
	    }

	   double avgPoint = (double)(hpPoint1 + hpPoint2 +hpPoint3 +hpPoint4 +hpPoint5)/5;
    
	   HttpSession session = request.getSession(false);
	   User u = (User)session.getAttribute("user");
	   String userId = u.getUserId();
 
	   // 객체에 담아 서비스로 보내기
	   Review r = new Review();
	   r.setResNum(resNum);
	   r.setUserId(userId);         //유저아이디
	   r.setReTitle(reTitle);      // 타이틀
	   r.setReDate(reDate);
	   r.setHpCode(hpCode);
	   r.setHpName(hpName);
	   r.setHpAvgpoint(avgPoint);
	   r.setHpPoint1(hpPoint1);
	   r.setHpPoint2(hpPoint2);
	   r.setHpPoint3(hpPoint3);
	   r.setHpPoint4(hpPoint4);
	   r.setHpPoint5(hpPoint5);
	   r.setReview(review);
      
	   // 서비스 결과 처리하기
	   
	   int result = new ReviewService().insertReview(r);
      
	   if(result > 0) {
		   System.out.println("후기 작성 완료");
		   request.getRequestDispatcher("favoriteList.my").forward(request, response);
         
	   }else {
		   response.sendRedirect("views/common/errorPage.jsp");
	   }    
   	}

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}