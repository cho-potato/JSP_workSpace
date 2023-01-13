package member.domain;

import lombok.Data;

@Data
public class Member {
	private int member_idx;
	private String id;
	private String pass;
	private String name;
	private String regdate;
}
