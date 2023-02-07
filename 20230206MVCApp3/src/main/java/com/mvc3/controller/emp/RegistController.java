package com.mvc3.controller.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Dept;
import com.mvc3.domain.Emp;
import com.mvc3.exception.DeptException;
import com.mvc3.exception.EmpException;
import com.mvc3.model.emp.DeptDAO;
import com.mvc3.model.emp.EmpDAO;
import com.mvc3.model.emp.EmpService;
import com.mvc3.mybatis.MybatisConfig;

// 사원 신규 등록 요청을 처리하는 하위 컨트롤러(부서 + 사원 동시 진행)
public class RegistController implements Controller {
	EmpService empService = new EmpService();
	
	// MybatisConfig config = MybatisConfig.getInstance(); // 4) 취득해야 SqlSession

	// 2) 부서와 사원을 넣을 수 있는 DAO 보유하자
	// DeptDAO deptDAO = new DeptDAO();
	// EmpDAO empDAO = new EmpDAO();

	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 1) 파라미터 받기
		String dname = request.getParameter("dname");
		String ename = request.getParameter("ename");
		String sal = request.getParameter("sal");

		// 3) 부서 DTO 올리기 (insert 해야하니까)
		Dept dept = new Dept();
		dept.setDname(dname); // 부서명 채우기

		// 6) 사원 DTO
		Emp emp = new Emp();
		emp.setEname(ename);
		emp.setSal(Integer.parseInt(sal));
		emp.setDept(dept); // 부서 dept 대입

		// 3) 3단계)
		// SqlSession sqlSession = config.getSqlSession();
		// deptDAO.setSqlSession(sqlSession); // 주입
		// empDAO.setSqlSession(sqlSession); // 주입
		empService.regist(emp);
		
		// 5) try-catch 걸기 deptDAO.insert(dept)
		/*
		 try {

			deptDAO.insert(dept); // 부서 등록
			empDAO.insert(emp); // 사원 등록
			sqlSession.commit();
		} catch (DeptException e) {
			sqlSession.rollback();
			e.printStackTrace();
		} catch (EmpException e) {
			sqlSession.rollback();
			e.printStackTrace();
		}
		config.release(sqlSession);
		*/
	}


	public String getViewName() {

		return "/emp/view/regist"; // 6)
	}

	public boolean isForward() {
		return false; // Redirect
	}

}
