package com.meisi.dao;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.meisi.bean.Appointment;
import com.meisi.bean.Coach;
import com.meisi.bean.Course;
import com.meisi.bean.User;
import com.meisi.util.ApptLog;


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
		//转化时间类型
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ParsePosition pos = new ParsePosition(0);//指向String转换为Date()时的索引位置
		Date rcreate = format.parse(date,pos);
		//查询User
		User vip = (User)this.getHibernateTemplate().get(User.class,Long.parseLong(userId));
		//查询course
		Course apptCourse = (Course)this.getHibernateTemplate().get(Course.class,c.getCourseId());
		//给用户添加新的预约课程
		vip.getCourse().add(apptCourse);
		//进行预约条件判断
		if(vip.getCard().getRestTimes()>0){
			for (Appointment d : vip.getAppt()) {
				if(d.getCourseTime().compareTo(rcreate) == 0){
					return "TIMEERRO";
				}
			}
			//新建预约记录
			Appointment newApptLog = new Appointment();
			newApptLog.setUser(vip);
			newApptLog.setCourseName(apptCourse.getCourseName());				
			newApptLog.setCourseTime(rcreate);
			newApptLog.setCourseDuration(apptCourse.getCourseDuration());
			//将预约记录添加进vip
			vip.getAppt().add(newApptLog);
			//扣除次数
			vip.getCard().setRestTimes(vip.getCard().getRestTimes()-1);
			//执行更新
			this.getHibernateTemplate().update(vip);
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
			return "OK";
		}else{
			return "TIMESERRO";
		}			
	}
	//推荐课程-移动端
	public List<Course> addviceCourse(){
		System.out.println("CD.addviceCourse被调用。。");
		List<Course> advice = new ArrayList<Course>();
		String Sql = "SELECT count(*) AS count,courseName FROM appointment GROUP BY courseName ORDER BY count DESC limit 4";  	
		List<Object[]> list = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createSQLQuery(Sql).list();
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();	
		for (Object[] objects : list) {
			int count = Integer.valueOf(objects[0].toString()) ;
			String courseName = (String)objects[1];
			String hql = "from Course where courseName = ?";
			List<Course> c = (ArrayList<Course>)this.getHibernateTemplate().find(hql,courseName);
			advice.add(c.get(0));
			System.out.println("count:"+count);			
			System.out.println("courseName:"+courseName);			
		}	
			return advice;		
	}
	//查询所有课程
	public List<Course> findAllCourse(){
		String hql = "from Course";
		List<Course> allCourse = this.getHibernateTemplate().find(hql);
		return allCourse;
		
	}
	//根据教练名称筛选课程
	public List<Course> findCourseByCoach(String name){
		System.out.println("CD.findCourseByCoach被调用了。。。");
		String hql = "from Coach where coachName = ?";
		List<Coach> cList = (ArrayList<Coach>)this.getHibernateTemplate().find(hql,name);
		Coach c = cList.get(0);	
		List<Course> allCourse = new ArrayList<Course>(); 			
		for (Course cc : c.getCourse()) {
			allCourse.add(cc);
		}		
		return allCourse;			
	}
	//根据条件查询
	public List<Course> findCourseByFlag(String flag,String data){
		System.out.println("CD.findCourseByFlag被调用了。。。");	
		String hql = " from Course where " +flag+" = ?";;
		List<Course> courseList = new ArrayList<Course>();
		if(flag.equals("courseId")){			
			courseList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,Long.parseLong(data));
		}else if(flag.equals("courseDuration")){			
			courseList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,Long.parseLong(data)*60);
		}else{
			hql = " from Course where " +flag+" like ?";
			courseList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,"%"+data+"%");
		}		
		return courseList;				
	}
	//查询预约记录
	public List<ApptLog> findAppt(String date){					
		//转化时间类型
		List<ApptLog> apptLog = new ArrayList<ApptLog>();
		System.out.println(date);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);//指向String转换为Date()时的索引位置
		Date serDate = format.parse(date,pos);	
		//Session session  = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		String hql = "from Appointment where courseTime between '"+date+"0:00:00' and '"+date+"23:59:59'";		
		List<Appointment> apptList = (List<Appointment>) this.getHibernateTemplate().find(hql);
		System.out.println(apptList.size());
		for (Appointment appt : apptList) {					
			ApptLog AL =new ApptLog();
			String hql2 = "from Course where courseName = ?";
			List<Course> courseList = this.getHibernateTemplate().find(hql,appt.getCourseName());
			AL.setCourse(courseList.get(0));
			AL.setCourse_date(appt.getCourseTime());
			AL.getUser().add(appt.getUser());
			if(apptLog.size()==0){
				apptLog.add(AL);
			}else{
					for (ApptLog al : apptLog) {
						if(al.getCourse().getCourseId()==(AL.getCourse().getCourseId())&&(al.getCourse_date().compareTo(AL.getCourse_date()))==0){
						al.getUser().add(appt.getUser());
					}
				}	
			}
			
		}
		for (ApptLog aa : apptLog) {
			System.out.println(aa.getCourse()+" "+aa.getCourse_date());
		}
		return null;
	}
	//添加课程
	public String addCourse(Course c,String coachId){		
		Coach coach =  this.getHibernateTemplate().get(Coach.class,Integer.parseInt(coachId));
		String hql = "from Course where courseName = ?";
		List<Course> clist = this.getHibernateTemplate().find(hql,c.getCourseName()+"●"+coach.getCoachName());
		if(clist.size()>0){
			return "添加失败，已有相同老师教授本课程";
		}else{
			c.setCoach(coach);
			c.setCourseName(c.getCourseName()+"●"+coach.getCoachName());
			this.getHibernateTemplate().save(c);
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
			return "添加成功";
		}	
	}
	//课程查重
	public String checkCourseTwo(Course c){
		//1:重复 2:无重复		
		Course course =  this.getHibernateTemplate().get(Course.class,c.getCourseId());
		if(course!=null){
			return "1";	
		}else{
			return "2";	
		}		
	}
	//课程删除
	public String deleteCourse(Course c){
		Course course = this.getHibernateTemplate().get(Course.class, c.getCourseId());
		String hql = "from Appointment where courseName =?";
		List<Appointment> apptList = this.getHibernateTemplate().find(hql,course.getCourseName());
		for (Appointment appt : apptList) {
			this.getHibernateTemplate().delete(appt);
		}		
		this.getHibernateTemplate().delete(course);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return "1";		
	}
	//安排课程
	public String planCourse(Course c,String date,String coachName){
		c.setCourseName(c.getCourseName()+"●"+coachName);
		String hql = "from Course where courseName = ?";
		List<Course> courseList =(ArrayList<Course>)this.getHibernateTemplate().find(hql,c.getCourseName());
		Course course = courseList.get(0);
		if(course!=null){
			//转化时间类型
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			ParsePosition pos = new ParsePosition(0);//指向String转换为Date()时的索引位置
			Date newDate = format.parse(date,pos);
			course.getStartDate().add(newDate);				
			this.getHibernateTemplate().update(course);
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
			return "1";
		}else{
			return "2";
		}
	}
}	
