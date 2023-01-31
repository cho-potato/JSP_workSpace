package mvcapp2.model.blood;

//이 클래스는 EE든 SE든 둘 다 사용 가능한 공통 로직이다
//즉, 재사용성을 위해 기존 JSP에서 아래 코드를 분리시켰다
//MVC 개발 방법론에 의해 이 객체의 역할은 Model이다(M)
public class BloodAdvisor {
	
	// 혈액형에 대한 판단결과를 반환해주는 메서드
	public String getAdvice(String blood) {
	// 현재 코드에서 중립적인 자바 코드는 굳이 JSP 안에 둘 필요가 없다
	// 미래의 재사용성을 위해 별도로 분리시켜 놓아야 한다
	// 혈액형에 대한 판단
	String msg = null; // 결과 메시지를 담을 변수
	if(blood.equals("A")) {
		msg="꼼꼼하다";
	} else if(blood.equals("B")) {
		msg = "자기 주관이 뚜렷하다";
	} else if(blood.equals("O")) {
		msg = "친구가 많다";
	} else if(blood.equals("AB")) {
		msg = "선택지를 많이 둔다";
	}
	// out.print(msg);
	return msg;
	}
}
