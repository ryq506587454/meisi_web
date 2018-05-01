package com.meisi.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.meisi.bean.Course;


public class CourseDao extends HibernateDaoSupport{
	//根据课程类型查课
	public List<Course> findCourseByType(Course course){
		System.out.println("CD.findCourseType被调用。。");
		System.out.println(course.getCourseId()+" "+course.getCourseType());
		List<Course> courList = new ArrayList<Course>(); 
		String hql = "from Course where courseType = ?";  	
		courList = this.getHibernateTemplate().find(hql,course.getCourseType()); 
		return courList;
		
	}
	//根据课程ID查课-移动端
		public List<Course> findCourseById(Course course){
			System.out.println("CD.meidaFindByID被调用了。。");	
			System.out.println(course.getCourseId()+" "+course.getCourseType());
			List<Course> courList = new ArrayList<Course>(); 
			String hql = "from Course where courseId = ?";  	
			courList = this.getHibernateTemplate().find(hql,course.getCourseId()); 
			return courList;		
		}
		
}
