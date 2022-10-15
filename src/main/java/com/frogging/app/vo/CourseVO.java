package com.frogging.app.vo;

import java.util.List;

public class CourseVO {

	private int course_no;
	private String course_name;
	private String course_info;
	private String distance;
	private String time;
	private int waypoint;
	private String lat;
	private String log;
	private String addr; // 출발지 주소
	private String type;

	private String startaddr;
	private String endaddr;

	// 방문횟수
	private int plog_total;

	private List<Integer> noList;

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

	public String getCourse_info() {
		return course_info;
	}

	public void setCourse_info(String course_info) {
		this.course_info = course_info;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getWaypoint() {
		return waypoint;
	}

	public void setWaypoint(int waypoint) {
		this.waypoint = waypoint;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getStartaddr() {
		return startaddr;
	}

	public void setStartaddr(String startaddr) {
		this.startaddr = startaddr;
	}

	public String getEndaddr() {
		return endaddr;
	}

	public void setEndaddr(String endaddr) {
		this.endaddr = endaddr;
	}

	public int getPlog_total() {
		return plog_total;
	}

	public void setPlog_total(int plog_total) {
		this.plog_total = plog_total;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "CourseVO [course_no=" + course_no + ", course_name=" + course_name + ", course_info=" + course_info
				+ ", distance=" + distance + ", time=" + time + ", waypoint=" + waypoint + ", lat=" + lat + ", log="
				+ log + ", addr=" + addr + ", type=" + type + ", startaddr=" + startaddr + ", endaddr=" + endaddr
				+ ", plog_total=" + plog_total + "]";
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}

}
