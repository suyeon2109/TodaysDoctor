package com.doctor.reserve.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable {
   
   private static final long serialVersionUID = 1L;
   
   private int resNum;
   private String hpCode;
   private String hpName;
   private String hpIndex;
   private String hpArea;
   private String hpAddress;
   private String hpPhone;
   private String userId;
   private String userName;
   private int resTime;
   private int resMin;
   private Date resDate;
   private String hpDoctor;
   private String resContent;
      
   public Reservation() {}

   public Reservation(int resNum, String hpCode, String hpName, String hpIndex, String hpArea, String hpAddress,
         String hpPhone, String userId, String userName, int resTime, int resMin, Date resDate, String hpDoctor,
         String resContent) {
      super();
      this.resNum = resNum;
      this.hpCode = hpCode;
      this.hpName = hpName;
      this.hpIndex = hpIndex;
      this.hpArea = hpArea;
      this.hpAddress = hpAddress;
      this.hpPhone = hpPhone;
      this.userId = userId;
      this.userName = userName;
      this.resTime = resTime;
      this.resMin = resMin;
      this.resDate = resDate;
      this.hpDoctor = hpDoctor;
      this.resContent = resContent;
   }

   public int getResNum() {
      return resNum;
   }
   
   public void setResNum(int resNum) {
      this.resNum = resNum;
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
   
   public String getHpPhone() {
      return hpPhone;
   }
   
   public void setHpPhone(String hpPhone) {
      this.hpPhone = hpPhone;
   }
   
   public String getUserId() {
      return userId;
   }
   
   public void setUserId(String userId) {
      this.userId = userId;
   }
   
   public String getUserName() {
      return userName;
   }
   
   public void setUserName(String userName) {
      this.userName = userName;
   }
   
   public int getResTime() {
      return resTime;
   }
   
   public void setResTime(int resTime) {
      this.resTime = resTime;
   }
   
   public int getResMin() {
      return resMin;
   }
   
   public void setResMin(int resMin) {
      this.resMin = resMin;
   }
   
   public Date getResDate() {
      return resDate;
   }
   
   public void setResDate(Date resDate) {
      this.resDate = resDate;
   }
   
   public String getHpDoctor() {
      return hpDoctor;
   }
   
   public void setHpDoctor(String hpDoctor) {
      this.hpDoctor = hpDoctor;
   }
   
   public String getResContent() {
      return resContent;
   }
   
   public void setResContent(String resContent) {
      this.resContent = resContent;
   }

   @Override
   public String toString() {
      return "Reservation [resNum=" + resNum + ", hpCode=" + hpCode + ", hpName=" + hpName + ", hpIndex=" + hpIndex
            + ", hpArea=" + hpArea + ", hpAddress=" + hpAddress + ", hpPhone=" + hpPhone + ", userId=" + userId
            + ", userName=" + userName + ", resTime=" + resTime + ", resMin=" + resMin + ", resDate=" + resDate
            + ", hpDoctor=" + hpDoctor + ", resContent=" + resContent + "]";
   }
}