package com.doctor.hospital.model.vo;

import java.io.Serializable;

public class Hospital implements Serializable{
    private static final long serialVersionUID = 1L;
    
    private int hnum; //병원정보순서
    private String hpCode; //병원코드
    private String hpName; //병원이름
    private String hpIndex; //병원 진료과목 
    private String hpArea; //병원지역(구)
    private String hpAddress; // 병원 주소(동부터)
    private int hpOpen; //병원 오픈 시간
    private int hpClose; //병원 끝나는 시간
    private int hpLunchSt; //병원 점심시간(시작)
    private int hpLunchFi; //병원 점심시간(끝)
    private String hpPhone; //병원번호
    private String hpEmail; //병원이메일
    private double avgPoint; //병원후기 평균
    private String hpDoctor1; //원장1
    private String hpDoctor2; //원장2
    private String hpDoctor3; //원장3
    
    public Hospital() {}
    
    

    public Hospital(int hnum,String hpName, String hpIndex, String hpArea, String hpAddress, int hpOpen, int hpClose,
         int hpLunchSt, int hpLunchFi, String hpPhone, String hpEmail, double avgPoint) {
      this.hnum = hnum;
      this.hpName = hpName;
      this.hpIndex = hpIndex;
      this.hpArea = hpArea;
      this.hpAddress = hpAddress;
      this.hpOpen = hpOpen;
      this.hpClose = hpClose;
      this.hpLunchSt = hpLunchSt;
      this.hpLunchFi = hpLunchFi;
      this.hpPhone = hpPhone;
      this.hpEmail = hpEmail;
      this.avgPoint = avgPoint;
   }


   public int getHnum() {
      return hnum;
   }



   public void setHnum(int hnum) {
      this.hnum = hnum;
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

   public String getHpIndex() {
      return hpIndex;
   }

   public void setHpIndex(String hpIndex) {
      this.hpIndex = hpIndex;
   }

   public String getHpArea() {
      return hpArea;
   }

   public void setHpArea(String hpArea) {
      this.hpArea = hpArea;
   }

   public String getHpAddress() {
      return hpAddress;
   }

   public void setHpAddress(String hpAddress) {
      this.hpAddress = hpAddress;
   }

   public int getHpOpen() {
      return hpOpen;
   }

   public void setHpOpen(int hpOpen) {
      this.hpOpen = hpOpen;
   }

   public int getHpClose() {
      return hpClose;
   }

   public void setHpClose(int hpClose) {
      this.hpClose = hpClose;
   }

   public int getHpLunchSt() {
      return hpLunchSt;
   }

   public void setHpLunchSt(int hpLunchSt) {
      this.hpLunchSt = hpLunchSt;
   }

   public int getHpLunchFi() {
      return hpLunchFi;
   }

   public void setHpLunchFi(int hpLunchFi) {
      this.hpLunchFi = hpLunchFi;
   }

   public String getHpPhone() {
      return hpPhone;
   }

   public void setHpPhone(String hpPhone) {
      this.hpPhone = hpPhone;
   }

   public String getHpEmail() {
      return hpEmail;
   }

   public void setHpEmail(String hpEmail) {
      this.hpEmail = hpEmail;
   }

   public double getAvgPoint() {
      return avgPoint;
   }

   public void setAvgPoint(double avgPoint) {
      this.avgPoint = avgPoint;
   }

   public String getHpDoctor1() {
      return hpDoctor1;
   }

   public void setHpDoctor1(String hpDoctor1) {
      this.hpDoctor1 = hpDoctor1;
   }

   public String getHpDoctor2() {
      return hpDoctor2;
   }

   public void setHpDoctor2(String hpDoctor2) {
      this.hpDoctor2 = hpDoctor2;
   }

   public String getHpDoctor3() {
      return hpDoctor3;
   }

   public void setHpDoctor3(String hpDoctor3) {
      this.hpDoctor3 = hpDoctor3;
   }   

   @Override
   public String toString() {
      return "Hospital [hnum=" + hnum + ", hpCode=" + hpCode + ", hpName=" + hpName + ", hpIndex=" + hpIndex
            + ", hpArea=" + hpArea + ", hpAddress=" + hpAddress + ", hpOpen=" + hpOpen + ", hpClose=" + hpClose
            + ", hpLunchSt=" + hpLunchSt + ", hpLunchFi=" + hpLunchFi + ", hpPhone=" + hpPhone + ", hpEmail="
            + hpEmail + ", avgPoint=" + avgPoint + ", hpDoctor1=" + hpDoctor1 + ", hpDoctor2=" + hpDoctor2
            + ", hpDoctor3=" + hpDoctor3 + "]";
   }
   
        
}