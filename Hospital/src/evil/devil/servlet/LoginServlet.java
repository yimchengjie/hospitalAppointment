package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import evil.devil.entity.Admin;
import evil.devil.entity.Department;
import evil.devil.entity.Doctor;
import evil.devil.entity.User;
import evil.devil.listener.UserOnlineListener;
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
		//普通用户登录
		if(type.equals("user")) {
			UserService userService=new UserServiceImpl();
			User user=userService.Login(Long.parseLong(username), password);
			if(user!=null) {
				if(user.getType()==1) {
					user.setType(0);
					userService.Update(user);
					response.getWriter().append("stateerror");
				}
				else {
					//把user存入session
					request.getSession().setAttribute("user", user );
					//用户登录状态监听
					UserOnlineListener userOnlineListener=new UserOnlineListener();
					userOnlineListener.setId(user.getId());
					HashMap<Integer, String> map=null;
					map=(HashMap<Integer, String>) request.getServletContext().getAttribute("UserSession");
					if(map==null) {
						map=new HashMap<Integer,String>();
					}
					map.put(user.getId(), request.getSession().getId());
					request.getServletContext().setAttribute("UserSession", map);
					request.getSession().setAttribute("LoginType", userOnlineListener );
					response.getWriter().append("success");
				}
			}
			else {
				response.getWriter().append("error");
			}
		}
		//管理员登录
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
