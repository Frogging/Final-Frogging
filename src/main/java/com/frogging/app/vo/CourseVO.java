package com.frogging.app.vo;

public class CourseVO {

	private int course_no;
	private String course_name;
	private String course_info;
	private String distance;
	private String time;
	private int waypoint;
	private String lat;
	private String log;
	private String addr;
	private String startaddr;
	private String endaddr;
	
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
	@Override
	public String toString() {
		return "CourseVO [course_no=" + course_no + ", course_name=" + course_name + ", course_info=" + course_info
				+ ", distance=" + distance + ", time=" + time + ", waypoint=" + waypoint + ", lat=" + lat + ", log="
				+ log + ", addr=" + addr + ", startaddr=" + startaddr + ", endaddr=" + endaddr + "]";
	}
}
