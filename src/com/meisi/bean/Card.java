package com.meisi.bean;

import java.util.Date;

/*
 * 会员卡实体类
 */


public class Card {
	private long cardId;		//会员卡ID
	private Date startTime;		//办卡日期
	private Date endTime;		//到期日期
	private String type;		//会员卡类型
	private int restTimes;		//剩余次数(除次卡为固定的次数，其他类型卡均为-2)	
	private User user;			//对应的用户
	public long getCardId() {
		return cardId;
	}
	public void setCardId(long cardId) {
		this.cardId = cardId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRestTimes() {
		return restTimes;
	}
	public void setRestTimes(int restTimes) {
		this.restTimes = restTimes;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Card [cardId=" + cardId + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", type=" + type + ", restTimes="
				+ restTimes + ", user=" + user + "]";
	}
		
	
	
	
	
}
