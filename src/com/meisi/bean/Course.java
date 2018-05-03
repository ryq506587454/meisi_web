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
 * 固定：减脂、增肌、塑形、瑜伽
 */
public class Course {
	private long courseId;									//课程号
	private String courseName; 								//课程名称
	private String courseIntro; 							//简介
	private String courseType;								//课程类型
	private long courseDuration;							//课程时长
	private int totalNumber;								//总人数
	private Set<Date> startDate = new HashSet<Date>();		//开课时间
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
	
	public long getCourseDuration() {
		return courseDuration;
	}
	public void setCourseDuration(long courseDuration) {
		this.courseDuration = courseDuration;
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
	
	public Set<Date> getStartDate() {
		return startDate;
	}
	public void setStartDate(Set<Date> startDate) {
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
