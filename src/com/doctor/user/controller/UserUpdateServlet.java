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
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/uUpdate.me")
public class UserUpdateServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 회원정보 업데이트
      String userId= request.getParameter("id");
      String userPwd= request.getParameter("password");
      String userName= request.getParameter("name");
      String userPno = request.getParameter("pnumber");
      String userEmail = request.getParameter("email") + request.getParameter("emailaf");
      String userPhone = request.getParameter("phone");
      String userArea = request.getParameter("area");
      
      User u = new User(userId, userPwd, userName, userPno, userEmail, userPhone, userArea);
      
      System.out.println("Servlet 수정될 회원 정보 확인 : " + u);
      
      UserService us = new UserService();
      
      int result = us.updateUser(u);
      
      if(result >0) {
         System.out.println("회원 수정에 성공하였습니다.");
         
         HttpSession session = request.getSession(false);
         
         if(session != null) {
            System.out.println("다시 로그인 해주세요!");
            session.invalidate();
         }
         
         RequestDispatcher view
            = request.getRequestDispatcher("views/login2.jsp");
         
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