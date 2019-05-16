package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.DepartmentMapperImpl;
import evil.devil.dao.impl.DoctorMapperImpl;
import evil.devil.dao.impl.UserMapperImpl;
import evil.devil.entity.Department;
import evil.devil.entity.Doctor;
import evil.devil.entity.User;


import com.alibaba.fastjson.JSON;
import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;

/**
 * Servlet implementation class DoctorSelect
 */
@WebServlet("/jsp/DoctorSelect")
public class DoctorSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int count=0;
		List<Doctor> Alldoctors=null;
		List<Doctor> doctors=new ArrayList();
		List<Department> Departments=null;
		Alldoctors=new DoctorMapperImpl().selectAll();
		Departments=new DepartmentMapperImpl().selectAll();
		if ("charset".equals(request.getParameter("key"))) {
			String message=JSON.toJSON(Departments).toString();
			response.getWriter().append(message);
		}
		
		
		if (request.getParameter("key")==null) {
		
		if (request.getParameter("departid")!=null) {
			int departid=Integer.parseInt(request.getParameter("departid")) ;
			if (departid!=0) {
				for (Doctor doctor : Alldoctors) {
					if (doctor.getDepartmentId()==departid) {
						doctors.add(doctor);//非空
					}
				}
			}else {
				doctors=Alldoctors;
			}
			count=doctors.size();
		}
		

		
		if (request.getParameter("departid")!=null) {
			if (count==0) {
				request.getSession().setAttribute("departments", Departments);
				request.getSession().setAttribute("doctorList", Alldoctors);
				response.getWriter().append("查询结果为空");
			}else if (count!=0) {
				request.getSession().setAttribute("departments", Departments);
				request.getSession().setAttribute("doctorList", doctors);
				response.getWriter().append("查询成功");
			}
		}
		if (request.getParameter("departid")==null) {
			request.setAttribute("departments", Departments);
			request.setAttribute("doctorList", Alldoctors);
				request.getRequestDispatcher("doctorManegement.jsp").forward(request, response);
			}
		
		}
		
		
		else if("key".equals(request.getParameter("key"))){
			String departments=JSON.toJSON(Departments).toString();
			response.getWriter().append(departments);
		}
			
		
	}

}
