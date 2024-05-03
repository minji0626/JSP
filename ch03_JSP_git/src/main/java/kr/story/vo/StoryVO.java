package kr.story.vo;

import java.sql.Date;

public class StoryVO {
	private int snum;
	private String title;
	private String content;
	private String ip;
	private int num; // 회원 관리의 기본키
	private Date reg_date;
	
	private String id; // join 해서 가져올 하나의 변수를 더 설정
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getNum() {
	    return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
