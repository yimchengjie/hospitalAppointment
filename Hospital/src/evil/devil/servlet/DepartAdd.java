package evil.devil.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.DepartmentMapperImpl;
import evil.devil.entity.Department;

/**
 * Servlet implementation class DepartAdd
 */
@WebServlet("/jsp/DepartAdd")
public class DepartAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartAdd() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String name=request.getParameter("name");
			Department department=new Department();
			department.setName(name);
			int i=new DepartmentMapperImpl().insert(department);
			String data="添加失败";
			if (i==1) {
				 data="添加成功";
			}
			response.getWriter().append(data);
	}

}
