package com.frogging.app.vo;

import java.util.List;

public class CommunityVO {
	private int no;
	private String subject;
	private String content;
	private String id;
	private int hit;
	private String writedate;
	private int depth;
	//여러개의 레코드 번호를 저장
	private List<Integer> noList;
	@Override
	public String toString() {
		return "CommunityVO [no=" + no + ", subject=" + subject + ", content=" + content + ", id=" + id + ", hit=" + hit
				+ ", writedate=" + writedate + ", depth=" + depth + ", noList=" + noList + "]";
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
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	
	
	
	
	
	
}