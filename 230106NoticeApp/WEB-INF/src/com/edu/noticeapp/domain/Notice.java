package com.edu.noticeapp.domain;

public class Notice {
	private int notice_idx;
	private String title;
	private String writer;
	private String content;
	private String regdate;
		private int hit;

	public int getNotice_idx() {
		return notice_idx;
		}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getTitle() {
		return title;
		}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
		}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
		}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return content;
		}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
		}
	public void setHit(int hit) {
		this.hit = hit;
	}


}
