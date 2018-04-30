package com.meisi.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/*
 * 课程实体类
 */
/*
 * PS:
 * 用户： 
 * 根据不同用户类型
 * 课程类型：
 * 固定：01减脂、02增肌、03塑形、04瑜伽
 * 课程ID组成:课程日期+类型+第几节课
 * 01:9:00-10:00 02:10:30-11:30 03:13:30-14:30 04:15:00-16:00
 * eg:1804200103:2018年4月20日第3节减脂课
 */
public class Course {
	private long courseId;									//课程号
	private String courseName; 								//课程名称
	private Date startDate;									//开课时间
	private String courseIntro; 							//简介
	private String courseType;								//课程类型
	private int totalNumber;								//总人数
	private Set<User> user = new HashSet<User>();			//用户		
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public String getCourseType() {
		return courseType;
	}
	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}
	public Set<User> getUser() {
		return user;
	}
	public void setUser(Set<User> user) {
		this.user = user;
	}
	public long getCourseId() {
		return courseId;
	}
	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getCourseIntro() {
		return courseIntro;
	}
	public void setCourseIntro(String courseIntro) {
		this.courseIntro = courseIntro;
	}
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName
				+ ", startDate=" + startDate + ", courseIntro=" + courseIntro
				+ ", user=" + user + "]";
	}
	public void pushSet(){
		for (User i : this.getUser()) {
			System.out.println(i.getName());
		}
	}
	
}
