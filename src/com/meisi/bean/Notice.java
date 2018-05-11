package com.meisi.bean;

import java.util.Date;

/*
 * 公告实体类
 */
public class Notice {
	private int noticeId;			//公告ID
	private String title; 			//公告简述
	private String noticeDetail;	//公告详情
	private Date publishTime;		//公告发布时间
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNoticeDetail() {
		return noticeDetail;
	}
	public void setNoticeDetail(String noticeDetail) {
		this.noticeDetail = noticeDetail;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	

}
