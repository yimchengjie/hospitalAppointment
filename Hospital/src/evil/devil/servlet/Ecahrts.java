package evil.devil.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import evil.devil.dao.impl.AccountMapperImpl;
import evil.devil.dao.impl.DepartmentMapperImpl;
import evil.devil.entity.Account;
import evil.devil.entity.Department;
import evil.devil.entity.Doctor;

@WebServlet("/jsp/Ecahrts")
public class Ecahrts extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ecahrts() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Department> Departments=new DepartmentMapperImpl().selectAll();//每个部门的收入
		List<Account> Accounts=new AccountMapperImpl().selectAll();
		Map<String,Integer> map=new HashMap<String,Integer>();
	for (Department department : Departments) {
		int id=department.getId();
		int earning=0;
		for (Account account : Accounts) {
			if(account.getDoctorId()==id) {
				earning+=account.getPrice();
			}
		}
		map.put(department.getName(), earning);
	}
		String jsonmap=JSON.toJSONString(map);
		response.getWriter().append(jsonmap);
	}

}
