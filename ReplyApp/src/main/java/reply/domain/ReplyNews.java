package reply.domain;

import lombok.Data;

@Data
public class ReplyNews {
	private int news_idx;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	
}
