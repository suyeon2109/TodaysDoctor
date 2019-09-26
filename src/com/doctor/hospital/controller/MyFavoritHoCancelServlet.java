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
 * Servlet implementation class MyFavoritHoCancelServlet
 */
@WebServlet("/FavoritHoDelete.my")
public class MyFavoritHoCancelServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFavoritHoCancelServlet() {
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
      System.out.println("세션 즐겨찾는 병원삭제 전 : "+u.getUserFavorite());
      System.out.println(userId+" 회원에 즐겨찾는 병원 삭제 :"+ hpName);
      String deleteSessionFavorite = u.getUserFavorite();
      System.out.println(deleteSessionFavorite);
      String hpName2 = null;
      String hpName3 = null;
      hpName2 = deleteSessionFavorite.replace(hpName+",", "");
      hpName3 = hpName2.replace(hpName, "");
      
      
      System.out.println("삭제된 즐찾 명 :"+hpName);
      HospitalService hs = new HospitalService();
      
      int result = hs.deleteFavoritHo(userId,hpName3);
      if(result >0) {
         if(hpName3.length() == 0) {
            hpName3 = null;
         }
         u.setUserFavorite(hpName3);
         session.setAttribute("user", u);
         u = (User) session.getAttribute("user");
         System.out.println("세션 즐겨찾는 병원삭제 후 : "+u.getUserFavorite());
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