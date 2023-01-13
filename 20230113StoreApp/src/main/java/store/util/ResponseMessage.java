package store.util;


//JSP가 아닌 Servlet으로 응답 데이터를 만드는 것이 너무 귀ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ찮기 때문
public class ResponseMessage {
	public static String getMsgURL(String msg, String url) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
		
		return sb.toString();
	}
	public static String getMsgBack(String msg) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("history.back();");
		sb.append("</script>");
		
		return sb.toString();
	}
}
