package com.doctor.hospital.model.service;

import java.sql.Array;
import java.sql.Connection;
import java.util.ArrayList;

import com.doctor.hospital.model.dao.HospitalDao;
import com.doctor.hospital.model.vo.Hospital;

import static com.doctor.common.JDBCTemplate.*;

public class HospitalService {
   
   private HospitalDao hDao = new HospitalDao();
   
   public int getListCount() {
   
      System.out.println("겟 리스트메소드");
      
      Connection con = getConnection();
      
      int listCount = hDao.getListCount(con);
      
      close(con);
      
      return listCount;
   }
   
   public ArrayList<Hospital> selectHospital(int currentPage, int limit){
      System.out.println("셀렉트hp메소드");
      
      Connection con = getConnection();
      
      ArrayList<Hospital> list = hDao.selectHospital(con, currentPage, limit);
      close(con);
      //System.out.println(list);
      
      return list;
   }
   
   public Hospital selectOne(int hno) {
	      Connection con = getConnection();
	      
	      Hospital h = hDao.selectOne(con, hno);
	      
	      close(con);
	      
	      return h;
	      
	}
   
   public ArrayList<Hospital> selectFavHospital(String[] favoriteHos){
      System.out.println("셀렉트 페이보릿 메소드");
      
      Connection con = getConnection();
         
         ArrayList<Hospital> list = new ArrayList<Hospital>();
         
         list = hDao.selectFavHospital(con, favoriteHos);
         
         if(!list.isEmpty()) {
            commit(con);
         }else {
            rollback(con);
         }
         close(con);
         
         return list;
      }
   
   /**
    * 검색창
    * @param keyword
    * @return
    */
   
   public ArrayList<Hospital> hpsearch(String index,String area,String keyword, int currentPage, int limit){
      System.out.println("hp서치메소드");
      
      Connection con = getConnection();
      
      ArrayList<Hospital> list = null;
      
      list = hDao.hpsearch(con, index, area, keyword, currentPage, limit);
      
      close(con);
      
      return list;
   }

	public int updateFavoritHo(String userId, String hpName) {
		Connection con = getConnection();
		int result = 0;
		result = hDao.updateFavoritHo(con,userId,hpName);
		if(result > 0) {
	        commit(con);
	     }else {
	        rollback(con);
	     }
	     
	     close(con);
	     
	     return result;
	}



	public int deleteFavoritHo(String userId, String hpName) {
		Connection con = getConnection();
		int result = 0;
		result = hDao.deleteFavoritHo(con,userId,hpName);
		if(result > 0) {
	        commit(con);
	     }else {
	        rollback(con);
	     }
	     
	     close(con);
	     
	     return result;
	}
	
	public double avgPoint(String hpName) {
		Connection con = getConnection();
		double result =0;
		result = hDao.avgPoint(con,hpName);
		if(result > 0) {
	        commit(con);
	     }else {
	        rollback(con);
	     }
	     
	     close(con);
		return result;
	}
	   
	public int getSearchListCount(String index,String area,String keyword,int currentPage, int limit) {
	    
	    System.out.println("겟서치 리스트메소드");
	    
	    Connection con = getConnection();
	    
	    
	    int listCount = hDao.getSearchListCount(con, index, area, keyword, currentPage,limit); 
	    
	    close(con);
	    
	    return listCount;
	 }

}