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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= request.getParameter("id");
		String userPwd= request.getParameter("password");
		
		User u = new User(userId,userPwd);
		UserService us = new UserService();
		
		u = us.loginUser(u);
		
		if(u !=null) {
			// 로그인 성공!!
			
			System.out.println("로그인 성공 : "+u);
			
			
			// 로그인 정보 세션에 유지하기
			HttpSession session = request.getSession();
			
			session.setAttribute("user", u);
			
			RequestDispatcher view
			= request.getRequestDispatcher("views/main.jsp");
			view.forward(request, response);
			
		}else {
			// 로그인 실패
			
			response.sendRedirect("views/login.jsp");
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
