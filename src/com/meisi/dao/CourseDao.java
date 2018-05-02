package com.meisi.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.meisi.bean.Course;
import com.meisi.bean.User;


public class CourseDao extends HibernateDaoSupport{
	//根据课程类型查课
	public List<Course> findCourseByType(Course course){
		System.out.println("CD.findCourseType被调用。。");
		System.out.println(course.getCourseId()+" "+course.getCourseType());
		String hql = "from Course where courseType = ?";  	
		List<Course> courList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,course.getCourseType()); 
		return courList;
		
	}
	//根据课程ID查课
	public Course findCourseById(Course course){
		System.out.println("CD.findCourseById被调用了。。");	
		System.out.println(course.getCourseId()+" "+course.getCourseType());
		Course c  =(Course)this.getHibernateTemplate().get(Course.class,course.getCourseId()); 		
		return c;		
	}
	//预约课程-移动端
	public String apptmenCourse(String userId,Course c){
		System.out.println("CD.apptmenCourse被调用了。。");
		System.out.println(userId+" "+c.getCourseId());
		String hql = "from User where userId = ?";
		User vip = (User)this.getHibernateTemplate().find(hql,userId); 
		hql = "from Course where courseId = ";
		Course appt = (Course) this.getHibernateTemplate().find(hql,c.getCourseId()); 
		vip.getCourse().add(appt);
		this.getHibernateTemplate().update(vip);
		return "OK";		
	}
}
