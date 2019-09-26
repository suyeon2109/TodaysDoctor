package com.doctor.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.review.model.service.ReviewService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class ReviewEvaluateServlet
 */
@WebServlet("/rEval.su")
public class ReviewEvaluateServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEvaluateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 1. 인코딩
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      ReviewService rs = new ReviewService();
      
      int good = Integer.parseInt(request.getParameter("good"));
      int bad = Integer.parseInt(request.getParameter("bad"));
      int addGood = Integer.parseInt(request.getParameter("addGood"));
      int addBad = Integer.parseInt(request.getParameter("addBad"));
      
      int resultGood = good + addGood;
      int resultBad = bad + addBad;
      
      String result = resultGood+","+resultBad;
      System.out.println(result);
      
      
      // 후기번호 가져오기
      int reNum =Integer.parseInt(request.getParameter("reNum"));
      System.out.println("reNum : " +reNum);
      
      HttpSession session = request.getSession();
      User u = (User) session.getAttribute("user");
      String userId = u.getUserId();
      
      // LIKEINFO 테이블 업데이트
      String addLike = addGood+","+addBad;
      int fin1 = rs.changeLikeInfo(userId,reNum,addLike);
      
      // REVIEW 테이블 좋아요 싫어요 수 변경
      int fin2 = rs.changeGood(reNum,result);
      
      
      // getWriter() -> jsp(success 콜백 함수가 이 정보를 받는다- 호출한 곳으로 다시 보내줌)
      response.getWriter().print(result);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}