package evil.devil.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.entity.User;
import evil.devil.servcie.impl.UserServiceImpl;
import evil.devil.service.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/jsp/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		String idcard=request.getParameter("idcard");
		Long tel=Long.parseLong(request.getParameter("tel"));
		UserService userService=new UserServiceImpl();
		int flag=userService.Register(username, password, idcard, tel, gender);
		if(flag==1)
			response.getWriter().append("success");
		else if(flag==-1)
			response.getWriter().append("erroridcard");
		else if(flag==-2)
			response.getWriter().append("errortel");
	}

}
