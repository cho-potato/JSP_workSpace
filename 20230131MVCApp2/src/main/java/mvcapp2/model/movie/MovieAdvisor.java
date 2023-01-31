package mvcapp2.model.movie;

public class MovieAdvisor {
	
	public String getAdvice(String movie) {
		String msg=null;//결과 메시지를 담을 변수

		if(movie.equals("아바타2")){
			msg="전편 아바타에 이은 후속작";
		}else if(movie.equals("영웅")){
			msg="안중근 의사 일대기";
		}else if(movie.equals("메간")){
			msg="AI SF공포물";
		}else if(movie.equals("유령")){
			msg="일제강점기 총독암살 조직을 그린 영화";
		}		
		return msg;
	}
}
