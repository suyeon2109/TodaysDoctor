package com.doctor.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doctor.user.model.service.UserService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/uInsert.me")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 가입 서비스를 연동하는 서블릿
		
		
		String userId= request.getParameter("id");
		String userPwd= request.getParameter("password");
		String userName= request.getParameter("name");
		String userPno = request.getParameter("pnumber");
		String userEmail = request.getParameter("email") + request.getParameter("emailaf");
		String userPhone = request.getParameter("phone");
		String userArea = request.getParameter("area");
		
		User u = new User(userId, userPwd, userName, userPno, userEmail, userPhone, userArea);
		
		System.out.println("가입 회원 정보 확인 : " + u);
		
		
		
		UserService us = new UserService();
		
		int result = us.insertUser(u);
		
		if(result >0) {
			// 회원가입성공 시
			System.out.println("회원 가입에 성공하였습니다.");
			
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
