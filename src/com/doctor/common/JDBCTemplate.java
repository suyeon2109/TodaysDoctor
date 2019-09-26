package com.doctor.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;


public class JDBCTemplate {

   public static Connection getConnection() {
      Connection conn = null;
      
      try {

         Properties prop = new Properties();
         String fileName = JDBCTemplate.class.getResource("/config/driver.properties").getPath();
			
		 prop.load(new FileReader(fileName));
         
         String driver = prop.getProperty("driver");
         String url = prop.getProperty("url");
         String user = prop.getProperty("user");
         String password = prop.getProperty("password");
         
         Class.forName(driver);
         conn = DriverManager.getConnection(url,user,password);
         
         
      } catch(ClassNotFoundException e) {
         e.printStackTrace();
      } catch(SQLException e) {
         e.printStackTrace();
      } catch(FileNotFoundException e) {
         e.printStackTrace();
      } catch(IOException e) {
         e.printStackTrace();
      }
      
      return conn;
   }
   

   public static void close(Connection conn) {
      try {
         if(conn != null && !conn.isClosed()) {
            conn.close();
         }
         
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void close(Statement stmt) {
      try {
         if(stmt != null && !stmt.isClosed()) {
            stmt.close();
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void close(ResultSet rset) {
      try {
         if(rset != null && !rset.isClosed()) {
            rset.close();
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
   }

   public static void commit(Connection conn) {
      try {
         if(conn != null && !conn.isClosed()) {
            conn.commit();
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void rollback(Connection conn) {
      try {
         if(conn != null && !conn.isClosed()) {
            conn.rollback();
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
}