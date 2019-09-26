package com.doctor.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.hospital.model.service.HospitalService;
import com.doctor.hospital.model.vo.Hospital;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class MypageFavoriteServlet
 */
@WebServlet("/favoriteList.my")
public class MyFavoriteHoServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFavoriteHoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ArrayList<Hospital> list = null;
      HttpSession session = request.getSession();
      
      User user = (User)session.getAttribute("user");
      if(user.getUserFavorite() != null) {
         String[] favoriteHos = user.getUserFavorite().split(",");

         list = new HospitalService().selectFavHospital(favoriteHos);

         String page = "";
         
         if(!(list.isEmpty())) {
            page = "views/myPage.jsp";
         }else {
            page = "views/errorPage.jsp";
         }
      }
         RequestDispatcher view = request.getRequestDispatcher("views/myPage.jsp");
         request.setAttribute("favoriteList", list);
         
         view.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}