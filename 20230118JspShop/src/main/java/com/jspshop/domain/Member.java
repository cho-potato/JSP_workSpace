package com.jspshop.domain;

import lombok.Data;

@Data
public class Member {
	private int member_idx;
	private String id;
	private String pass;
	private String name;
	private String email;
	private String addr1; // 기본주소
	private String addr2; // 상세주소
	private String regdate;
	
}