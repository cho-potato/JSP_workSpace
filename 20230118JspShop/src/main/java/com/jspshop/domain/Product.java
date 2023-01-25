package com.jspshop.domain;

import java.util.List;

import lombok.Data;

@Data
public class Product {
	private int product_idx;
	private Category category; // Mybatis에서 부모를 association 연결
	private String product_name;
	private String brand;
	private int price;
	private int discount;
	private String detail;

	//하나의 상품이 거느리고 있는 자식 테이블을 표현한 DTO들
	private List<Psize> psizeList; //mybatis 의 collection의 대상임
	private List<Color> colorList;
	private List<Pimg> pimgList;
}