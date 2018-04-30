package com.meisi.bean;

import java.util.Date;

/*
 * 财务信息
 */
public class Financelog{
	private int financeId;		//统计编号
	private float inCome;  		//收入
	private float outCome; 		//支出
	private Date  countDate;	//统计日期		
	
	public int getFinanceId() {
		return financeId;
	}
	public void setFinanceId(int financeId) {
		this.financeId = financeId;
	}
	public float getInCome() {
		return inCome;
	}
	public void setInCome(float inCome) {
		this.inCome = inCome;
	}
	public float getOutCome() {
		return outCome;
	}
	public void setOutCome(float outCome) {
		this.outCome = outCome;
	}
	public Date getCountDate() {
		return countDate;
	}
	public void setCountDate(Date countDate) {
		this.countDate = countDate;
	}
	@Override
	public String toString() {
		return "Financelog [financeId=" + financeId + ", inCome=" + inCome
				+ ", outCome=" + outCome + ", countDate=" + countDate + "]";
	}
	
	
}
