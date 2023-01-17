package noticeReact.domain;

import lombok.Data;

@Data
public class NoticeReact {
	private int notice_idx;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	
}
