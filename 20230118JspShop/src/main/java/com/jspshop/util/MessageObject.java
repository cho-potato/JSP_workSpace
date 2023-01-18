package com.jspshop.util;

import lombok.Data;

@Data
public class MessageObject {
	private int code; // 성공 또는 실패를 식별하는 식별 코드 1, 0
	private String msg; // 클라이언트에게 전송 하고픈 말
	
}
