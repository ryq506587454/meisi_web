package com.meisi.bean;

import java.util.Set;
/*
 * 教练表
 */
public class Coach {
		private int coachId;						//教练ID
		private String coachName;					//教练名称
		private String coachInfo;					//教练介绍
		private String courseType;					//授课类型
		private Set<Course> course ; 				//教授课程
		public int getCoachId() {
			return coachId;
		}
		public void setCoachId(int coachId) {
			this.coachId = coachId;
		}
		public String getCoachName() {
			return coachName;
		}
		public void setCoachName(String coachName) {
			this.coachName = coachName;
		}
		public Set<Course> getCourse() {
			return course;
		}
		public void setCourse(Set<Course> course) {
			this.course = course;
		}
		public String getCoachInfo() {
			return coachInfo;
		}
		public void setCoachInfo(String coachInfo) {
			this.coachInfo = coachInfo;
		}
		public String getCourseType() {
			return courseType;
		}
		public void setCourseType(String courseType) {
			this.courseType = courseType;
		}
		
		
}
