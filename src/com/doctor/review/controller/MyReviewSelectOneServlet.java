package com.doctor.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doctor.reserve.model.service.ReservationService;
import com.doctor.reserve.model.vo.Reservation;
import com.doctor.review.model.service.ReviewService;
import com.doctor.review.model.vo.Review;

/**
 * Servlet implementation class MyReviewSelectOneServlet
 */
@WebServlet("/reviewSelectOne.my")
public class MyReviewSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		
		Review review = new Review();
		Reservation reservation = new Reservation();
		System.out.println(reNum);
		review = new ReviewService().selectMyReviewOne(reNum);
		
		// 후기 db에서 가져온 예약 번호를 가지고 예약 정보 불러오기
		int resNum = review.getResNum();
		reservation = new ReservationService().lastReservationOne(resNum);
		
		String page = "";
		
		if(review != null) {
			page = "views/reviewDetail.jsp";
			request.setAttribute("review", review);
			request.setAttribute("reservation", reservation);
		}else {
			page = "views/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
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
