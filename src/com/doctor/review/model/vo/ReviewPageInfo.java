package com.doctor.review.model.vo;

import java.io.Serializable;

public class ReviewPageInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int currentPage;
	private int listCount;
	private int rlimit; // review Limit
	private int plimit; // page Limit
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public ReviewPageInfo() {}
	

	public ReviewPageInfo(int currentPage, int listCount, int rlimit, int plimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.rlimit = rlimit;
		this.plimit = plimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getPlimit() {
		return plimit;
	}


	public void setPlimit(int plimit) {
		this.plimit = plimit;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getRlimit() {
		return rlimit;
	}


	public void setRlimit(int rlimit) {
		this.rlimit = rlimit;
	}


	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
}