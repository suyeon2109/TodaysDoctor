package com.doctor.reserve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.reserve.model.service.ReservationService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class NewReservationDeleteServlet
 */
@WebServlet("/newReservationDelete.my")
public class NewReservationDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewReservationDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resNum = Integer.parseInt(request.getParameter("resNum"));
		HttpSession session = request.getSession();
		
		int result = new ReservationService().newReservationDelete(resNum);
		
		String page ="";
		
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
