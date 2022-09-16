package com.frogging.app.vo;

public class PartyVO {
	private int no;
	private String partyname;
	private int number; // 총 참여인원
	private int current_number; // 총 참여인원
	private int course_no;
	private String id; // 파티장 아이디
	private String content;
	private String meeting_place;
	private String meeting_time;

	// course data
	private String course_name;

	@Override
	public String toString() {
		return "PartyVO [content=" + content + ", course_no=" + course_no + ", current_number=" + current_number
				+ ", meeting_place=" + meeting_place + ", meeting_time=" + meeting_time + ", no=" + no + ", number=" + number
				+ ", partyname=" + partyname + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPartyname() {
		return partyname;
	}

	public void setPartyname(String partyname) {
		this.partyname = partyname;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getCurrent_number() {
		return current_number;
	}

	public void setCurrent_number(int current_number) {
		this.current_number = current_number;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMeeting_place() {
		return meeting_place;
	}

	public void setMeeting_place(String meeting_place) {
		this.meeting_place = meeting_place;
	}

	public String getMeeting_time() {
		return meeting_time;
	}

	public void setMeeting_time(String meeting_time) {
		this.meeting_time = meeting_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

}
