package com.jspshop.repository;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Member;

public class MemberDAO {
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int select(Member member) {
		return sqlSession.insert("Member.insert", member);
	}
	public int selectAll(Member member) {
		return sqlSession.insert("Member.insert", member);
	}
	
	public int insert(int ) {
		return sqlSession.insert("Member.insert", member);
	}
	public int update(Member member) {
		return sqlSession.update("Member.update", member);
	}
	public int delete(Member member) {
		return sqlSession.delete("Member.delete");
	}
	
	
}
