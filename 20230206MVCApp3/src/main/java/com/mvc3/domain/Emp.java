package com.mvc3.domain;

import lombok.Data;

@Data
public class Emp {
	private int empno;
	private String ename;
	private int sal;
	private Dept dept;
}
