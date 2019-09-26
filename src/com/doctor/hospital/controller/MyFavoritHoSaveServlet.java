package com.doctor.hospital.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.hospital.model.service.HospitalService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class MyFavoritHoSaveServlet
 */
@WebServlet("/FavoritHoInsert.my")
public class MyFavoritHoSaveServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFavoritHoSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      User u = (User) session.getAttribute("user");
      String userId = u.getUserId();
      String hpName = (String)request.getParameter("hpName");
      System.out.println("세션추가 전 : "+u.getUserFavorite());
      System.out.println(userId+" 회원에 즐겨찾는 병원 추가 :"+ hpName);
      
      if(u.getUserFavorite() != null ||u.getUserFavorite() != "") {
         hpName = (u.getUserFavorite()+","+hpName).replace("null,", "");
         if(u.getUserFavorite() != null &&u.getUserFavorite().length()==0) {
            u.setUserFavorite(null);
            hpName = (String)request.getParameter("hpName");
         }
      }
      System.out.println(", 판별 후 "+u.getUserFavorite());
      HospitalService hs = new HospitalService();
      
      int result = hs.updateFavoritHo(userId,hpName);
      if(result >0 ) {
         u.setUserFavorite(hpName);
         session.setAttribute("user", u);
         u = (User) session.getAttribute("user");
         System.out.println("세션추가 후 : "+u.getUserFavorite());
         
      }else {
         System.out.println("즐겨찾기 추가 실패하였습니다.");
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