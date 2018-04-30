package com.meisi.bean;

import java.util.Date;

/*
 * 消费记录
 */
/*
 * PS
 * 消费金额为正：充值
 * 消费金额为负：消费
 */
public class Consumelog {
	private int consumeId;		//消费记录ID
	private float consume;		//消费金额
	private Date consumeDate;	//消费时间
	public int getConsumeId() {
		return consumeId;
	}
	public void setConsumeId(int consumeId) {
		this.consumeId = consumeId;
	}	
	public float getConsume() {
		return consume;
	}
	public void setConsume(float consume) {
		this.consume = consume;
	}
	public Date getConsumeDate() {
		return consumeDate;
	}
	public void setConsumeDate(Date consumeDate) {
		this.consumeDate = consumeDate;
	}
	@Override
	public String toString() {
		return "Consumelog [consumeId=" + consumeId + ", consume=" + consume
				+ ", consumeDate=" + consumeDate + "]";
	}
	
	
	
}
