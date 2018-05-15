package com.meisi.action;

import java.util.List;
import com.meisi.bean.Notice;
import com.meisi.service.CourseService;
import com.meisi.util.Utillist;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class NoticeAction extends ActionSupport implements ModelDriven<Notice>{
	//生成模型
		//模型
		private Notice Notice;
		@Override
		public Notice getModel() {
			if(Notice == null){
				Notice = new Notice();
			}
			return this.Notice;
		}	
	//JSON数据
		private Notice mediaNotice;		
		public Notice getMediaNotice() {
			return mediaNotice;
		}

		public void setMediaNotice(Notice mediaNotice) {
			this.mediaNotice = mediaNotice;
		}
		private List<Notice> mediaNoticeList;		
		public List<Notice> getMediaNoticeList() {
			return mediaNoticeList;
		}

		public void setMediaNoticeList(List<Notice> mediaNoticeList) {
			this.mediaNoticeList = mediaNoticeList;
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
		private int pageSize = 3;
		//课程业务层注入
		private CourseService CourseService;
		public void setCourseService(CourseService courseService) {
			CourseService = courseService;
		}
		
		//增加通知
		public String AddNotice(){
			CourseService.addNotice(Notice);
			return "Add_suc";
		}	
		//查看所有通知
		public String FindAllNotice(){
			utillist=utillist.CreatUtillist(String.valueOf(CourseService.NoticeNumber(pageSize)),CourseService.findAllNotice(Integer.valueOf(page), pageSize),100);			
			return "UtilList";						
		}
		//跳转到详情
		public String Jump(){
			ActionContext.getContext().getSession().put("noticeId",String.valueOf(Notice.getNoticeId()));;
			return "JumpToDetail";
		}
		//根据ID查询
		public String FindByID(){
			mediaNotice=CourseService.findByID(Notice);
			return "MediaNotice";
		}
		//更新公告
		public String UpdateNotice(){
			CourseService.updateNotice(Notice);
			return "Update_suc";
		}
}
