package com.doctor.user.model.vo;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	/**/
	private String userId;        // 회원 아이디
	private String userPwd;       // 회원 비밀번호
	private String userName;      // 회원 이름
	private String userPno;       // 회원 주민번호
	private String userEmail;     // 회원 이메일
	private String userPhone;     // 회원 휴대폰번호
	private String userArea;      // 회원 거주지역
	private String userFavorite;  // 회원 즐겨찾는병원
	private String userLastre;    // 회원 지난예약내역
	private String userNowre;     // 회원 실시간예약내역
	
	public User() {
		
	}
	
	//로그인용 생성자
	public User(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	//아이디 찾기용 생성자
	public User(String userEmail) {
		super();
		this.userEmail = userEmail;
	}
	
	//비밀번호 찾기 생성자
	public User(String userId, String userName, String userPno) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPno = userPno;
	}


	//회원가입용 생성자
	public User(String userId, String userPwd, String userName, String userPno, String userEmail, String userPhone,
			String userArea) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPno = userPno;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userArea = userArea;
	}



	//회원 전체 데이터를 가져오기위한 생성자
	public User(String userId, String userPwd, String userName, String userPno, String userEmail, String userPhone,
			String userArea, String userFavorite, String userLastre, String userNowre) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPno = userPno;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userArea = userArea;
		this.userFavorite = userFavorite;
		this.userLastre = userLastre;
		this.userNowre = userNowre;
	}

	// toString 재정의
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userPno=" + userPno
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userArea=" + userArea + ", userFavorite="
				+ userFavorite + ", userLastre=" + userLastre + ", userNowre=" + userNowre + "]";
	}


	
	// getter & setter
	public String getUserId() {
		return userId;
	}

	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPno() {
		return userPno;
	}

	public void setUserPno(String userPno) {
		this.userPno = userPno;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserArea() {
		return userArea;
	}

	public void setUserArea(String userArea) {
		this.userArea = userArea;
	}

	public String getUserFavorite() {
		return userFavorite;
	}

	public void setUserFavorite(String userFavorite) {
		this.userFavorite = userFavorite;
	}

	public String getUserLastre() {
		return userLastre;
	}

	public void setUserLastre(String userLastre) {
		this.userLastre = userLastre;
	}

	public String getUserNowre() {
		return userNowre;
	}

	public void setUserNowre(String userNowre) {
		this.userNowre = userNowre;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
}
