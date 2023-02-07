package com.mvc3.model.emp;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.domain.Dept;
import com.mvc3.exception.DeptException;
import com.mvc3.exception.EmpException;

public class DeptDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insert(Dept dept) throws DeptException {
		int result = sqlSession.insert("Dept.insert", dept);
		if(result < 1) {
			throw new DeptException("부서등록 실패");
		}
	}
	public void delete(int deptno) throws DeptException {
		int result = sqlSession.delete("Dept.delete", deptno);
		if (result < 1) {
			throw new DeptException("부서 삭제 실패");
		}
	}

}
