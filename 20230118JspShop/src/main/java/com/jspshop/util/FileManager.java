package com.jspshop.util;

// 파일과 관련된 유용한 기능을 모아놓는 유틸 클래스
public class FileManager {

	// 정해진 경로를 이용하여 확장자 추출
	public static String getExt(String path) {
		int index = path.lastIndexOf("."); // 제일 마지막 점의 인덱스
		return path.substring(index+1, path.length());
	}
	public static void main(String[] args) {
		System.out.println(getExt("test.babo.aa.jpg"));
	}
}
