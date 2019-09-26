package com.doctor.review.controller;

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

import com.doctor.hospital.model.vo.PageInfo;
import com.doctor.review.model.service.ReviewService;
import com.doctor.review.model.vo.Review;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class MyReivewListServlet
 */
@WebServlet("/reviewList.my")
public class MyReivewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReivewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		
		ArrayList<Review> list = new ArrayList<Review>();
		
		/*int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 5;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}*/
		
		/*int listCount = new ReviewService().getMyReviewListCount(userId);*/
		
		/*maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = ((int)((double)currentPage / 10 + 0.9) - 1) * limit + 1;

		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}*/
		
		list = new ReviewService().selectMyReview(userId);
		
		request.setAttribute("myReviewList", list);
		
		/*PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		request.setAttribute("pi", pi);*/
	
		JSONObject review;
		JSONArray myReviewList = new JSONArray();
		
		JSONObject result = new JSONObject();

		
		for(int i = 0; i < list.size(); i++) {
			review = new JSONObject();
			
			review.put("reviewNo",list.get(i).getReNum());
			review.put("hospitalName", list.get(i).getHpName());
			review.put("reviewTitle", list.get(i).getReTitle());
			review.put("reviewDate", list.get(i).getReDate().toString());
			/*review.put("currentPage", currentPage);
			review.put("listCount", listCount);
			review.put("limit", limit);
			review.put("maxPage", maxPage);
			review.put("startPage", startPage);
			review.put("endPage", endPage);*/

			myReviewList.add(review);
		}
		
		result.put("myReviewList", myReviewList);
		
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
