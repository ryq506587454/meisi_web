package com.meisi.dao;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.meisi.bean.Appointment;
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
		String flag = null;
		//转化时间类型
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ParsePosition pos = new ParsePosition(0);//指向String转换为Date()时的索引位置
		Date rcreate = format.parse(date,pos);
		//查询User
		String hql = "from User where userId = ?";
		User vip = (User)this.getHibernateTemplate().get(User.class,Long.parseLong(userId));
		//查询course
		hql = "from Course where courseId = ";
		Course apptCourse = (Course)this.getHibernateTemplate().get(Course.class,c.getCourseId()); 	 
		vip.getCourse().add(apptCourse);
		//进行预约条件
		if(vip.getCard().getRestTimes()>0){
			for (Appointment d : vip.getAppt()) {
				if(d.getCourseTime().compareTo(rcreate) == 0){
					return "TIMEERRO";
				}
			}
			//新建预约记录
			Appointment newApptLog = new Appointment();
			newApptLog.setUser(vip);
			newApptLog.setCouserName(apptCourse.getCourseName());				
			newApptLog.setCourseTime(rcreate);
			newApptLog.setCourseDuration(apptCourse.getCourseDuration());
			//将预约记录添加进vip
			vip.getAppt().add(newApptLog);
			//执行更新
			this.getHibernateTemplate().update(vip);
			this.getSession().beginTransaction().commit();
			return "OK";
		}else{
			return "TIMESERRO";
		}			
	}

}	
