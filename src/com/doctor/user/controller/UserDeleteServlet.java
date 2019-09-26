package com.doctor.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.user.model.service.UserService;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/deleteUser.me")
public class UserDeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String deleteId = request.getParameter("id");
      UserService us = new UserService();
      
      int result = us.deleteUser(deleteId);
      if(result > 0 ) {
         System.out.println("회원탈퇴 성공");
         
         HttpSession session = request.getSession(false);
         session.invalidate();
         
         RequestDispatcher view
         = request.getRequestDispatcher("views/main.jsp");
      
         view.forward(request, response);
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