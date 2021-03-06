package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import evil.devil.dao.AccountMapper;
import evil.devil.dao.DepartmentMapper;
import evil.devil.dao.DoctorMapper;
import evil.devil.dao.impl.AccountMapperImpl;
import evil.devil.dao.impl.DepartmentMapperImpl;
import evil.devil.dao.impl.DoctorMapperImpl;
import evil.devil.entity.Account;
import evil.devil.entity.Department;
import evil.devil.entity.Doctor;
import evil.devil.entity.User;

/**
 * Servlet implementation class GetMessageServlet
 */
@WebServlet("/jsp/getmessage")
public class GetMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user=(User) request.getSession().getAttribute("user");
		DepartmentMapper departmentMapper=new DepartmentMapperImpl();
		List<Department> departments=departmentMapper.selectAll();
		//将病例存入session
		AccountMapper accountMapper=new AccountMapperImpl();
		List<Account> accounts=accountMapper.selectByUser(user.getId());
		request.getSession().setAttribute("accounts", accounts);
		List<Doctor> accountDoctors=new ArrayList<Doctor>();
		List<Department> accountDepartments=new ArrayList<Department>();
		for (Account account : accounts) {
			DoctorMapper doctorMapper=new DoctorMapperImpl();
			Doctor doctor=doctorMapper.selectByPrimaryKey(account.getDoctorId());
			accountDoctors.add(doctor);
			accountDepartments.add(departmentMapper.selectByPrimaryKey(doctor.getDepartmentId()));
		}
		//将病例的医生列表存入session
		request.getSession().setAttribute("accountDoctors", accountDoctors);
		//将病例的部门列表存入session
		request.getSession().setAttribute("accountDepartments", accountDepartments);
		//将科室存入session
		request.getSession().setAttribute("departments", departments );
		DoctorMapper doctorMapper=new DoctorMapperImpl();
		List<Doctor> doctors=doctorMapper.selectAll();
		String doctorsJson=JSON.toJSON(doctors).toString();
		//将医生存入session
		//json形式
		request.getSession().setAttribute("doctorList", doctors);
		//list对象形式
		request.getSession().setAttribute("doctors", doctorsJson);
		response.sendRedirect("index.jsp");
	}

}
