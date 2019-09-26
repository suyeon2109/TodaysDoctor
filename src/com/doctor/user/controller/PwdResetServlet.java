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
@WebServlet("/pwdReset.me")
public class PwdResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdResetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("password");
		
		
		// 해당 회원을 구분짓는 ID 받아오기
		HttpSession session = request.getSession(false);
		User u = (User)session.getAttribute("ResultUser");
		
		u.setUserPwd(pwd);
		
		System.out.println("비밀번호 재설정 회원 정보 확인 : " + u);
		
		UserService us = new UserService();
		
		if(us.pwdReset(u) > 0) {
			// 비밀번호 변경 수정 성공!
			
			System.out.println("비밀번호 수정 완료!");
			
			session.invalidate();//세션 소멸
			RequestDispatcher view
		     = request.getRequestDispatcher("views/pwdSelect.jsp");
		
			view.forward(request, response);
		}else {
			// 실패!!
			
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
