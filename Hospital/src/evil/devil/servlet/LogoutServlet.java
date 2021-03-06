package evil.devil.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.entity.User;
import evil.devil.servcie.impl.UserServiceImpl;
import evil.devil.service.UserService;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/jsp/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
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
		//退出登录删除user在session存的值
		if(request.getSession().getAttribute("user")!=null) {
			User user=(User) request.getSession().getAttribute("user");
			user.setType(0);
			UserService userService=new UserServiceImpl();
			userService.Update(user);
			request.getSession().removeAttribute("user");
			HashMap<Integer, String> map=(HashMap<Integer, String>) request.getServletContext().getAttribute("UserSession");
			map.remove(user.getId());
			request.getServletContext().setAttribute("UserSession", map);
			request.getSession().removeAttribute("LonginType");
		}
		else {
			request.getSession().removeAttribute("admin");
		}
		response.sendRedirect("login.jsp");
	}

}
