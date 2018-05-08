package com.meisi.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.meisi.bean.Appointment;
import com.meisi.bean.Card;
import com.meisi.bean.Coach;
import com.meisi.bean.Course;
import com.meisi.bean.User;
/*
 * 用户持久层
 */

public class UserDao extends HibernateDaoSupport{
	//用户登录
	public User login(User user){		
		System.out.println("UD.login被调用。。");
		System.out.println(user.getUserId()+" "+user.getPassword());
		//String hql ="from User where userId = ? and grade = 1";
		User u  = (User)this.getHibernateTemplate().get(User.class,user.getUserId());
		//User u = list.get(0);
		if(u==null){
			return null;
		}else if(u.getPassword().equals(user.getPassword())){	
			return u;
		}else{
			return null;
		}   
	}
	
	//查询所有用户
	public List<User> findAllVip(){
		System.out.println("UD.findAllVip被调用。。");
		List<User> VipList = new ArrayList<User>(); 
		String hql = "from User where grade = 0 ";  
		VipList= this.getHibernateTemplate().find(hql);		
		return VipList;		
	}
	//移动端-修改信息
	public String updateUserInfo(String flag,User user){
		System.out.println("UD.updateUserInfo被调用。。");
		User u = this.getHibernateTemplate().get(User.class, user.getUserId());
		switch(Integer.parseInt(flag)){
			case 1:
				u.setName(user.getName());
			break;
			case 2:
				u.setTel(user.getTel());
			break;
			case 3:
				u.setSex(user.getSex());
			break;
		}
		this.getHibernateTemplate().update(u);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();		
		return "OK";		
	}
	//取消预约
	public String quiteAppt(User user,String courseName,String apptId){
		System.out.println("UD.quiteAppt被调用。。");
		User vip = this.getHibernateTemplate().get(User.class, user.getUserId());	
		String hql = "from Course where courseName = ?";
		List<Course> courseList = (ArrayList<Course>)this.getHibernateTemplate().find(hql,courseName);
		Course vipCourse = courseList.get(0);
		vipCourse.setTotalNumber(vipCourse.getTotalNumber()-1);
		Appointment a = new Appointment();
		a.setApptId(Integer.parseInt(apptId));
		Appointment vipAppt =this.getHibernateTemplate().get(Appointment.class,a.getApptId());
		vip.getAppt().remove(vipAppt);
		vip.getCourse().remove(vipCourse);
		this.getHibernateTemplate().delete(vipAppt);
		this.getHibernateTemplate().update(vipCourse);
		this.getHibernateTemplate().update(vip);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();			
		return "OK";		
	}
	//根据条件查询
		public List<User> findUserByFlag(String flag,String data){
			System.out.println("UD.findCourseByFlag被调用了。。。");	
			String hql = " from User where " +flag+" = ? and grade = 0";
			List<User> userList = new ArrayList<User>();
			if(flag.equals("userId")||flag.equals("tel")){
				userList = (ArrayList<User>)this.getHibernateTemplate().find(hql,Long.parseLong(data));
			}else{
				hql = " from User where " +flag+" like ? and grade = 0";
				userList = (ArrayList<User>)this.getHibernateTemplate().find(hql,"%"+data+"%");
			}			
			return userList;					
		}
	//新增用户查重
		public String checkUserTwo(User u){
			//1:重复 2:无重复
			System.out.println("UD.checkUserTwo被调用了。。。");
			User user = this.getHibernateTemplate().get(User.class, u.getUserId());
			if(user!=null){
				return "1";	
			}else{
				return "2";	
			}		
		}
	//添加新用户
		public String addNewUser(User u,String cardType){								
			//时间转化格式						
			Calendar calendar = Calendar.getInstance();
			//开始时间
			Date startdate = new Date();				
			calendar.setTime(startdate);						
			//设置会员卡
			Card c = new Card();
			c.setType(cardType);
			c.setStartTime(startdate);
			if(cardType.equals("普通会员")){
				calendar.add(Calendar.YEAR, 1);
				Date endDate = calendar.getTime();		
				c.setEndTime(endDate);
				c.setRestTimes(50);				
			}else if(cardType.equals("高级会员")){
				calendar.add(Calendar.YEAR, 2);
				Date endDate = calendar.getTime();
				c.setEndTime(endDate);
				c.setRestTimes(100);
			}
			u.setTel(u.getUserId());
			u.setGrade(0);
			u.setCard(c);
			this.getHibernateTemplate().save(u);
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
			return "OK";			
		}
	//查找所有教练
	public List<Coach> findAllCoach(){
			String hql = "from Coach";
			List<Coach> coachList = this.getHibernateTemplate().find(hql);
			return coachList;
		}
	//根据类别查找教练
	public List<Coach> findCoachByType(String courseType){
		String hql = "from Coach where courseType=?";
		List<Coach> coachList = this.getHibernateTemplate().find(hql,courseType);
		return coachList;
	}
	//添加教练
	public String addNewCoach(Coach coach){
		this.getHibernateTemplate().save(coach);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return "OK";
	}
	//新增用户查重
	public String checkCoachTwo(Coach coach){
		//1:重复 2:无重复
		String hql = "from Coach where coachName = ?";
		List<Coach> coachList = (ArrayList<Coach>)this.getHibernateTemplate().find(hql,coach.getCoachName());
		Coach coa = coachList.get(0);		
		if(coa!=null){
			return "1";	
		}else{
			return "2";	
		}		
	}
	//根据ID删除数据
	public String deleteUser(User u){
		User user = this.getHibernateTemplate().get(User.class,u.getUserId());
		this.getHibernateTemplate().delete(user.getCard());	
		this.getHibernateTemplate().delete(user);	
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return "1";		
	}
	//通过flag查询教练	
	public List<Coach> findCoachByFlag(String flag,String data){
		String hql = " from Coach where " +flag+" = ?";
		List<Coach> coachList = new ArrayList<Coach>();
		if(flag.equals("coachId")){
			coachList = (ArrayList<Coach>)this.getHibernateTemplate().find(hql,Integer.parseInt(data));
		}else{
			hql = " from Coach where " +flag+" like ?";
			coachList = (ArrayList<Coach>)this.getHibernateTemplate().find(hql,"%"+data+"%");
		}			
		return coachList;	
	}
	//删除教练
	public String deleteCoach(Coach c){
		Coach coach = this.getHibernateTemplate().get(Coach.class,c.getCoachId());
		if(coach.getCourse().size()>0){
			for (Course ccc : coach.getCourse()) {						
				String hql = "from Appointment where courseName =?";
				List<Appointment> apptList = this.getHibernateTemplate().find(hql,ccc.getCourseName());
				for (Appointment appt : apptList) {
					this.getHibernateTemplate().delete(appt);
				}		
				this.getHibernateTemplate().delete(ccc);				
			}
		}		
		this.getHibernateTemplate().delete(coach);
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction().commit();
		return "1";	
	}
}

