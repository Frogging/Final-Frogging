package com.frogging.app.vo;

public class PlogPagingVO {
	private int nowPage = 1; // 현재 페이지
	private int onePageRecord = 12; // 한페이지에 출력할 레코드수
	private int totalRecord; // 총레코드수
	private int totalPage;// 총페이지수
	private int offsetPoint; // 페이지 레코드 offset

	// 페이지 번호
	private int startPage = 1;
	private int onePageCount = 5;

	// 검색
	private String searchLoc; // 위치 검색
	private String searchDate; // 날짜 검색

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		// 선택 레코드 시작 위치
		offsetPoint = (nowPage - 1) * onePageRecord;
		// 표시할 페이지의 시작번호
		startPage = (nowPage - 1) / onePageCount * onePageCount + 1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총페이지수 구하기
		totalPage = totalRecord / onePageRecord;
		if (totalRecord % onePageRecord != 0) {
			totalPage++;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;

	}

	public int getOffsetPoint() {
		return offsetPoint;
	}

	public void setOffsetPoint(int offsetPoint) {
		this.offsetPoint = offsetPoint;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public String getSearchLoc() {
		return searchLoc;
	}

	public void setSearchLoc(String searchLoc) {
		this.searchLoc = searchLoc;
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
}