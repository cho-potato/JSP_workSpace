package com.jspshop.domain;

import lombok.Data;

@Data
public class Color {
	private int color_idx;
	private Product product; // 부모인 product를 association으로 가져온다
	private String color_name;
		
}
