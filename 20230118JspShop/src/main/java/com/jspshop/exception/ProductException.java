package com.jspshop.exception;

public class ProductException extends RuntimeException {
	
	
	// 개발자가 전달하려는 에러 메시지
	public ProductException(String msg) {
		super(msg);
		
	}
}
