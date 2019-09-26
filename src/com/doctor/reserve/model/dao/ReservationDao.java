package com.doctor.reserve.model.dao;

import static com.doctor.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.doctor.reserve.model.vo.Reservation;
import com.doctor.user.model.vo.User;

public class ReservationDao {
	
	private Properties prop = new Properties();
	
	public ReservationDao() {
		String filePath = ReservationDao.class.getResource("/config/reserve-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReservation(Connection con, Reservation r) {
	      int result = 0;
	      String sql = prop.getProperty("insertReservation");
	      PreparedStatement pstmt = null;
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         //pstmt.setInt(1, r.getResNum());
	         pstmt.setString(1, r.getHpCode());
	         pstmt.setString(2, r.getHpName());
	         pstmt.setString(3, r.getHpIndex());
	         pstmt.setString(4, r.getHpArea());
	         pstmt.setString(5, r.getHpAddress());
	         pstmt.setString(6, r.getHpPhone());
	         pstmt.setString(7, r.getUserId());
	         pstmt.setString(8, r.getUserName());                  
	         pstmt.setInt(9, r.getResTime());
	         pstmt.setInt(10, r.getResMin());
	         pstmt.setDate(11, r.getResDate());
	         pstmt.setString(12, r.getHpDoctor());
	         pstmt.setString(13, r.getResContent());
	         
	         result = pstmt.executeUpdate();
	         
	         System.out.println("쳌크: "+result);
	         
	         
	         
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      return result;
	   }

//	public User userNowReservation(Connection con, String resultStr) {
//		int result2 = 0;
//		String sql = prop.getProperty("userNowReservation");
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setString(1, resultStr);
//			
//			result2 = pstmt.executeUpdate();
//			
//			System.out.println("데이터"+result2);
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		
//		return result2;
//	}  -- 출처모름(석영이로 추정) 쓸모없는 메소드로 추정

	public ArrayList<Reservation> newReservationList(Connection con, String userId){
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation reservation;
		
		String sql = prop.getProperty("newReservationList");
		
		try {
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservation = new Reservation();
				
				reservation.setResNum(rset.getInt("RES_NUM"));
				reservation.setHpCode(rset.getString("HP_CODE"));
				reservation.setHpName(rset.getString("HP_NAME"));
				reservation.setHpIndex(rset.getString("HP_INDEX"));
				reservation.setHpArea(rset.getString("HP_AREA"));
				reservation.setHpAddress(rset.getString("HP_ADDRESS"));
				reservation.setHpPhone(rset.getString("HP_PHONE"));
				reservation.setUserId(rset.getString("USER_ID"));
				reservation.setUserName(rset.getString("USER_NAME"));
				reservation.setResTime(rset.getInt("RES_TIME"));
				reservation.setResMin(rset.getInt("RES_MIN"));
				reservation.setResDate(rset.getDate("RES_DATE"));
				reservation.setHpDoctor(rset.getString("HP_DOCTOR"));
				reservation.setResContent(rset.getString("RES_CONTENT"));
			
				list.add(reservation);				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Reservation> lastReservationList(Connection con, String userId){
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation reservation;
		
		String sql = prop.getProperty("lastReservationList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reservation = new Reservation();
				
				reservation.setResNum(rset.getInt("RES_NUM"));
				reservation.setHpCode(rset.getString("HP_CODE"));
				reservation.setHpName(rset.getString("HP_NAME"));
				reservation.setHpIndex(rset.getString("HP_INDEX"));
				reservation.setHpArea(rset.getString("HP_AREA"));
				reservation.setHpAddress(rset.getString("HP_ADDRESS"));
				reservation.setHpPhone(rset.getString("HP_PHONE"));
				reservation.setUserId(rset.getString("USER_ID"));
				reservation.setUserName(rset.getString("USER_NAME"));
				reservation.setResTime(rset.getInt("RES_TIME"));
				reservation.setResMin(rset.getInt("RES_MIN"));
				reservation.setResDate(rset.getDate("RES_DATE"));
				reservation.setHpDoctor(rset.getString("HP_DOCTOR"));
				reservation.setResContent(rset.getString("RES_CONTENT"));
				
				list.add(reservation);				
			}
			for(Reservation res : list) {
				System.out.println("지난예약내역:" + res);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		return list;		
	}
	
	public Reservation lastReservationOne(Connection con, int resNum) {
		Reservation reservation = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("lastReservationOne");
		
		try {
			pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1, resNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reservation = new Reservation();
				
				reservation.setResNum(rset.getInt("RES_NUM"));
				reservation.setHpCode(rset.getString("HP_CODE"));
				reservation.setHpName(rset.getString("HP_NAME"));
				reservation.setHpIndex(rset.getString("HP_INDEX"));
				reservation.setHpArea(rset.getString("HP_AREA"));
				reservation.setHpAddress(rset.getString("HP_ADDRESS"));
				reservation.setHpPhone(rset.getString("HP_PHONE"));
				reservation.setUserId(rset.getString("USER_ID"));
				reservation.setUserName(rset.getString("USER_NAME"));
				reservation.setResTime(rset.getInt("RES_TIME"));
				reservation.setResMin(rset.getInt("RES_MIN"));
				reservation.setResDate(rset.getDate("RES_DATE"));
				reservation.setHpDoctor(rset.getString("HP_DOCTOR"));
				reservation.setResContent(rset.getString("RES_CONTENT"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reservation;
	}
	
	public int newReservationDelete(Connection con, int resNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("newReservationDelete");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, resNum);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;		
	}
}
