package com.meisi.util;

import java.io.Serializable;

public class Utillist<T> implements Serializable {
	private String msg;	//提示信息
	private int code;	//报错代码
	private T list;		//内容
	
	public Utillist(String msg,T data, int code){
		this.msg=msg;
		this.code=code;
		this.list = data;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getList() {
		return list;
	}
	public void setList(T list) {
		this.list = list;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public static <T> Utillist<T> CreatUtillist(String msg, T data,int code) {
	        return new Utillist<T>(msg,data, code);
	  }

	
}
