package com.meisi.util;

import java.util.Date;
import java.util.List;

import com.meisi.bean.Course;
import com.meisi.bean.User;

public class ApptLog {
	private List<User> user;
	private Course course;		
	private Date course_date;
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Date getCourse_date() {
		return course_date;
	}
	public void setCourse_date(Date course_date) {
		this.course_date = course_date;
	}
	public List<User> getUser() {
		return user;
	}
	public void setUser(List<User> user) {
		this.user = user;
	}

	
}
