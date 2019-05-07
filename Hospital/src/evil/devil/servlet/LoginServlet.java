package evil.devil.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.entity.Admin;
import evil.devil.entity.User;
import evil.devil.servcie.impl.AdminServiceImpl;
import evil.devil.servcie.impl.UserServiceImpl;
import evil.devil.service.AdminService;
import evil.devil.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/jsp/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置页面编码格式
		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String type=request.getParameter("type");
		System.out.println(username+"\t"+password);
		if(type.equals("user")) {
			UserService usrservice=new UserServiceImpl();
			User user=usrservice.Login(Long.parseLong(username), password);
			if(user!=null) {
				request.getSession().setAttribute("user", user );
				response.getWriter().append("success");
			}
			else {
				response.getWriter().append("error");
			}
		}
		else if(type.equals("admin")) {
			AdminService adminService=new AdminServiceImpl();
			Admin admin=adminService.Login(username, password);
			if(admin!=null) {
				request.getSession().setAttribute("admin", admin );
				response.getWriter().append("success");
			}
			else {
				response.getWriter().append("error");
			}
		}
		
			
	}

}
