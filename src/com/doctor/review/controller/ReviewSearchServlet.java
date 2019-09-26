package com.doctor.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.review.model.service.ReviewService;
import com.doctor.review.model.vo.Review;
import com.doctor.review.model.vo.ReviewPageInfo;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class ReviewSearchServlet
 */
@WebServlet("/rSearch.su")
public class ReviewSearchServlet extends HttpServlet {
   
    
    /**
    * 
    */
   private static final long serialVersionUID = 1L;


   /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      ArrayList<Review> rList = new ArrayList<Review>();

      ReviewService rs = new ReviewService();

      // 검색 키워드
      String keyword = request.getParameter("keyword");
      String hpIndex = request.getParameter("hpIndex");
      String hpArea = request.getParameter("hpArea");
      
      if(keyword==null){
          keyword="";
       }
       
       if(hpIndex==null){
          hpIndex="";
       }
       
       if(hpArea==null){
          hpArea="";
       }
      
      // 한번에 표시할 페이지들 중 가장 앞의 페이지   
      int startPage;

      // 한번에 표시할 페이지들 중 가장 뒤의 페이지
      int endPage;

      // 가장 뒤의 페이지
      int maxPage;

      // 사용자가 위치한 현재 페이지
      int currentPage;

      // 한 페이지당 보여줄 리뷰 수
      int rlimit;

      // 한 페이지당 보여줄 페이지 수
      int plimit;

      // 처음 접속 시 페이지는 1페이지부터 시작
      currentPage = 1;

      // 한 페이지의 리뷰 갯수 12개로 제한하기
      rlimit = 12;

      // 한번에 보여줄 페이지 수 10개로 제한하기
      plimit = 10;

      // 만약에 사용자가 현재 페이지의 정보를 들고 왔다면
      // 현재 페이지의 정보를 1에서 특정 페이지로 수정해주어야한다.
      if(request.getParameter("currentPage") != null) {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }

      // 페이징 처리
      int listCount = rs.getSearchListCount(keyword,hpIndex,hpArea);

      // 만약 전체 게시글 수가 13개라면
      // 페이지는 1,2가 나와야한다.
      // ** 자투리 게시글도 하나의 페이지로 처리해야한다
      // 13 -> 1.3 + 0.9 -> 2.2 -> 2
      maxPage = (int)((double)listCount/rlimit + 0.92);
      if(maxPage==0) {
         maxPage=1;
      }
      // 시작 페이지와 마지막 페이지 계산하기
      // 1~10 : 7, 7/10 -> 0.7 -> 1.6 -> 1 - 1 -> 0*10 +1;
      // 11~20 : 19, 19/10 -> 1.9 -> 2.8 -> 2 - 1 -> 1*10 +1;
      startPage = ((int)((double)currentPage/rlimit + 0.92)-1) * plimit +1;

      // 마지막 페이지
      // 1~10 : 10
      // 11~20 : 20
      endPage = startPage + plimit -1;

      // 만약 마지막 페이지보다 현재 게시글이 끝나는 페이지가 적다면
      // 1~10 : 7...
      if(endPage > maxPage) {
         endPage = maxPage;
      }
      
      HttpSession session = request.getSession();
      User u = (User) session.getAttribute("user");
      String userId = u.getUserId();
      
      
      System.out.println("keyword : " +keyword);
      System.out.println("hpIndex : " +hpIndex);
      System.out.println("hpArea : " +hpArea);
      
      rList = rs.searchReview(userId, keyword, hpIndex, hpArea, currentPage, rlimit);

      String page = "";

      if(rList != null) {
         page = "views/review.jsp";
         request.setAttribute("rList", rList);

         ReviewPageInfo pi = new ReviewPageInfo(currentPage,listCount,rlimit,plimit,maxPage,startPage,endPage);
         request.setAttribute("pi",pi);
         request.setAttribute("serv", "rSearch.su");
         request.setAttribute("keyword", keyword);
         request.setAttribute("hpIndex", hpIndex);
         request.setAttribute("hpArea", hpArea);
         
      }else {
         page = "views/errorPage.jsp";
         request.setAttribute("msg", "후기목록 조회 실패!");
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