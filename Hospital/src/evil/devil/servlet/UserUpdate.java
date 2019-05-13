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
 * Servlet implementation class UserUpdate
 */
@WebServlet("/jsp/update")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdate() {
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
		Integer id=Integer.parseInt(request.getParameter("id"));
		String username=request.getParameter("username");
		String password=request.getParameter("userpwd");
		String gender=request.getParameter("gender");
		String idcard=request.getParameter("idcard");
		Long tel=Long.parseLong(request.getParameter("tel"));
		User user=new User();
		user.setGender(gender);
		user.setName(username);
		user.setIdcard(idcard);
		user.setTel(tel);
		user.setPassword(password);
		user.setType(0);
		user.setId(id);
		System.out.println(username);
		UserService userService=new UserServiceImpl();
		int flag=userService.Update(user);
		if(flag==1) {
			request.getSession().setAttribute("user", user);
			response.getWriter().append("success");
		}
		else if(flag==-1)
			//身份证号已注册
			response.getWriter().append("erroridcard");
		else if(flag==-2)
			//手机号已注册
			response.getWriter().append("errortel");
	}

}
