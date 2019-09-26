package com.doctor.reserve.model.service;

import static com.doctor.common.JDBCTemplate.close;
import static com.doctor.common.JDBCTemplate.commit;
import static com.doctor.common.JDBCTemplate.getConnection;
import static com.doctor.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.doctor.reserve.model.dao.ReservationDao;
import com.doctor.reserve.model.vo.Reservation;
import com.doctor.user.model.vo.User;

public class ReservationService {
	
	private ReservationDao rDao = new ReservationDao();
	
	public int insertReservation(Reservation r) {
	      Connection con = getConnection();
	      
	      int result = rDao.insertReservation(con,r);
	      
	      if(result > 0) commit(con);
	      else rollback(con);
	      
	      close(con);
	      return result;
	   }
	
//	public User userNowReservation(String resultStr) {
//		Connection con = getConnection();
//		
//		User str = rDao.userNowReservation(con, resultStr);
//		
//		
//		if(str != null) commit(con);
//		else rollback(con);
//		
//		close(con);
//		return str;
//	}

	public ArrayList<Reservation> newReservationList(String userId) {
		Connection con = getConnection();		
		
		ArrayList<Reservation> list = rDao.newReservationList(con, userId);
		
		if(!(list.isEmpty())) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	public ArrayList<Reservation> lastReservationList(String userId){
		Connection con = getConnection();
		
		ArrayList<Reservation> list = rDao.lastReservationList(con, userId);
		
		if(!(list.isEmpty())) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return list;
	}
	
	public Reservation lastReservationOne(int resNum) {
		Connection con = getConnection();
		
		Reservation reservation = new Reservation();
		
		reservation = rDao.lastReservationOne(con, resNum);
		
		if(reservation != null) {
			commit(con);
		}else {
			rollback(con);
		}
		return reservation;
	}

	public int newReservationDelete(int resNum) {
		Connection con = getConnection();
		
		int result = rDao.newReservationDelete(con, resNum);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
}
