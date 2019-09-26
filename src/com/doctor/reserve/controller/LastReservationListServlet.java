package com.doctor.reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.doctor.reserve.model.service.ReservationService;
import com.doctor.reserve.model.vo.Reservation;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class LastReservationListServlet
 */
@WebServlet("/lastReservation.my")
public class LastReservationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LastReservationListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();

		JSONObject result = new JSONObject();
		JSONObject lastReservation = null;
		JSONArray lastReservationList = new JSONArray();
		
		list = new ReservationService().lastReservationList(userId);
		
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				lastReservation = new JSONObject();
				Reservation res = list.get(i);
				
				String year = res.getResDate().toString().substring(0,4);
				String month = res.getResDate().toString().substring(5,7);
				String day = res.getResDate().toString().substring(8,10);
				System.out.println(res.getResDate());
				
				lastReservation.put("resNum", res.getResNum());
				lastReservation.put("hpCode", res.getHpCode());
				lastReservation.put("hpIndex", res.getHpIndex());
				lastReservation.put("hpName", res.getHpName());
				lastReservation.put("hpArea", res.getHpArea());
				lastReservation.put("hpDoctor", res.getHpDoctor());
				lastReservation.put("resYear", year);
				lastReservation.put("resMonth", month);
				lastReservation.put("resDay", day);
				lastReservation.put("resContent", res.getResContent());
				
				lastReservationList.add(lastReservation);
			}
		}else {
			lastReservationList.add(lastReservation);
		}
		
		result.put("lastReservationList", lastReservationList);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(result.toJSONString());
		System.out.println(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
