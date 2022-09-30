package com.frogging.app.vo;

import java.util.List;

public class EventVO {
	private int no;
	private String subject;
	private String content;
	private String id;
	private int hit;
	private String writedate;
	
	private List<Integer> noList;
	
	@Override
	public String toString() {
		return "EventVO [no=" + no + ", subject=" + subject + ", content=" + content + ", id=" + id + ", hit=" + hit
				+ ", writedate=" + writedate + ", noList=" + noList + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	
}
