package com.doctor.hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.hospital.model.service.HospitalService;
import com.doctor.user.model.service.UserService;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class MyFavoriteHoDeleteServlet
 */
@WebServlet("/favoriteDelete.my")
public class MyFavoriteHoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFavoriteHoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hpName = request.getParameter("hpName");
		System.out.println(hpName);
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		
		ArrayList<String> favoriteHosArr = new ArrayList<String>();
		String resultStr = null;
		System.out.println(user.getUserFavorite());
		// 즐겨찾는 병원에 ','가 들어있을 경우. 즉, 즐겨찾는 병원이 2개 이상일 경우
		if(user.getUserFavorite().indexOf(",") > -1) {
			resultStr = "";
			String[] favoriteHos = user.getUserFavorite().split(",");
			// 배열을 자유자재로 삭제할 수 있는 ArrayList에 차례대로 하나씩 담기
			for(int i = 0; i < favoriteHos.length; i++) {
				favoriteHosArr.add(favoriteHos[i]);
			}
			
			for(int i = 0; i < favoriteHosArr.size(); i++) {
				// 즐겨찾는 병원 삭제				
				if(favoriteHosArr.get(i).equals(hpName)) {
					favoriteHosArr.remove(i);
				}
			}
			
			// 특정 병원이 제거된 배열들을 컬럼에 넣기 위하여 ","를 붙여 다시 문자열로 변환
			for(int i = 0; i < favoriteHosArr.size(); i++) {
				if(i == favoriteHosArr.size() - 1) {
					resultStr += favoriteHosArr.get(i);
				}else {
					resultStr += favoriteHosArr.get(i) + ",";
				}			
			}
			System.out.println(resultStr);
		}

		int result = new UserService().updateFavHospital(userId, resultStr);
		
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("favoriteList.my");
			
			user.setUserFavorite(resultStr);
			session.setAttribute("user", user);
			
			view.forward(request, response);
		}else {
			response.sendRedirect("views/errorPage.jsp");
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
