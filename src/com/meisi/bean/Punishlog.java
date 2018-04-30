package com.meisi.bean;

import java.util.Date;

/*
 * 1,2,3级管理员的惩罚记录
 * 
 */
public class Punishlog {
	private int punishlogId;		//主键ID
	private float punMoney;			//罚款金额
	private Date  logDate ;			//违规日期
	private String content;			//惩罚内容
	
	public int getPunishlogId() {
		return punishlogId;
	}
	public void setPunishlogId(int punishlogId) {
		this.punishlogId = punishlogId;
	}
	public float getPunMoney() {
		return punMoney;
	}
	public void setPunMoney(float punMoney) {
		this.punMoney = punMoney;
	}
	public Date getLogDate() {
		return logDate;
	}
	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Punishlog [punishlogId=" + punishlogId + ", punMoney="
				+ punMoney + ", logDate=" + logDate + ", content=" + content
				+ "]";
	}
	
	
	
	
}
