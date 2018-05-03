package com.meisi.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
/*
 * 用户实体类
 */

/* PS:
 * 用户等级划分：
 * 0:会员
 * 1:教练
 * 2:员工(可以进行会员删除增加充值消费等操作)
 * 3:总管理员(可以使用所有功能)
 * 用户账号：
 * 会员:默认手机号未登录账号
 * 教练:教练号
 * 员工:员工号
 */


public class User {
	private long userId;								//用户账号
	private String password;							//用户登陆密码，默认888888
	private String name;								//用户姓名
	private int grade;									//用户等级，
	private long tel;									//用户手机号，会员默认为登录帐号	
	private long identity;								//身份证号
	private Card card;									//会员卡
	private Set<Course> course ; 						//已约课程
	private Set<Date> courseTime;						//预约课程
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public long getTel() {
		return tel;
	}
	public void setTel(long tel) {
		this.tel = tel;
	}
	public long getIdentity() {
		return identity;
	}
	public void setIdentity(long identity) {
		this.identity = identity;
	}
	public Card getCard() {
		return card;
	}
	public void setCard(Card card) {
		this.card = card;
	}
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}			
	
	public Set<Date> getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(Set<Date> courseTime) {
		this.courseTime = courseTime;
	}
	public void pushSet(){
		for (Course i : this.getCourse()) {
			System.out.println(i.getCourseIntro());
		}
	}
	
	

}
