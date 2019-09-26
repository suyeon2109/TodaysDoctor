package com.doctor.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.review.model.service.ReviewService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class MyReviewDeleteServlet
 */
@WebServlet("/reviewDelete.my")
public class MyReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reNum = Integer.parseInt(request.getParameter("reNum"));
//		HttpSession session = request.getSession();
//		User user = (User)session.getAttribute("user");
//		String userId = user.getUserId();
		
		int result = new ReviewService().deleteMyReview(reNum);
		
		String page = "";
		
		if(result > 0) {
			page = "favoriteList.my";
		}else {
			page = "views/errorPage.jsp";
		}
		response.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
