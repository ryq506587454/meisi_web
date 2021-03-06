package com.meisi.action;

import java.util.List;

import com.meisi.bean.Coach;
import com.meisi.service.UserService;
import com.meisi.util.Utillist;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CoachAction extends ActionSupport implements ModelDriven<Coach>{
	//生成模型
		//模型
		private Coach Coach;
		@Override
		public Coach getModel() {
			if( Coach  == null){
				 Coach = new  Coach ();
		       }
			return this.Coach;
		}
		//JSON数据	
		private String msg;
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		private Coach midCoach;				
		public Coach getMidCoach() {
			return midCoach;
		}
		public void setMidCoach(Coach midCoach) {
			this.midCoach = midCoach;
		}
		private List<Coach> coachList;		
		public List<Coach> getCoachList() {
			return coachList;
		}
		public void setCoachList(List<Coach> coachList) {
			this.coachList = coachList;
		}
		//前端输入数据	
		//输入框数据
		private String data;		
		public String getData() {
			return data;
		}
		public void setData(String data) {
			this.data = data;
		}
		
		private String flag;	
		public String getFlag() {
			return flag;
		}
		public void setFlag(String flag) {
			this.flag = flag;
		}
		private String page;	
		public String getPage() {
			return page;
		}
		public void setPage(String page) {
			this.page = page;
		}
		//辅助工具
		private Utillist utillist; 		
		public Utillist getUtillist() {
			return utillist;
		}
		public void setUtillist(Utillist utillist) {
			this.utillist = utillist;
		}
		//设置页面大小
		private int pageSize = 5;
	//教练业务层注入（公用User的）
		private UserService UserService;
		public void setUserService(UserService userService) {
			UserService = userService;
		}
		//添加新教练	
		public String AddNewCoach(){
			UserService.addNewCoach(Coach);
			return "AddCoach_Success";			
		}
		//教练查重
		public String CheckCoachTwo(){
			msg =  UserService.checkCoachTwo(Coach);
			return "MediaMsg";	
		}
		//查找所有教练
		public String FindAllCoach(){		
			utillist=utillist.CreatUtillist(String.valueOf(UserService.CoachNumber(pageSize)),UserService.findAllCoach(Integer.valueOf(page),pageSize),100);			
			return "UtilList";
		}
		//根据条件查询
		public String FindByFlag(){		
			coachList = UserService.findCoachByFlag(flag, data,Integer.valueOf(page),pageSize);	
			if(coachList==null||coachList.size()==0){
		    	msg ="未查询到结果";
		    	utillist=utillist.CreatUtillist(msg,coachList,100);	    	
		    	return "UtilList";
		    }else{
		    	msg ="查询到结果";
		    	utillist=utillist.CreatUtillist(msg,coachList,101);	 
		    	return "UtilList";	
		    }
		}
		//删除教练
		public String DeleteCoach(){
			msg =  UserService.deleteCoach(Coach);
			return "MediaMsg";	
		}
		//根据ID查找教练
		public String FindById(){
			ActionContext.getContext().getSession().put("coachId",String.valueOf(Coach.getCoachId()));;
			midCoach = UserService.findByCoachId(Coach);		
			return "MidCoach";	
		}
		//更新教练信息
		public String UpdateCoach(){
			msg = UserService.updateCoach(Coach);
			return "Update_suc";	
		}
		//跳转到详情
		public String Jump(){
			ActionContext.getContext().getSession().put("coachId",String.valueOf(Coach.getCoachId()));;
			return "JumpToDetail";
		}
		
}
