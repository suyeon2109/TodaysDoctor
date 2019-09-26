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
 * Servlet implementation class PwdSelectServlet
 */
@WebServlet("/pwdSelect.me")
public class PwdSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PwdSelectServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pnumber = request.getParameter("pnumber");
		User resultUser = null;
		User u = new User(id, name, pnumber);
		System.out.println(u);

		UserService us = new UserService();

		resultUser = us.pwdSelect(u);

		if (resultUser != null) {
			System.out.println("비밀번호 설정 : 회원 조회 성공: " + resultUser);
			HttpSession session = request.getSession();

			session.setAttribute("ResultUser", resultUser);

			RequestDispatcher view = request.getRequestDispatcher("views/pwdReset.jsp");
			view.forward(request, response);
		} else {
			System.out.println("조회 실패");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
