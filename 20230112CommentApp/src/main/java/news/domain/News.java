package news.domain;

import java.util.List;

import lombok.Data;

@Data
public class News {

	private int news_idx;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	// 하나의 뉴스 기사는 여러 명의 자식 글을 보유할 수 있다(하나의 부모는 여러 자식을 거느릴 수 있다)
	// Mybatis에서 이런 관계를 Collection이라 한다(Collection으로 처리 가능)
	private List<Comments> commentsList;
}
