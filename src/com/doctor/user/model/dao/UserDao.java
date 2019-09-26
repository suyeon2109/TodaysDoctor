package com.doctor.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.doctor.user.model.vo.User;
import static com.doctor.common.JDBCTemplate.*;

public class UserDao {

   private Properties prop;

   // 회원 가입 메소드
   public UserDao() {
      prop = new Properties();

      String filePath = UserDao.class.getResource("/config/user-query.properties").getPath();

      try {
         prop.load(new FileReader(filePath));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   /**
    * 회원가입 user 추가
    * 
    * @param con
    * @param u
    * @return
    */
   public int insertUser(Connection con, User u) {
      // 결과 확인을 위한 변수 result 생성
      int result = 0;

      PreparedStatement pstmt = null;

      String sql = prop.getProperty("insertUser");
      try {
         System.out.println(sql);
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, u.getUserId());
         pstmt.setString(2, u.getUserPwd());
         pstmt.setString(3, u.getUserName());
         pstmt.setString(4, u.getUserPno());
         pstmt.setString(5, u.getUserEmail());
         pstmt.setString(6, u.getUserPhone());
         pstmt.setString(7, u.getUserArea());

         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }

      return result;
   }

   public User loginUser(Connection con, User u) {
      User result = null; // 결과를 담을 객체
      PreparedStatement pstmt = null;
      ResultSet rset = null; // Select의 결과를 담은 객체

      String sql = prop.getProperty("loginUser");

      try {
         System.out.println(sql);
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, u.getUserId());
         pstmt.setString(2, u.getUserPwd());

         rset = pstmt.executeQuery();

         if (rset.next()) {
            result = new User();

            result.setUserId(u.getUserId());
            result.setUserPwd(u.getUserPwd());

            result.setUserName(rset.getString("USER_NAME"));
            result.setUserPno(rset.getString("USER_PNO"));
            result.setUserEmail(rset.getString("USER_EMAIL"));
            result.setUserPhone(rset.getString("USER_PHONE"));
            result.setUserArea(rset.getString("USER_AREA"));
            result.setUserFavorite(rset.getString("USER_FAVORITE"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      System.out.println(result);
      return result;
   }

   public int idCheck(Connection con, String userId) {
      int result = 1;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("idCheck");
      ResultSet rset = null;
      System.out.println("DAO : "+sql);
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, userId);
         rset = pstmt.executeQuery();
         if (rset.next()) {
            result = 1;
         } else {
            result = 0;
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);

      }
      return result;
   }

   public String idSelect(Connection con, String userEmail) {
      User result = null; // 결과를 담을 객체
      PreparedStatement pstmt = null;
      ResultSet rset = null; // Select의 결과를 담은 객체
      String selectId = null;
      String sql = prop.getProperty("idSelect");
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, userEmail);

         rset = pstmt.executeQuery();

         if (rset.next()) {
            selectId = rset.getString("USER_ID");
         }

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return selectId;
   }

   public User pwdSelect(Connection con, User u) {
      User result = null; // 결과를 담을 객체
      PreparedStatement pstmt = null;
      ResultSet rset = null; // Select의 결과를 담은 객체
      String selectPwd = null;
      
      String sql = prop.getProperty("pwdSelect");
      System.out.println(sql);
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, u.getUserId());
         pstmt.setString(2, u.getUserName());
         pstmt.setString(3, u.getUserPno());

         rset = pstmt.executeQuery();

         if (rset.next()) {
            result = new User();
            result.setUserId(rset.getString("USER_ID"));
            result.setUserPwd(rset.getString("USER_PWD"));
            result.setUserName(rset.getString("USER_NAME"));
            result.setUserPno(rset.getString("USER_PNO"));
            result.setUserEmail(rset.getString("USER_EMAIL"));
            result.setUserPhone(rset.getString("USER_PHONE"));
            result.setUserArea(rset.getString("USER_AREA"));
            result.setUserFavorite(rset.getString("USER_FAVORITE"));           
         }

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      System.out.println(selectPwd);
      return result;
   }


   public int pwdReset(Connection con, User u) {
      int result = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null; // Select의 결과를 담은 객체
      
      String sql = prop.getProperty("pwdReset");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setString(1, u.getUserPwd());
         pstmt.setString(2, u.getUserId());
         pstmt.setString(3, u.getUserPno());
         
         result = pstmt.executeUpdate();
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }

   public int updateUser(Connection con, User u) {
      // 결과 확인을 위한 변수 result 생성
      int result = 0;

      PreparedStatement pstmt = null;

      String sql = prop.getProperty("updateUser");
      try {
         System.out.println(sql);
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, u.getUserPwd());
         pstmt.setString(2, u.getUserEmail());
         pstmt.setString(3, u.getUserPhone());
         pstmt.setString(4, u.getUserArea());
         pstmt.setString(5, u.getUserId());
         pstmt.setString(6, u.getUserName());
         pstmt.setString(7, u.getUserPno());
         System.out.println(result);
         result = pstmt.executeUpdate();
         System.out.println(result);
      }catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }

      return result;
   }

   public int deleteUser(Connection con, String deleteId) {
      // 결과 확인을 위한 변수 result 생성
      int result = 0;

      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteUser");
      try {
         System.out.println(sql);
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, deleteId);
         
         result = pstmt.executeUpdate();
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }

   public int userMypage(Connection con, User u) {
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int result = 0;
      String sql = prop.getProperty("loginUser");
      try {
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,u.getUserId());
      pstmt.setString(2,u.getUserPwd());
      
      rset = pstmt.executeQuery();
      
      if(rset!=null) {
         result = 1;
      }else {
         result = 0;
      }
      
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }
   
   public int updateFavHospital(Connection con, String userId, String resultStr) {
	   int result = 0;
	   PreparedStatement pstmt = null;
	   
	   String sql = prop.getProperty("updateFavHospital");
	   
	   try {
		   pstmt = con.prepareStatement(sql);
		   
		   pstmt.setString(1, resultStr);
		   pstmt.setString(2, userId);
		   
		   result = pstmt.executeUpdate();
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }finally {
		   close(pstmt);
	   }
	   return result;	   
	}
   
}