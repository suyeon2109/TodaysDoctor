package com.doctor.hospital.model.dao;
import static com.doctor.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.doctor.hospital.model.vo.Hospital;

public class HospitalDao {
   
   private Properties prop;
   
   public HospitalDao() {
      prop = new Properties();
      
      String filePath = HospitalDao.class.getResource("/config/hospital-query.properties").getPath();
      
      try {
         prop.load(new FileReader(filePath));
      }catch(IOException e) {
         e.printStackTrace();
      }
   }
   
   public ArrayList<Hospital> selectHospital(Connection con, int currentPage, int limit){
      
      ArrayList<Hospital> list = new ArrayList<Hospital>();
      PreparedStatement pstmt = null;
      PreparedStatement pstmt1 = null;  // 추가
      ResultSet rset = null;
      ResultSet rset1 = null;  // 추가
      
      String sql = prop.getProperty("selectHospital");
      String sql1 = prop.getProperty("hospitalPoint"); //추가 
      try {
         pstmt = con.prepareStatement(sql);
         int startRow = (currentPage -1)* limit +1;
         int endRow = startRow + limit -1;
         
         pstmt.setInt(1, endRow);
         pstmt.setInt(2, startRow);
         
         rset = pstmt.executeQuery();
         
         
         pstmt1 = con.prepareStatement(sql1); // 추가
         
         while(rset.next()) {
            
            Hospital h = new Hospital();
            
            h.setHnum(rset.getInt("HNUM"));
            h.setHpCode(rset.getString("HP_CODE"));
            h.setHpName(rset.getString("HP_NAME"));
            h.setHpIndex(rset.getString("HP_INDEX"));
            h.setHpArea(rset.getString("HP_AREA"));
            h.setHpAddress(rset.getString("HP_ADDRESS"));
            h.setHpOpen(rset.getInt("HP_OPEN"));
            h.setHpClose(rset.getInt("HP_CLOSE"));
            h.setHpLunchSt(rset.getInt("HP_LUNCHST"));
            h.setHpLunchFi(rset.getInt("HP_LUNCHFI"));
            h.setHpPhone(rset.getString("HP_PHONE"));
            h.setHpEmail(rset.getString("HP_EMAIL"));
            pstmt1.setString(1, rset.getString("HP_NAME"));
            rset1 = pstmt1.executeQuery();
            if(rset1.next()) {
               h.setAvgPoint(rset1.getDouble("AVGPOINT"));
            }
            h.setHpDoctor1(rset.getString("HP_DOCTOR1"));
            h.setHpDoctor2(rset.getString("HP_DOCTOR2"));
            h.setHpDoctor3(rset.getString("HP_DOCTOR3"));
            list.add(h);
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return list;
      
   }
   
   public int getListCount(Connection con) {
      
      
      
      int listCount = 0;
      Statement stmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("listCount");
      
      try {
         stmt = con.createStatement();
         rset = stmt.executeQuery(sql);
         
         if(rset.next()) {
            listCount = rset.getInt(1);
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(stmt);
      }
      return listCount;
   }
      
   public Hospital selectOne(Connection con, int hno) {
      Hospital h =  new Hospital();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      PreparedStatement pstmt1 = null;
      String sql1 = prop.getProperty("hospitalPoint");
      ResultSet rset1 = null;
      //String sql = prop.getProperty("selectOne");
      String sql = "SELECT * FROM HPINFO WHERE HNUM = ?";
      try {
         pstmt = con.prepareStatement(sql);
         pstmt1 = con.prepareStatement(sql1);
         pstmt.setInt(1, hno);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            
            h.setHnum(hno);
            h.setHpCode(rset.getString("HP_CODE"));
            h.setHpName(rset.getString("HP_NAME"));
            h.setHpIndex(rset.getString("HP_INDEX"));
            h.setHpArea(rset.getString("HP_AREA"));
            h.setHpAddress(rset.getString("HP_ADDRESS"));
            h.setHpOpen(rset.getInt("HP_OPEN"));
            h.setHpClose(rset.getInt("HP_CLOSE"));
            h.setHpLunchSt(rset.getInt("HP_LUNCHST"));
            h.setHpLunchFi(rset.getInt("HP_LUNCHFI"));
            h.setHpPhone(rset.getString("HP_PHONE"));
            h.setHpEmail(rset.getString("HP_EMAIL"));
            pstmt1.setString(1, rset.getString("HP_NAME"));
            rset1 = pstmt1.executeQuery();
            if(rset1.next()) {
               h.setAvgPoint(rset1.getDouble("AVGPOINT"));
            }
            h.setHpDoctor1(rset.getString("HP_DOCTOR1"));
            h.setHpDoctor2(rset.getString("HP_DOCTOR2"));
            h.setHpDoctor3(rset.getString("HP_DOCTOR3"));
            
         }
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(rset1);
         close(pstmt);
         close(pstmt1);
      }
      return h;
   }
   
   public ArrayList<Hospital> selectFavHospital(Connection con, String[] favoriteHos){
           
      ArrayList<Hospital> list = new ArrayList<Hospital>();
      Hospital hospital = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      PreparedStatement pstmt1 = null;
      String sql = prop.getProperty("selectFavHospital");
      String sql1 = prop.getProperty("hospitalPoint");
      ResultSet rset1 = null;
      try {
         pstmt = con.prepareStatement(sql);
         pstmt1 = con.prepareStatement(sql1); 
         for(int i = 0; i < favoriteHos.length; i++) {
            pstmt.setString(1, favoriteHos[i]);         
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
               hospital = new Hospital();
                  
               hospital.setHnum(rset.getInt("HNUM"));
               hospital.setHpCode(rset.getString("HP_CODE"));
               hospital.setHpName(rset.getString("HP_NAME"));
               hospital.setHpIndex(rset.getString("HP_INDEX"));
               hospital.setHpArea(rset.getString("HP_AREA"));
               hospital.setHpAddress(rset.getString("HP_ADDRESS"));
               hospital.setHpOpen(rset.getInt("HP_OPEN"));
               hospital.setHpClose(rset.getInt("HP_CLOSE"));
               hospital.setHpLunchSt(rset.getInt("HP_LUNCHST"));
               hospital.setHpLunchFi(rset.getInt("HP_LUNCHFI"));
               hospital.setHpPhone(rset.getString("HP_PHONE"));
               hospital.setHpEmail(rset.getString("HP_EMAIL"));
               pstmt1.setString(1, rset.getString("HP_NAME"));
               rset1 = pstmt1.executeQuery();
               if(rset1.next()) {
                  hospital.setAvgPoint(rset1.getDouble("AVGPOINT"));
               }
               hospital.setHpDoctor1(rset.getString("HP_DOCTOR1"));
               hospital.setHpDoctor2(rset.getString("HP_DOCTOR2"));
               hospital.setHpDoctor3(rset.getString("HP_DOCTOR3"));
                  
               list.add(hospital);
            }
         }
            
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
          close(rset1);
          close(pstmt);
          close(pstmt1);
      }
      return list;
   }

   public ArrayList<Hospital> hpsearch(Connection con, String index, String area, String keyword,int currentPage, int limit){
      
      ArrayList<Hospital> list = null;
      PreparedStatement pstmt = null;
      PreparedStatement pstmt1 = null;
      ResultSet rset = null;
      ResultSet rset1 = null;
      
      int startRow = (currentPage -1)* limit +1;
      int endRow = startRow + limit -1;
      
      String sql = prop.getProperty("searchHpName");
      String sql1 = prop.getProperty("hospitalPoint");

      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setString(1, "%"+index+"%");
         pstmt.setString(2, "%"+area+"%");
         pstmt.setString(3, "%"+keyword.trim()+"%");
         pstmt.setInt(4, endRow);
         pstmt.setInt(5, startRow);
         
         pstmt1 = con.prepareStatement(sql1); 

         rset = pstmt.executeQuery();
         
         list = new ArrayList<Hospital>();
         
         while(rset.next()) {
            
            Hospital h = new Hospital();
            
            h.setHnum(rset.getInt("HNUM"));
            h.setHpCode(rset.getString("HP_CODE"));
            h.setHpName(rset.getString("HP_NAME"));
            h.setHpIndex(rset.getString("HP_INDEX"));
            h.setHpArea(rset.getString("HP_AREA"));
            h.setHpAddress(rset.getString("HP_ADDRESS"));
            h.setHpOpen(rset.getInt("HP_OPEN"));
            h.setHpClose(rset.getInt("HP_CLOSE"));
            h.setHpLunchSt(rset.getInt("HP_LUNCHST"));
            h.setHpLunchFi(rset.getInt("HP_LUNCHFI"));
            h.setHpPhone(rset.getString("HP_PHONE"));
            h.setHpEmail(rset.getString("HP_EMAIL"));
            pstmt1.setString(1, rset.getString("HP_NAME"));
            rset1 = pstmt1.executeQuery();
            if(rset1.next()) {
               h.setAvgPoint(rset1.getDouble("AVGPOINT"));
            }
            h.setHpDoctor1(rset.getString("HP_DOCTOR1"));
            h.setHpDoctor2(rset.getString("HP_DOCTOR2"));
            h.setHpDoctor3(rset.getString("HP_DOCTOR3"));
            list.add(h);
         }
         
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset1);
         close(pstmt1);
         close(rset);
         close(pstmt);
      }
      
      return list;
   }

      public int updateFavoritHo(Connection con, String userId, String hpName) {
         int result = 0;
         PreparedStatement pstmt =null;
         String sql = prop.getProperty("UserFavoritUpdate");
         try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, hpName);
            pstmt.setString(2, userId);
            
            result = pstmt.executeUpdate();
            
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
         
         return result;
}

   public int deleteFavoritHo(Connection con, String userId, String hpName) {
      int result = 0;
         PreparedStatement pstmt =null;
         String sql = prop.getProperty("UserFavoritUpdate");
         try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, hpName);
            pstmt.setString(2, userId);
            
            result = pstmt.executeUpdate();
            
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
         
         return result;
   }

   public double avgPoint(Connection con, String hpName) {
      double result = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("hospitalPoint");
      try {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, hpName);
         
         rset = pstmt.executeQuery();
          if (rset.next()) {
         result = rset.getDouble("ROUND(AVG(HP_AVGPOINT),2)");
         System.out.println(result);
         result = (Math.round(result*100)/100.0);
         System.out.println(result+"Math 후");
          }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }
   public  int getSearchListCount(Connection con, String index, String area, String keyword, int currentPage, int limit) {
         
         int listCount = 0;
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         String sql = prop.getProperty("listCountSearch");
         
         try {
            
            pstmt = con.prepareStatement(sql);
            int startRow = (currentPage -1)* limit +1;
            int endRow = startRow + limit -1;
            
            pstmt.setString(1, "%"+index+"%");
            pstmt.setString(2, "%"+area+"%");
            pstmt.setString(3, "%"+keyword.trim()+"%");
            
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
               listCount = rset.getInt(1);
            }
          
           }catch(SQLException e) {
              e.printStackTrace();
           }finally {
              close(rset);
              close(pstmt);
           }
           
           return listCount;
        }
}