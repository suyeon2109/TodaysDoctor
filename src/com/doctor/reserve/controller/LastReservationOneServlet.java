package com.doctor.reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doctor.reserve.model.service.ReservationService;
import com.doctor.reserve.model.vo.Reservation;

/**
 * Servlet implementation class LastReservationOneServlet
 */
@WebServlet("/lastReservationOne.res")
public class LastReservationOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LastReservationOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNum = Integer.parseInt(request.getParameter("resNum"));
		   
		Reservation reservation = new Reservation();	   
		reservation = new ReservationService().lastReservationOne(resNum);
		
		String page = "";
		
		if(reservation != null) {
			request.setAttribute("reservation", reservation);
			page = "views/writereview.jsp";
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
