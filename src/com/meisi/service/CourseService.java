package com.meisi.service;
/*
 * 课程业务层
 */
import java.util.List;

import com.meisi.bean.Course;
import com.meisi.dao.CourseDao;


public class CourseService {
	//课程业务层注入
	private CourseDao CourseDao;
	public void setCourseDao(CourseDao courseDao) {
		CourseDao = courseDao;
	}
	//根据课程类型查课
	public List<Course> findCourseByType(Course course){
		System.out.println("CS.findCourseType被调用。。");
		return CourseDao.findCourseByType(course);
	}
	//
	public List<Course> findCourseById(Course course){
		System.out.println("CS.findCourseType被调用。。");
		return CourseDao.findCourseById(course);
	}
	
}	
