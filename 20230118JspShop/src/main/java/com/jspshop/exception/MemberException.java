package com.jspshop.exception;

public class MemberException extends RuntimeException{
	
	//개발자가 전달하고픈 에러 메시지...
	public MemberException(String msg) {
		super(msg);
	}
	
}