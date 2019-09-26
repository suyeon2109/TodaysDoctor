package com.doctor.hospital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doctor.hospital.model.service.HospitalService;
import com.doctor.hospital.model.vo.Hospital;
import com.doctor.user.model.vo.User;

/**
 * Servlet implementation class HospitalOneServlet
 */
@WebServlet("/hopOne.ho")
public class HospitalOneServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     HttpSession session = request.getSession();
      
     User u = (User)session.getAttribute("user");
     System.out.println(u);
     User us = new User();
     
      /*
       * String userid = u.getUserId(); if(userid == null) { userid = "noUser"; }
       */
     //Object userid = request.getAttribute("userid");
     //System.out.println("userid :"+userid);
      
     int hno = Integer.parseInt(request.getParameter("hdHospitalNo")); 
     System.out.println("hno : " + hno);
      
      Hospital h = new HospitalService().selectOne(hno);
      System.out.println("결과값 Return : " + h);
      String page = "";
      
      if(h !=null) {
         page = "views/yeyeak1.jsp";
         request.setAttribute("Hospital", h);
      }
      if(session.getAttribute("user") == null){
         page = "views/login.jsp";
         request.setAttribute("User", us);
      }   
      request.getRequestDispatcher(page).forward(request, response);   
   
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}