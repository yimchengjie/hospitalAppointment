package evil.devil.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.entity.Account;
import evil.devil.entity.User;
import evil.devil.servcie.impl.AccountServiceImpl;
import evil.devil.service.AccountService;

/**
 * Servlet implementation class ReserveServlet
 */
@WebServlet("/reserve")
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
		//System.out.println(name+" "+tel +" "+ doctor_id +" "+date_time);
		Account account=new Account();
		account.setDateTime(date_time);
		account.setDoctorId(doctor_id);
		User user=(User) request.getSession().getAttribute("user");
		account.setUserId(user.getId());
		AccountService accountService=new AccountServiceImpl();
		int flag=accountService.Reserve(account);
		if(flag==1)
			response.getWriter().append("success");
		else
			response.getWriter().append("error");	
	}

}
