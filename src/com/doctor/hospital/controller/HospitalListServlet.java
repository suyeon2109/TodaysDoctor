package com.doctor.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doctor.hospital.model.service.HospitalService;
import com.doctor.hospital.model.vo.Hospital;
import com.doctor.hospital.model.vo.PageInfo;

/**
 * Servlet implementation class HospitalListServlet
 */
@WebServlet("/selectList.ho")
public class HospitalListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ArrayList<Hospital> list = null;
      HospitalService hs = new HospitalService();
      
      // 페이징 처리에 필요한 변수들 
      // 한 번에 표시할 페이지들 중 가장 앞의 페이지
      // 1,2,3,4,5, --> 1 // 6,7,8,9,10 --> 6
      
      int startPage;
      
      // 한번에 표시할 페이지들 중 가장 뒤의 페이지
      int endPage;
      
      // 전체 페이지의 가장 마지막 페이지
      int maxPage;
      
      // 사용자가 위치한 현재 페이지
      int currentPage;
      
      // 총 페이지 수(한 페이지당 보여줄 게시글 수)
      int limit;
      
      // 처음 접속 시 페이지는 1페이지 부터 시작한다.
      currentPage = 1;
      
      // 글 개수 및 페이지 수 10개로 제한하기
      limit = 5;
      
      // 만약에 사용자가 현재 페이지의 정보를 들고 왔다면
      // 현재 페이지의 정보를 1에서 특정 페이지로 수정해주어야 한다.
      if(request.getParameter("currentPage") != null) {
         currentPage = Integer.parseInt(request.getParameter("currentPage")); 
      }
      
      // 페이징 처리
      int listCount = hs.getListCount();
      
      System.out.println("총 페이지 개수 : " + listCount);
      
      maxPage = (int)((double)listCount / limit + 0.8);
      startPage = ((int)((double)currentPage/limit  + 0.8)-1) * limit +1;
      endPage = startPage + limit -1;
      
      if(endPage > maxPage) {
         endPage = maxPage;
      }
      
      
      list = hs.selectHospital(currentPage, limit);
      
      
      String page = "";
      
      if(list != null) {
         page = "views/reservation.jsp";
         request.setAttribute("list", list);
         System.out.println("동하리스트 currentPage :"+currentPage+",listCount :"+listCount+", limit:"+limit+",maxPage"+maxPage+", startPage:"+startPage+", endPage:"+endPage);
         PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
         request.setAttribute("pi",pi);
         request.setAttribute("serv","selectList.ho" );
         
      }else {
         page = "views/reservation.jsp";
         request.setAttribute("msg", "실패!"); // 수정
         response.sendRedirect(page);
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