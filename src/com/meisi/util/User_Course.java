package com.meisi.util;

import java.util.Date;
import com.meisi.bean.Course;
import com.meisi.bean.User;

public class User_Course {
	private User user;
	private Course course;
	private Date course_date;
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getCourse_date() {
		return course_date;
	}
	public void setCourse_date(Date course_date) {
		this.course_date = course_date;
	}
	
	
}
