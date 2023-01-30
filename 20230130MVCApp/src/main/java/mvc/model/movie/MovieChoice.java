package mvc.model.movie;

public class MovieChoice {

	public String getChoice(String movie) {
		
		String msg = null;
		if(movie.equals("해리포터")) {
			msg = "";
		} else if(movie.equals("리포터해")) {
			msg = "리포터해";
		}else if(movie.equals("포터해리")) {
			msg = "포터해리";
		}else if(movie.equals("터해리포")) {
			msg = "터해리포";
		}
		return msg;
	}
}
