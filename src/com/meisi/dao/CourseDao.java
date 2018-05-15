package com.meisi.dao;

import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.meisi.bean.Appointment;
import com.meisi.bean.Coach;
import com.meisi.bean.Course;
import com.meisi.bean.Notice;
import com.meisi.bean.User;
import com.meisi.util.ApptLog;
import com.meisi.util.ApptSMSUtil;


public class CourseDao extends HibernateDaoSupport{
	//根据课程类型查课
	public List<Course> findCourseByType(Course course){		
		String hql = "from Course where courseType = ?";  	
		List<Course> courList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,course.getCourseType()); 
		return courList;
		
	}
	//根据课程ID查课
	public Course findCourseById(Course course){		
		Course c  =(Course)this.getHibernateTemplate().get(Course.class,course.getCourseId()); 		
		return c;		
	}
	//统计某节课程已报人数
	public String findClassNumber(Course c,String date){
		String hql = "select count(a.apptId) from Appointment as a where a.courseTime = '"+date+"' and a.courseName = '"+c.getCourseName()+"'";
		Number count = (Number)this.getHibernateTemplate().find(hql).listIterator().next();
		return String.valueOf(count);
		
	}
	//预约课程-移动端
	public String apptmenCourse(String userId,Course c,String date){		
		//转化时间类型
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ParsePosition pos = new ParsePosition(0);//指向String转换为Date()时的索引位置
		Date rcreate = format.parse(date,pos);
		//查询User
		User vip = (User)this.getHibernateTemplate().get(User.class,Long.parseLong(userId));
		//查询course
		Course apptCourse = (Course)this.getHibernateTemplate().get(Course.class,c.getCourseId());		
		//统计已预约人数
		String hql = "select count(a.apptId) from Appointment as a where a.courseTime = '"+date+"' and a.courseName = '"+apptCourse.getCourseName()+"'";
		Number count = (Number)this.getHibernateTemplate().find(hql).listIterator().next();
		//给用户添加新的预约课程
		vip.getCourse().add(apptCourse);
		//进行预约条件判断
		//预约人数判断
		if(count.intValue()==apptCourse.getClassNumber()){
			return "CLASSNUMBERERRO";
		}else if(vip.getCard().getRestTimes()>0){
			//次数判断
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
			//总人数+1
			apptCourse.setTotalNumber(apptCourse.getTotalNumber()+1);
			this.getHibernateTemplate().update(apptCourse);
			this.getHibernateTemplate().update(vip);
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
			//System.out.println(ApptSMSUtil.sendSms(String.valueOf(vip.getTel()), date, apptCourse.getCourseName(), vip.getName()));
			return "OK";
		}else{
			return "TIMESERRO";
		}			
	}
	//推荐课程-移动端
	public List<Course> addviceCourse(){		
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
		}	
			return advice;		
	}
	//查询所有课程
	public List<Course> findAllCourse(final int page ,final int pageSize){		
		List<Course> allCourse = this.getHibernateTemplate().execute(new HibernateCallback(){
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Course"; 
				Query query = session.createQuery(hql);
				int begin = (page-1)*pageSize; 
				query.setFirstResult(begin);  
				query.setMaxResults(pageSize); 
				return query.list();
			}			
		});
		return allCourse;		
	}
	//计算课程表总页数
	public int CourseNumber(int pageSize){
		List<User> courseList = this.getHibernateTemplate().find("from Course");
		int count = courseList.size();
		if(count%pageSize==0){
			return (count/pageSize);
		}else{
			return (count/pageSize)+1;
		}	
	}
	//根据教练名称筛选课程
	public List<Course> findCourseByCoach(String name){
		String hql = "from Coach where coachName = ?";
		List<Coach> cList = (ArrayList<Coach>)this.getHibernateTemplate().find(hql,name);
		Coach c = cList.get(0);	
		List<Course> allCourse = new ArrayList<Course>(); 			
		for (Course cc : c.getCourse()) {
			allCourse.add(cc);
		}		
		return allCourse;			
	}
	//根据时间筛选课程
	public List<Course> findCourseByDate(String courseDate,Course c){
		String hql = "from Course where courseType = ?";  	
		List<Course> courList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,c.getCourseType()); 
		SimpleDateFormat str = new SimpleDateFormat("yyyy-MM-dd");
		List<Course> allCourse = new ArrayList<Course>(); 
		for (Course course : courList) {
			for (Date date : course.getStartDate()) {				
				String serDate = str.format(date);
				if(serDate.equals(courseDate)){
					allCourse.add(course);
				}
			}
		}
		return allCourse;
	}
	//根据时间和教练筛选课程
	public List<Course> findCourseByDateAndCoach(String name,String courseDate,Course c){
		String hql = "from Coach where coachName = ?";
		List<Coach> cList = (ArrayList<Coach>)this.getHibernateTemplate().find(hql,name);
		Coach coach = cList.get(0);	
		List<Course> courseList = new ArrayList<Course>(); 
		List<Course> allCourse = new ArrayList<Course>(); 
		SimpleDateFormat str = new SimpleDateFormat("yyyy-MM-dd");		
		for (Course cc : coach.getCourse()) {
			courseList.add(cc);
		}
		for (Course course : courseList) {
			for (Date date : course.getStartDate()) {				
				String serDate = str.format(date);
				if(serDate.equals(courseDate)){
					allCourse.add(course);
				}
			}
		}
		return allCourse;
	}
	//根据条件查询
	public List<Course> findCourseByFlag(String flag,String data){
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
		String hql = "from Appointment where courseTime between '"+date+" 0:00:00' and '"+date+" 23:59:59'";		
		List<Appointment> apptList = (List<Appointment>) this.getHibernateTemplate().find(hql);
		System.out.println(apptList.get(0).getCourseName());
//		for (Appointment appt : apptList) {					
//			ApptLog AL =new ApptLog();
//			String hql2 = "from Course where courseName = ?";
//			List<Course> courseList = this.getHibernateTemplate().find(hql,appt.getCourseName());
//			AL.setCourse(courseList.get(0));
//			AL.setCourse_date(appt.getCourseTime());
//			AL.getUser().add(appt.getUser());
//			if(apptLog.size()==0){
//				apptLog.add(AL);
//			}else{
//					for (ApptLog al : apptLog) {
//						if(al.getCourse().getCourseId()==(AL.getCourse().getCourseId())&&(al.getCourse_date().compareTo(AL.getCourse_date()))==0){
//						al.getUser().add(appt.getUser());
//					}
//				}	
//			}
//			
//		}
//		for (ApptLog aa : apptLog) {
//			System.out.println(aa.getCourse()+" "+aa.getCourse_date());
//		}
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
	public String planCourse(Course c,String date){			
		String hql = "from Course where courseName = ?";
		Course course = this.getHibernateTemplate().get(Course.class, c.getCourseId());
		//转换时间格式
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		ParsePosition pos = new ParsePosition(0);//指向String转换为Date()时的索引位置
		Date newDate = format.parse(date,pos);
		for (Date d: course.getStartDate()) {
			if(d.compareTo(newDate)==0){
				return "3";
			}
		}
		if(course!=null){					
			course.getStartDate().add(newDate);				
			this.getHibernateTemplate().update(course);
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
			return "1";
		}else{
			return "2";
		}
	}
	//更新课程信息
	public String updateCourse(Course c){
		Course course = this.getHibernateTemplate().get(Course.class, c.getCourseId());
		course.setCourseName(c.getCourseName()+"●"+course.getCoach().getCoachName());
		course.setCourseDuration(c.getCourseDuration());
		course.setCourseIntro(c.getCourseIntro());
		this.getHibernateTemplate().update(course);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return "1";
	}	
	
	
	
	
/*
 * 通知部分	
 */
	//发布通知
	public String addNotice(Notice notice){	
		notice.setPublishTime(new Date());
		this.getHibernateTemplate().save(notice);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return  "OK";
	}	
	//查询所有通知
	public List<Notice> findAllNotice(final int page ,final int pageSize){	
		List<Notice> notice = this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Notice"; 
				Query query = session.createQuery(hql);
				int begin = (page-1)*pageSize; 
				query.setFirstResult(begin);  
				query.setMaxResults(pageSize); 
				return query.list();
			}
			
		});
		return notice;
	}
	//查询页面多少页
	public int NoticeNumber(int pageSize){
		List<Notice> courseList = this.getHibernateTemplate().find("from Notice");
		int count = courseList.size();
		if(count%pageSize==0){
			return (count/pageSize);
		}else{
			return (count/pageSize)+1;
		}	
	}
	//根据ID查询
	public Notice findByID(Notice notice){
		return this.getHibernateTemplate().get(Notice.class, notice.getNoticeId());
	}
	//更新公告
	public String updateNotice(Notice notice){
		Notice newNotice = this.getHibernateTemplate().get(Notice.class, notice.getNoticeId());
		newNotice.setNoticeDetail(notice.getNoticeDetail());
		newNotice.setTitle(notice.getTitle());
		this.getHibernateTemplate().update(newNotice);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return "1";
	}
}	
