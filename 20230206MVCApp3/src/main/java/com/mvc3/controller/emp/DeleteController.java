package com.mvc3.controller.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Emp;
import com.mvc3.model.emp.EmpService;

// 사원들 삭제 요청을 처리하는 하위 컨트롤러
public class DeleteController implements Controller {
	EmpService empService = new EmpService(); // 3)

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 1)
		String[] empno = request.getParameterValues("empno");
		// int[] deptno = new int[empno.length]; // 부서 번호를 담을 배열 // emp에 dept가 있으므로 필요없음
		
		// 3단계
		for(int i = 0; i<empno.length; i++) {
			System.out.println(empno[i]);
			Emp emp = empService.select(Integer.parseInt(empno[i]));
			// deptno[i]=emp.getDept().getDeptno(); // 부서 대입 // emp에 dept가 있으므로 필요없음
			empService.remove(emp);
		}
		// 2) 넘겨받은 empno를 이용하여 해당 사원이 몇 번 부서에서 근무했는지 
		// 그 부서번호를 가져와야 함
		
	}
	public String getViewName() {

		return "/emp/view/del";
	}
	public boolean isForward() {

		return false; // 저장할 것이 없기 때문에 forwarding은 false
	}
}
