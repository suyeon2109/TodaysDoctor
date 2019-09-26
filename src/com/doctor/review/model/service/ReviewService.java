package com.doctor.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.doctor.review.model.dao.ReviewDao;
import com.doctor.review.model.vo.Review;

import static com.doctor.common.JDBCTemplate.*;

public class ReviewService {

   private ReviewDao rDao = new ReviewDao();
   // -----경연 -----
   public ArrayList<Review> selectMyReview(String userId){
      Connection con = getConnection();
      
      ArrayList<Review> list = new ArrayList<Review>();
      
      list = rDao.selectMyReview(con, userId);
      
      commit(con);
      close(con);
      
      return list;
   }
   
   public Review selectMyReviewOne(int reNum) {
	   Connection con = getConnection();
	   
	   Review review = new Review();
	   
	   review = rDao.selectMyReviewOne(con, reNum);
	   
	   if(review != null) {
		   commit(con);
	   }else {
		   rollback(con);
	   }
	   return review;
   }
   
   public int deleteMyReview(int reNum) {
      Connection con = getConnection();
      
      int result = rDao.deleteMyReview(con, reNum);
      
      if(result > 0) {
         commit(con);
      }else {
         rollback(con);
      }
      return result;
   }
   
   
   //---- 수연 ------
   /**
    * 총 후기 갯수 확인
    * @return
    */
   public int getListCount() {
      Connection con = getConnection();

      int listCount = rDao.getListCount(con);
      
      close(con);
      
      return listCount;
   }
   
   /**
    * 검색한 후기 총 갯수 조회
    * @param hpArea 
    * @param hpIndex 
    * @param keyword 
    * @return
    */
   public int getSearchListCount(String keyword, String hpIndex, String hpArea) {
      Connection con = getConnection();

      int listCount = rDao.getSearchListCount(con, keyword,hpIndex,hpArea);
      
      close(con);
      
      return listCount;
   }
   
   /**
    * 전체 후기 조회
    * @param userId 
    * @param currentPage
    * @param limit
    * @return
    */
   public ArrayList<Review> selectList(String userId, int currentPage, int rlimit) {
      
      Connection con = getConnection();
      
      ArrayList<Review> rList = rDao.selectList(con, userId, currentPage, rlimit);
      
      close(con);
      
      return rList;
   }


   /**
    * 검색한 후기 조회
    * @param userId
    * @param keyword
    * @param hpIndex
    * @param hpArea
    * @param currentPage
    * @param rlimit
    * @return
    */
   public ArrayList<Review> searchReview(String userId, String keyword, String hpIndex, String hpArea, int currentPage, int rlimit) {
      Connection con = getConnection();
      
      ArrayList<Review> rList = rDao.searchReview(con, userId, keyword, hpIndex, hpArea, currentPage, rlimit);
      
      close(con);
      
      return rList;
   }


   /**
    * 후기 정렬하기
    * @param userId
    * @param category
    * @param keyword
    * @param hpIndex
    * @param hpArea
    * @param currentPage
    * @param rlimit
    * @return
    */
   public ArrayList<Review> sortingReview(String userId, String category, String keyword, String hpIndex, String hpArea,
         int currentPage, int rlimit) {

      Connection con = getConnection();
      
      ArrayList<Review> rList = rDao.sortingReview(con, userId, category, keyword, hpIndex, hpArea, currentPage, rlimit);
      
      close(con);
      
      return rList;
   }

   
   /**
    * 좋아요 싫어요 정보 변경하기
    * @param reNum
    * @param userId
    * @param result 
    * @param result
    * @return
    */
   public int changeLikeInfo(String userId, int reNum, String addLike) {
      
      Connection con = getConnection();
      
      int fin1 = rDao.changeLikeInfo(con, userId, reNum, addLike);
      
      if(fin1 > 0) commit(con);
      else rollback(con);
            
      close(con);
      
      return fin1;
   }
   
   

   /**
    * 좋아요 싫어요 수 변경하기
    * @param reNum
    * @param result
    * @return
    */
   public int changeGood(int reNum, String result) {
      
      Connection con = getConnection();
      
      int fin2 = rDao.changeGood(con, reNum, result);

      if(fin2 > 0) commit(con);
      else rollback(con);
            
      close(con);
      
      return fin2;
   }

   
   /**
    * 후기 작성하기
    * @param r
    * @return
    */
   public int insertReview(Review r) {
         Connection con = getConnection();
         
         int result = rDao.insertReview(con, r);
         
         if(result >0) {
            commit(con);
         }else {
            rollback(con);
         }
         close(con);
         
         return result;
      }


}