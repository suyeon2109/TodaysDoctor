package com.doctor.review.model.dao;

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

import com.doctor.review.model.vo.Review;

public class ReviewDao {

   private Properties prop;
   
   public ReviewDao() {
      prop = new Properties();
      
      String filePath = ReviewDao.class.getResource("/config/review-query.properties").getPath();
      
      try {
         prop.load(new FileReader(filePath));
      } catch(IOException e) {
         e.printStackTrace();
      }
   }
   
   // ---- 경연 -----
   public ArrayList<Review> selectMyReview(Connection con, String userId){
      ArrayList<Review> list = new ArrayList<Review>();
      Review review = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectMyReview");
      
      try {
         pstmt = con.prepareStatement(sql);
                  
         /*int startRow = (currentPage - 1) * limit + 1;
         
         int endRow = startRow + limit - 1;*/
         
         pstmt.setString(1, userId);
         /*pstmt.setInt(2, endRow);
         pstmt.setInt(3, startRow);*/

         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            review = new Review();
            
            review.setReNum(rset.getInt("RE_NUM"));
            review.setUserId(userId);
            review.setReTitle(rset.getString("RE_TITLE"));
            review.setReDate(rset.getDate("RE_DATE"));
            review.setHpCode(rset.getString("HP_CODE"));
            review.setHpName(rset.getString("HP_NAME"));
            review.setHpAvgpoint(rset.getInt("HP_AVGPOINT"));
            review.setHpPoint1(rset.getInt("HP_POINT1"));
            review.setHpPoint2(rset.getInt("HP_POINT2"));
            review.setHpPoint3(rset.getInt("HP_POINT3"));
            review.setHpPoint4(rset.getInt("HP_POINT4"));
            review.setHpPoint5(rset.getInt("HP_POINT5"));
            review.setReview(rset.getString("REVIEW"));
            review.setgPoint(rset.getInt("G_POINT"));
            review.setnPoint(rset.getInt("N_POINT"));
            
            list.add(review);
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }
   
   public Review selectMyReviewOne(Connection con, int reNum) {
	   Review review = null;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("selectMyReviewOne");
	   
	   try {
	         pstmt = con.prepareStatement(sql);	      
	         pstmt.setInt(1, reNum);

	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            review = new Review();
	            
	            review.setResNum(rset.getInt("RES_NUM"));
	            review.setReNum(rset.getInt("RE_NUM"));
	            review.setUserId(rset.getString("USER_ID"));
	            review.setReTitle(rset.getString("RE_TITLE"));
	            review.setReDate(rset.getDate("RE_DATE"));
	            review.setHpCode(rset.getString("HP_CODE"));
	            review.setHpName(rset.getString("HP_NAME"));
	            review.setHpAvgpoint(rset.getInt("HP_AVGPOINT"));
	            review.setHpPoint1(rset.getInt("HP_POINT1"));
	            review.setHpPoint2(rset.getInt("HP_POINT2"));
	            review.setHpPoint3(rset.getInt("HP_POINT3"));
	            review.setHpPoint4(rset.getInt("HP_POINT4"));
	            review.setHpPoint5(rset.getInt("HP_POINT5"));
	            review.setReview(rset.getString("REVIEW"));
	            review.setgPoint(rset.getInt("G_POINT"));
	            review.setnPoint(rset.getInt("N_POINT"));
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return review;
   }
   
   public int deleteMyReview(Connection con, int reNum) {
      PreparedStatement pstmt = null;
      PreparedStatement pstmt2 = null;
      int result = 0;
      int result2 = 0;
      
      String sql = prop.getProperty("deleteMyReview");
      String sql2 = prop.getProperty("deleteLikeInfoByReNum");
      
      try {
    	  
    	  pstmt2 = con.prepareStatement(sql2);
          pstmt2.setInt(1, reNum);
          
          result2 = pstmt2.executeUpdate();
          
          pstmt = con.prepareStatement(sql);
          pstmt.setInt(1, reNum);
         
          result = pstmt.executeUpdate();
        
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }

   
   // ---- 수연 ------
   /**
    * 총 후기 갯수
    * @param con
    * @return
    */
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
         
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
      
      return listCount;
   }
   
   
   /**
    * 검색한 후기 총 갯수 확인
    * @param con
    * @param hpArea 
    * @param hpIndex 
    * @param keyword 
    * @return
    */
   public int getSearchListCount(Connection con, String keyword, String hpIndex, String hpArea) {
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("searchListCount");
      
      try {
         pstmt = con.prepareStatement(sql);

         pstmt.setString(1, "%"+keyword.replaceAll("\\p{Z}", "")+"%");
         pstmt.setString(2, "%"+hpIndex+"%");
         pstmt.setString(3, "%"+hpArea+"%");
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt(1);
         }
         
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
   }
   


   /**
    * 전체 후기 조회
    * @param con
    * @param userId 
    * @param currentPage
    * @param limit
    * @return
    */
   public ArrayList<Review> selectList(Connection con, String userId, int currentPage, int rlimit) {

      ArrayList<Review> rList = new ArrayList<Review>();
      
      PreparedStatement pstmt1 = null;
      PreparedStatement pstmt2 = null;
      ResultSet rset1 = null;
      ResultSet rset2 = null;
      
      String sql1 = prop.getProperty("selectList");
      String sql2 = prop.getProperty("selectLikeInfo");
      
      try {
         // 1. 한 페이지의 리뷰 시작번호
         // 2. 한 페이지의 리뷰 끝번호
         int startRow = (currentPage-1)*rlimit + 1; // 1, 13
         int endRow = startRow + rlimit -1; // 12, 24
         
         pstmt1 = con.prepareStatement(sql1);         
         pstmt1.setInt(1, endRow);
         pstmt1.setInt(2, startRow);
         rset1 = pstmt1.executeQuery();
         
         pstmt2 = con.prepareStatement(sql2);
         pstmt2.setString(1, userId);
         
         while(rset1.next()) {
            Review r = new Review();
            
            r.setReNum(rset1.getInt("RE_NUM"));
            
            pstmt2.setInt(2, rset1.getInt("RE_NUM"));
            rset2 = pstmt2.executeQuery();
            
            if(rset2.next()) {
               r.setGood(rset2.getInt("GOOD"));
               r.setBad(rset2.getInt("BAD"));
            } else {
               r.setGood(0);
               r.setBad(0);
            }

            System.out.println("GOOD : " + r.getGood());
            System.out.println("BAD : " + r.getBad());
            
            r.setUserName(rset1.getString("USER_NAME"));
            System.out.println(rset1.getString("USER_NAME"));
            r.setHpName(rset1.getString("HP_NAME"));
            System.out.println(rset1.getString("HP_NAME"));
            r.setReDate(rset1.getDate("RE_DATE"));
            System.out.println(rset1.getDate("RE_DATE"));
            r.setReview(rset1.getString("REVIEW"));
            System.out.println(rset1.getString("REVIEW"));
            r.setHpAvgpoint(rset1.getDouble("HP_AVGPOINT"));
            System.out.println("HP_AVGPOINT : " + rset1.getDouble("HP_AVGPOINT"));
            r.setgPoint(rset1.getInt("G_POINT"));
            System.out.println(rset1.getInt("G_POINT"));
            r.setnPoint(rset1.getInt("N_POINT"));
            System.out.println(rset1.getInt("N_POINT"));
               
            rList.add(r);
            
            System.out.println("rList.size() : " + rList.size());
         }
         
         
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset2);
         close(pstmt2);
         close(rset1);
         close(pstmt1);
      }
      
      
      return rList;
   }

   
   /**
    * 검색한 후기 조회
    * @param con
    * @param userId
    * @param keyword
    * @param hpIndex
    * @param hpArea
    * @param currentPage
    * @param rlimit
    * @return
    */
   public ArrayList<Review> searchReview(Connection con, String userId, String keyword, String hpIndex, String hpArea, int currentPage, int rlimit) {
      
      ArrayList<Review> rList = new ArrayList<Review>();
      PreparedStatement pstmt1 = null;
      PreparedStatement pstmt2 = null;
      ResultSet rset1 = null;
      ResultSet rset2 = null;
  
      // 1. 한 페이지의 리뷰 시작번호
      // 2. 한 페이지의 리뷰 끝번호
      int startRow = (currentPage-1)*rlimit + 1; // 1, 13
      int endRow = startRow + rlimit -1; // 12, 24
               
      String sql1 = prop.getProperty("searchReview");
      String sql2 = prop.getProperty("selectLikeInfo");
  
      try {
         pstmt1 = con.prepareStatement(sql1);
         
         pstmt1.setInt(1, endRow);
         pstmt1.setInt(2, startRow);
         pstmt1.setString(3, "%"+keyword.replaceAll("\\p{Z}", "")+"%");
         pstmt1.setString(4, "%"+hpIndex+"%");
         pstmt1.setString(5, "%"+hpArea+"%");

         rset1 = pstmt1.executeQuery();
         
         pstmt2 = con.prepareStatement(sql2);
         pstmt2.setString(1, userId);

         while(rset1.next()) {
   
            Review r = new Review();
   
            r.setReNum(rset1.getInt("RE_NUM"));
            
            pstmt2.setInt(2, rset1.getInt("RE_NUM"));
            rset2 = pstmt2.executeQuery();
            
            if(rset2.next()) {
               r.setGood(rset2.getInt("GOOD"));
               r.setBad(rset2.getInt("BAD"));
            } else {
               r.setGood(0);
               r.setBad(0);
            }
            
            r.setUserName(rset1.getString("USER_NAME"));
            System.out.println(rset1.getString("USER_NAME"));
            r.setHpName(rset1.getString("HP_NAME"));
            System.out.println(rset1.getString("HP_NAME"));
            r.setReDate(rset1.getDate("RE_DATE"));
            System.out.println(rset1.getDate("RE_DATE"));
            r.setReview(rset1.getString("REVIEW"));
            System.out.println(rset1.getString("REVIEW"));
            r.setHpAvgpoint(rset1.getDouble("HP_AVGPOINT"));
            System.out.println("HP_AVGPOINT : " + rset1.getDouble("HP_AVGPOINT"));
            r.setgPoint(rset1.getInt("G_POINT"));
            System.out.println(rset1.getInt("G_POINT"));
            r.setnPoint(rset1.getInt("N_POINT"));
            System.out.println(rset1.getInt("N_POINT"));
            
            
            rList.add(r);
            System.out.println("rList : " + rList);
      
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset2);
         close(pstmt2);
         close(rset1);
         close(pstmt1);
      }
      
      return rList;
   }

   
   /**
    * 후기 정렬하기
    * @param con
    * @param userId
    * @param category
    * @param keyword
    * @param hpIndex
    * @param hpArea
    * @param currentPage
    * @param rlimit
    * @return
    */
   public ArrayList<Review> sortingReview(Connection con, String userId, String category, String keyword, String hpIndex,
         String hpArea, int currentPage, int rlimit) {
      
      ArrayList<Review> rList = new ArrayList<Review>();
      PreparedStatement pstmt1 = null;
      PreparedStatement pstmt2 = null;
      ResultSet rset1 = null;
      ResultSet rset2 = null;
      
      String sql1 = "";
      String sql2 = prop.getProperty("selectLikeInfo");
      
      // 1. 한 페이지의 리뷰 시작번호
      // 2. 한 페이지의 리뷰 끝번호
      int startRow = (currentPage-1)*rlimit + 1; // 1, 13
      int endRow = startRow + rlimit -1; // 12, 24
      
      if(category.equals("최신순")) {
         sql1 = prop.getProperty("sortingNewest");
      } else if(category.equals("별점순")) {
         sql1 = prop.getProperty("sortingPoint");
      } else {
         sql1 = prop.getProperty("sortingGood");
      }
         
  
      try {
         pstmt1 = con.prepareStatement(sql1);
         
         pstmt1.setInt(1, endRow);
         pstmt1.setInt(2, startRow);
         pstmt1.setString(3, "%"+keyword.replaceAll("\\p{Z}", "")+"%");
         pstmt1.setString(4, "%"+hpIndex+"%");
         pstmt1.setString(5, "%"+hpArea+"%");

         rset1 = pstmt1.executeQuery();
         
         pstmt2 = con.prepareStatement(sql2);
         pstmt2.setString(1, userId);

         while(rset1.next()) {
   
            Review r = new Review();
            
            r.setReNum(rset1.getInt("RE_NUM"));
            
            pstmt2.setInt(2, rset1.getInt("RE_NUM"));
            rset2 = pstmt2.executeQuery();
            
            if(rset2.next()) {
               r.setGood(rset2.getInt("GOOD"));
               r.setBad(rset2.getInt("BAD"));
            } else {
               r.setGood(0);
               r.setBad(0);
            }
            
            r.setUserName(rset1.getString("USER_NAME"));
            System.out.println(rset1.getString("USER_NAME"));
            r.setHpName(rset1.getString("HP_NAME"));
            System.out.println(rset1.getString("HP_NAME"));
            r.setReDate(rset1.getDate("RE_DATE"));
            System.out.println(rset1.getDate("RE_DATE"));
            r.setReview(rset1.getString("REVIEW"));
            System.out.println(rset1.getString("REVIEW"));
            r.setHpAvgpoint(rset1.getDouble("HP_AVGPOINT"));
            System.out.println("HP_AVGPOINT : " + rset1.getDouble("HP_AVGPOINT"));
            r.setgPoint(rset1.getInt("G_POINT"));
            System.out.println(rset1.getInt("G_POINT"));
            r.setnPoint(rset1.getInt("N_POINT"));
            System.out.println(rset1.getInt("N_POINT"));
            
            rList.add(r);
            System.out.println("rList : " + rList);
         }
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset2);
         close(pstmt2);
         close(rset1);
         close(pstmt1);
      }
      
      return rList;
   }

   
   /**
    * 좋아요 싫어요 정보 변경하기
    * @param con
    * @param reNum
    * @param userId
    * @param result 
    * @param result
    * @return
    */
   public int changeLikeInfo(Connection con, String userId, int reNum, String addLike) {

      PreparedStatement pstmt = null;
      int fin1 = 0;
      
      String sql = "";
      
      try {
         System.out.println("DAO resultLike : " + addLike);
         switch(addLike) {
         case "1,0" :
         case "0,1" : sql = prop.getProperty("insertLikeInfo");
                   pstmt = con.prepareStatement(sql);
         
                   pstmt.setString(1, userId);
                   pstmt.setInt(2, reNum);
                   pstmt.setInt(3, Integer.parseInt(addLike.split(",")[0]));
                   pstmt.setInt(4, Integer.parseInt(addLike.split(",")[1]));
                   break;
         
         case "1,-1" : sql = prop.getProperty("updateLikeInfo");
                    pstmt = con.prepareStatement(sql);
                     
                    pstmt.setInt(1, 1);
                    pstmt.setInt(2, 0);
                    pstmt.setString(3, userId);
                    pstmt.setInt(4, reNum);
                    break;
                    
         case "-1,1" : sql = prop.getProperty("updateLikeInfo");
                    pstmt = con.prepareStatement(sql);
                  
                    pstmt.setInt(1, 0);
                    pstmt.setInt(2, 1);
                    pstmt.setString(3, userId);
                    pstmt.setInt(4, reNum);
                    break;
         
         case "-1,0" :
         case "0,-1" : sql = prop.getProperty("deleteLikeInfo");
                    pstmt = con.prepareStatement(sql);
         
                    pstmt.setString(1, userId);
                    pstmt.setInt(2, reNum);
                    break;
         }
         
         fin1 = pstmt.executeUpdate();
         
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return fin1;
   }
   
   
   /**
    * 좋아요 싫어요 수 변경하기
    * @param con
    * @param reNum
    * @param result
    * @return
    */
   public int changeGood(Connection con, int reNum, String result) {

      PreparedStatement pstmt = null;
      int fin2 = 0;
      
      String sql = prop.getProperty("changeGood");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setInt(1, Integer.parseInt(result.split(",")[0]));
         pstmt.setInt(2, Integer.parseInt(result.split(",")[1]));
         pstmt.setInt(3, reNum);
         
         fin2 = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return fin2;
   }
   
   
   /**
    * 리뷰 쓰기
    * @param con
    * @param r
    * @return
    */
	public int insertReview(Connection con, Review r) {
		   
		int result = 0;
		PreparedStatement pstmt = null;
	   
		String sql = prop.getProperty("insertReview");
	   
		try {
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r.getResNum());
			pstmt.setString(2,r.getUserId());
			pstmt.setString(3, r.getReTitle());
			pstmt.setDate(4, r.getReDate());
			pstmt.setString(5, r.getHpCode());
			pstmt.setString(6, r.getHpName());
			pstmt.setDouble(7, r.getHpAvgpoint());
			System.out.println("r.getHpAvgpoint() : " + r.getHpAvgpoint());
			pstmt.setInt(8, r.getHpPoint1());
			pstmt.setInt(9, r.getHpPoint2());
			pstmt.setInt(10, r.getHpPoint3());
			pstmt.setInt(11, r.getHpPoint4());
	      	pstmt.setInt(12, r.getHpPoint5());
	      	pstmt.setString(13,r.getReview() );
	      
	      	result = pstmt.executeUpdate();
	      
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	   
		return result;
	}


}
