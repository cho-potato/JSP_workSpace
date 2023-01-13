package reply.domain;

import lombok.Data;

@Data
public class ReplyComments {
	private int comments_idx;
	private String msg;
	private String author;
	private String writedate;
	private ReplyNews replyNews;
	
}
