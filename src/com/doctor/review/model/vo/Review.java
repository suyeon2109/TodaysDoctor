package com.doctor.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1374380026833227204L;
	
	private int resNum;			// 예약 번호
	private int reNum;			// 리뷰 번호
	private String userId;		// 아이디
	private String reTitle;		// 리뷰 제목
	private Date reDate;		// 병원 방문 날짜
	private String hpCode;		// 병원 코드
	private String hpName;		// 병원 이름
	private double hpAvgpoint;	// 평점
	private int hpPoint1;		// 1번문항 점수
	private int hpPoint2;		// 2번문항 점수
	private int hpPoint3;		// 3번문항 점수
	private int hpPoint4;		// 4번문항 점수
	private int hpPoint5;		// 5번문항 점수
	private String review;		// 후기
	private int gPoint;			// 좋아요 수
	private int nPoint;			// 싫어요 수
	
	private int good;			// 좋아요 여부
	private int bad;			// 싫어요 여부
	
	private String userName;	// 작성자 이름
	private int totalAvg;		// 병원당 전체 평점
	
	public Review() {}

	public Review(int reNum, String userId, String reTitle, Date reDate, String hpCode, String hpName, int hpAvgpoint,
			int hpPoint1, int hpPoint2, int hpPoint3, int hpPoint4, int hpPoint5, String review, int gPoint,
			int nPoint) {
		super();
		this.reNum = reNum;
		this.userId = userId;
		this.reTitle = reTitle;
		this.reDate = reDate;
		this.hpCode = hpCode;
		this.hpName = hpName;
		this.hpAvgpoint = hpAvgpoint;
		this.hpPoint1 = hpPoint1;
		this.hpPoint2 = hpPoint2;
		this.hpPoint3 = hpPoint3;
		this.hpPoint4 = hpPoint4;
		this.hpPoint5 = hpPoint5;
		this.review = review;
		this.gPoint = gPoint;
		this.nPoint = nPoint;
	}

	// 이름, 병원명, 병원 작성 날짜, 후기, 평점
	// 후기 리스트를 위한 생성자
	public Review(String userName, String hpName, Date reDate, String review, int hpAvgpoint, int gPoint, int nPoint, int good, int bad) {
		super();
		this.userName = userName;
		this.hpName = hpName;
		this.reDate = reDate;
		this.review = review;
		this.hpAvgpoint = hpAvgpoint;
		this.gPoint = gPoint;
		this.nPoint = nPoint;
		this.good = good;
		this.bad = bad;
	}
	
	
	public int getReNum() {
		return reNum;
	}

	public int getResNum() {
		return resNum;
	}
	
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getTotalAvg() {
		return totalAvg;
	}

	public void setTotalAvg(int totalAvg) {
		this.totalAvg = totalAvg;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReTitle() {
		return reTitle;
	}

	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}

	public String getHpCode() {
		return hpCode;
	}

	public void setHpCode(String hpCode) {
		this.hpCode = hpCode;
	}

	public String getHpName() {
		return hpName;
	}

	public void setHpName(String hpName) {
		this.hpName = hpName;
	}

	public double getHpAvgpoint() {
		return hpAvgpoint;
	}

	public void setHpAvgpoint(double d) {
		this.hpAvgpoint = d;
	}

	public int getHpPoint1() {
		return hpPoint1;
	}

	public void setHpPoint1(int hpPoint1) {
		this.hpPoint1 = hpPoint1;
	}

	public int getHpPoint2() {
		return hpPoint2;
	}

	public void setHpPoint2(int hpPoint2) {
		this.hpPoint2 = hpPoint2;
	}

	public int getHpPoint3() {
		return hpPoint3;
	}

	public void setHpPoint3(int hpPoint3) {
		this.hpPoint3 = hpPoint3;
	}

	public int getHpPoint4() {
		return hpPoint4;
	}

	public void setHpPoint4(int hpPoint4) {
		this.hpPoint4 = hpPoint4;
	}

	public int getHpPoint5() {
		return hpPoint5;
	}

	public void setHpPoint5(int hpPoint5) {
		this.hpPoint5 = hpPoint5;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getgPoint() {
		return gPoint;
	}

	public void setgPoint(int gPoint) {
		this.gPoint = gPoint;
	}

	public int getnPoint() {
		return nPoint;
	}

	public void setnPoint(int nPoint) {
		this.nPoint = nPoint;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	@Override
	public String toString() {
		return "Review [reNum=" + reNum + ", userId=" + userId + ", reTitle=" + reTitle + ", reDate=" + reDate
				+ ", hpCode=" + hpCode + ", hpName=" + hpName + ", hpAvgpoint=" + hpAvgpoint + ", hpPoint1=" + hpPoint1
				+ ", hpPoint2=" + hpPoint2 + ", hpPoint3=" + hpPoint3 + ", hpPoint4=" + hpPoint4 + ", hpPoint5="
				+ hpPoint5 + ", review=" + review + ", gPoint=" + gPoint + ", nPoint=" + nPoint + "]";
	}
	
}
