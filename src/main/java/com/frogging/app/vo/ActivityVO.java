package com.frogging.app.vo;

public class ActivityVO {

	// !!!!!!!!!!!!! db 변경사항 반영할 것 !!!!!!!!!!!!!
	private String id;
	private int course_no;
	private String course_name;
	private int distance;
	private int step;
	private int time;
	private int amount_trash;
	private String before_image;
	private String after_image;
	private String date;

	// user+total info
	private String nickname;
	private int total_distance;
	private int plog_count;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getAmount_trash() {
		return amount_trash;
	}

	public void setAmount_trash(int amount_trash) {
		this.amount_trash = amount_trash;
	}

	public String getBefore_image() {
		return before_image;
	}

	public void setBefore_image(String before_image) {
		this.before_image = before_image;
	}

	public String getAfter_image() {
		return after_image;
	}

	public void setAfter_image(String after_image) {
		this.after_image = after_image;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getTotal_distance() {
		return total_distance;
	}

	public void setTotal_distance(int total_distance) {
		this.total_distance = total_distance;
	}

	public int getPlog_count() {
		return plog_count;
	}

	public void setPlog_count(int plog_count) {
		this.plog_count = plog_count;
	}

}