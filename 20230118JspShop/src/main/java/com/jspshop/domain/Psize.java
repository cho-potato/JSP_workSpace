package com.jspshop.domain;

import lombok.Data;

@Data
public class Psize {
	private int psize_idx;
	private Product product; // 부모인 product를 찾아가는 association
	private String psize_name; 
}
