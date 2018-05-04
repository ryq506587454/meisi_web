package com.meisi.bean;
/*
 * 预约记录表
 */

import java.util.Date;
import com.meisi.bean.User;

public class Appointment {
	private int apptId;				//约课记录ID
	private Date courseTime;		//开课时间
	private String courseName;		//课程名称
	private long courseDuration;	//课程时长
	private User user;				//本课用户
	
	public int getApptId() {
		return apptId;
	}
	public void setApptId(int apptId) {
		this.apptId = apptId;
	}
	public Date getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(Date courseTime) {
		this.courseTime = courseTime;
	}
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public long getCourseDuration() {
		return courseDuration;
	}
	public void setCourseDuration(long courseDuration) {
		this.courseDuration = courseDuration;
	}
	
	
}
