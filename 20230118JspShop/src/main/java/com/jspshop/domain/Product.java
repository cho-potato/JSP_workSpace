package com.jspshop.domain;

import lombok.Data;

@Data
public class Product {
	private int product_idx;
	private Category category; // Mybatis에서 부모를 association 연결
	private String prouct_name;
	private String brand;
	private int price;
	private int discount;
	private String detail;
}
