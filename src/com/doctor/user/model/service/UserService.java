package com.doctor.user.model.service;

import java.sql.Connection;

import com.doctor.user.model.dao.UserDao;
import com.doctor.user.model.vo.User;
import static com.doctor.common.JDBCTemplate.*;
// Service :
// Controller인 서블릿에서
// 전달한 정보를 업무 수행로직(비즈니스 로식)에
// 따라 가공하여 DAO에게 전달하는 역할

public class UserService {
   // Service는 하나의 SQL을 담당하는 DAO 메소드들을
   // 더 큰 하나의 서비스라는 개념으로 묶어 처리하는
   // 비즈니스 로직(업무 로직)을 담당하는 객체이다.
   // 따라서 DB의 트랜잭션에 대한 TCL(commit/rollback)처리를
   // 직접 담당해야 한다.
   
   private Connection con;
   private UserDao uDao = new UserDao();
   
   /**
    * @param u
    * @return
    */
   public int insertUser(User u) {
      
      con = getConnection();
      
      
      int result = uDao.insertUser(con,u);
      
      if(result > 0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      close(con);
      
      return result;
      
   }

   public User loginUser(User u) {
      
      con = getConnection();
      
      User result = uDao.loginUser(con,u);
      
      if(result != null) {
         commit(con);
      }else {
         rollback(con);
      }
      
      close(con);
      
      return result;
   }

   public String idSelect(String userEmail) {
      
      con = getConnection();
      String result = uDao.idSelect(con,userEmail);

      
      close(con);
      System.out.println(result);
      return result;
   }
   
   public User pwdSelect(User u) {
      
      con = getConnection();
      User result = uDao.pwdSelect(con,u);

      
      close(con);
      System.out.println(result);
      return result;
   }

   public int idCheck(String userId) {
      
      con = getConnection();
      int result = uDao.idCheck(con, userId);
      
      close(con);
      System.out.println(result);
      return result;

   }


   public int pwdReset(User u) {
      con = getConnection();
      int result = uDao.pwdReset(con, u);
      
      if(result > 0) commit(con);
      else rollback(con);
      
      close(con);
      
      return result;
      
   }

   public int updateUser(User u) {
      con = getConnection();
      
      
      int result = uDao.updateUser(con,u);
      
      if(result > 0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      close(con);
      
      return result;
   }

   public int deleteUser(String deleteId) {
      con = getConnection();
      
      
      int result = uDao.deleteUser(con,deleteId);
      
      if(result > 0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      close(con);
      
      return result;
   }

   public int userMypage(User u) {
      con = getConnection();
      int result = uDao.userMypage(con, u);
      
      close(con);
      System.out.println(result);
      return result;
   }
   
   public int updateFavHospital(String userId, String resultStr) {
		con = getConnection();
	   
		int result = uDao.updateFavHospital(con, userId, resultStr);
	   
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
	   
	  	close(con);
	   
	  	return result;
	}

}