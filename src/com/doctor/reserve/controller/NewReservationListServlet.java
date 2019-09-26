package com.doctor.reserve.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import com.doctor.user.model.service.UserService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class NewReservationListServlet
 */
@WebServlet("/newReservation.my")
public class NewReservationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewReservationListServlet() {
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
		
		JSONObject newReservation = null;
		JSONArray newReservationList = new JSONArray();
		
		JSONObject result = new JSONObject();
		
		list = new ReservationService().newReservationList(userId);
		
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				newReservation = new JSONObject();
				Reservation res = list.get(i);
				
				String month = res.getResDate().toString().substring(5,7);
				String day = res.getResDate().toString().substring(8,10);

				newReservation.put("resNum", res.getResNum());
				newReservation.put("hpName", res.getHpName());
				newReservation.put("hpArea", res.getHpArea());
				newReservation.put("hpAddress", res.getHpAddress());
				newReservation.put("hpPhone", res.getHpPhone().toString());
				newReservation.put("resMonth", month);
				newReservation.put("resDay", day);
				newReservation.put("resTime", res.getResTime());
				newReservation.put("resMin", res.getResMin());
				newReservation.put("resContent", res.getResContent());
				
				newReservationList.add(newReservation);
			}
		}else {
			newReservationList.add(newReservation);
		}
				
		result.put("newReservationList", newReservationList);
		
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
