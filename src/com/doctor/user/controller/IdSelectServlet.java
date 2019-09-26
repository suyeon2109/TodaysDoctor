package com.doctor.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doctor.user.model.service.UserService;

/**
 * Servlet implementation class IdSelect
 */
@WebServlet("/idselect.me")
public class IdSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		System.out.println(userEmail);
		UserService us = new UserService();
		
		String selectID = null;
		System.out.println(selectID);
		selectID = us.idSelect(userEmail);
		System.out.println(selectID);
		
		if(selectID != null) {
			System.out.println("아이디 찾기 성공 : " + selectID);
			RequestDispatcher view =
					request.getRequestDispatcher("views/idSelect.jsp");
			
			request.setAttribute("selectID", selectID);
			
			view.forward(request, response);
		}else {
			System.out.println("아이디 찾기 실패");
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
