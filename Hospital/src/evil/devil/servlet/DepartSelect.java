package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import evil.devil.dao.impl.DepartmentMapperImpl;
import evil.devil.dao.impl.DoctorMapperImpl;
import evil.devil.entity.Department;
import evil.devil.entity.Doctor;
import evil.devil.entity.User;

/**
 * Servlet implementation class DepartSelect
 */
@WebServlet("/jsp/DepartSelect")
public class DepartSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DepartSelect() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 一个mapper--一个数对应一个数组对象
		HashMap<Department, List<Doctor>> ddMap = new HashMap<Department, List<Doctor>>();
		List<Department> allDeparts = null;
		// List<Department> departs=null;
		int count = 0;
		// String selectmsg=(String) request.getParameter("selectmsg");
		String way = request.getParameter("way") == null ? "all" : request.getParameter("way");// 如果传进来的way是空就是all
		allDeparts = new DepartmentMapperImpl().selectAll();

//		if (way.equals("ordinary")) {
//			for (Department department : allDeparts) {
//				if (department) {
//
//				}
//			}
//		} else if (way.equals("specialist")) {// 第二次来还是要传入way allDeparts =new
//			DepartmentMapperImpl().getSpecialist();
//		}
		System.out.println(way+"---------------");
		if (way.equals("all")) {
			for (Department department : allDeparts) {// 全部放进了map
				System.out.println(department.getName());
				List<Doctor> doctors = new DoctorMapperImpl().getByDeaprt(department.getId());
				for (Doctor doctor : doctors) {
					System.out.println(doctor.getName());
				}
				ddMap.put(department, doctors);
			}
		}

		else if (way.equals("ordinary")) {
			for (Department department : allDeparts) {// 全部放进了map
				System.out.println(department.getName());
				List<Doctor> doctors1 = new DoctorMapperImpl().getByDeaprt(department.getId());
				List<Doctor> doctors=new ArrayList<Doctor>();
				for (Doctor doctor : doctors1) {
					if (doctor.getType().equals("普通医生")) {
						doctors.add(doctor);
					}
				}
				ddMap.put(department, doctors);
			}
		} else if (way.equals("specialist")) {
			for (Department department : allDeparts) {// 全部放进了map
				System.out.println(department.getName());
				List<Doctor> doctors1 = new DoctorMapperImpl().getByDeaprt(department.getId());
				List<Doctor> doctors=new ArrayList<Doctor>();
				for (Doctor doctor : doctors1) {
					if (doctor.getType().equals("专家")) {
						System.out.println(doctor);
						doctors.add(doctor);
					}
				}
				ddMap.put(department, doctors);
			}
		}

		count = allDeparts.size();
		if (count != 0) {
			// List<Student> list= 传入一个当前页面和size
			request.getSession().setAttribute("ddMap", ddMap);
			// request.getSession().setAttribute("allDeparts", allDeparts);
			response.getWriter().append("查询成功");
		} else {
			response.getWriter().append("查询结果为空");
		}
		if (request.getParameter("way") == null) {
			request.getRequestDispatcher("departManegeMain.jsp").forward(request, response);
		}

	}

}
