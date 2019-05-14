package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import evil.devil.servcie.impl.AccountServiceImpl;
import evil.devil.service.AccountService;

/**
 * Servlet implementation class ReserveServlet
 */
@WebServlet("/jsp/reserve")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveServlet() {
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
		String name=request.getParameter("name");
		Long tel=Long.parseLong(request.getParameter("tel"));
		Integer doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
		String date_time=request.getParameter("datetime");
		String pricestring =request.getParameter("price");
		Integer price=Integer.parseInt(pricestring.split("元")[0]);
		Integer paytype=Integer.parseInt(request.getParameter("paytype"));
		Account account=new Account();
		account.setPayType(paytype);
		account.setPrice(price);
		account.setDateTime(date_time);
		account.setDoctorId(doctor_id);
		User user=(User) request.getSession().getAttribute("user");
		account.setUserId(user.getId());
		AccountService accountService=new AccountServiceImpl();
		int flag=accountService.Reserve(account);
		if(flag==1) {
			//将病例存入session
			AccountMapper accountMapper=new AccountMapperImpl();
			DepartmentMapper departmentMapper=new DepartmentMapperImpl();
			List<Account> accounts=accountMapper.selectByUser(user.getId());
			request.getSession().setAttribute("accounts", accounts);
			//将病例的医生列表存入session
			List<Doctor> doctors=(List<Doctor>) request.getSession().getAttribute("accountDoctors");
			DoctorMapper doctorMapper=new DoctorMapperImpl();
			Doctor doctor= doctorMapper.selectByPrimaryKey(account.getDoctorId());
			doctors.add(doctor);
			request.getSession().setAttribute("accountDoctors", doctors);
			//将病例的部门列表存入session
			List<Department> departments=(List<Department>) request.getSession().getAttribute("accountDepartments");
			departments.add(departmentMapper.selectByPrimaryKey(doctor.getDepartmentId()));
			request.getSession().setAttribute("accountDepartments", departments);
			response.getWriter().append("success");
			
		}
		else
			response.getWriter().append("error");	
	}

}
