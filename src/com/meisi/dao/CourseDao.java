package com.meisi.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.meisi.bean.Course;
import com.meisi.bean.User;
import com.meisi.util.User_Course;


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
	public String apptmenCourse(String userId,Course c,String date){
		System.out.println("CD.apptmenCourse被调用了。。");
		System.out.println(userId+" "+c.getCourseId());
		String hql = "from User where userId = ?";
		User vip = (User)this.getHibernateTemplate().get(User.class,Long.parseLong(userId));
		hql = "from Course where courseId = ";
		Course appt = (Course)this.getHibernateTemplate().get(Course.class,c.getCourseId()); 	 
		vip.getCourse().add(appt);
		this.getHibernateTemplate().update(vip);
		return "OK";	
//		SimpleDateFormat newstr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date rcreate = new Date();
////		try {
////			rcreate = newstr.parse(date);
////			vip.getCourseTime().add(rcreate);
////			for (Course c1 : vip.getCourse()) {
////				System.out.println(c1.getCourseName());
////			}
////			for (Date d:vip.getCourseTime() ) {
////				System.out.println(d);
////			}
////			this.getHibernateTemplate().update(vip);
////			return "OK";	
////		} catch (ParseException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////			return "DataErro";
////		}
			
	}
//	//查看预约课程
//	public List<User_Course> findApptCourse(String userId){
//		System.out.println("CD.apptmenCourse被调用了。。");
//		System.out.println(userId+" ");
//		User vip = (User)this.getHibernateTemplate().get(User.class, userId);
//		List<User_Course> uc = new ArrayList<User_Course>();
//		
//		
//		//hql = "selec ut.startTime,uc.courseId from user_time ut,user_course uc  WHERE ut.userId = uc.userId adn uc.userID="+userId;
//		
//		return null;
//	}
}	
