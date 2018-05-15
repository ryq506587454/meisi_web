package com.meisi.service;
/*
 * 课程业务层
 */
import java.util.List;

import com.meisi.bean.Course;
import com.meisi.bean.Notice;
import com.meisi.dao.CourseDao;
import com.meisi.util.ApptLog;


public class CourseService {
	//课程业务层注入
	private CourseDao CourseDao;
	public void setCourseDao(CourseDao courseDao) {
		CourseDao = courseDao;
	}
	//根据课程类型查课
	public List<Course> findCourseByType(Course course){
		return CourseDao.findCourseByType(course);
	}
	//根据课程ID查课
	public Course findCourseById(Course course){
		return CourseDao.findCourseById(course);
	}
	//移动端预约选课
	public String apptmenCourse(String userId,Course c,String data){
		return CourseDao.apptmenCourse(userId,c,data);		
	}
	//热门推荐
	public List<Course> addviceCourse(){
		return CourseDao.addviceCourse();
	}	
	//查询所有课程
	public List<Course> findAllCourse(int page ,int pageSize){
		return CourseDao.findAllCourse(page ,pageSize);		
	}
	//计算教练表页数
	public int CourseNumber(int pageSize){
		return CourseDao.CourseNumber(pageSize);
	}
	//根据教练查询
	public List<Course> findCourseByCoach(String name,Course Course){	
		return CourseDao.findCourseByCoach(name);				
	}
	//根据时间查询
	public List<Course> findCourseByDate(String courseDate,Course c){
		return CourseDao.findCourseByDate(courseDate,c);
	}
	//根据时间和教练筛选课程
	public List<Course> findCourseByDateAndCoach(String name,String courseDate,Course c){
		return CourseDao.findCourseByDateAndCoach(name, courseDate, c);
	}
	//按照条件查询
	public List<Course> findCourseByFlag(String flag,String data,int page ,int pageSize){
		if(flag.equals("All")){
			return this.findAllCourse(page,pageSize);
		}else if(data.length()<1){	
			return null;
		}else{
			System.out.println("111");
			return CourseDao.findCourseByFlag(flag, data);
		}		
	}
	//预约情况
	public List<ApptLog> findAppt(String date){
		return CourseDao.findAppt(date);		
	}
	//添加课程
	public String addCourse(Course c,String coachId){
		return CourseDao.addCourse(c, coachId);
	}
	//课程查重
	public String checkCourseTwo(Course c){
		return CourseDao.checkCourseTwo(c);
	}
	//删除课程
	public String deleteCourse(Course c){
		return CourseDao.deleteCourse(c);
	}
	//安排课程
	public String planCourse(Course c,String date){
		return CourseDao.planCourse(c, date);
	}
	//更新课程
	public String updateCourse(Course c){
		c.setCourseDuration(c.getCourseDuration()*60);
		return CourseDao.updateCourse(c);
	}
	//统计某节课程已报人数
	public String findClassNumber(Course c,String date){
		return  CourseDao.findClassNumber(c, date);
	}
	
/*
 * 通知部分	
 */
	//发布通知
	public String addNotice(Notice notice){
		return CourseDao.addNotice(notice);
	}
	//查询所有通知
	public List<Notice> findAllNotice(final int page ,final int pageSize){
		return CourseDao.findAllNotice(page,pageSize);
	}
	//计算页面数
	public int NoticeNumber(int pageSize){
		return CourseDao.NoticeNumber(pageSize);
	}
	//根据ID查询通知
	public Notice findByID(Notice notice){
		return CourseDao.findByID(notice);
	}
	//更新公告
	public String updateNotice(Notice notice){
		return CourseDao.updateNotice(notice);
	}
}
