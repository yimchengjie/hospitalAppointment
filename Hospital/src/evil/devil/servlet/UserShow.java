package evil.devil.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.UserMapperImpl;
import evil.devil.entity.User;



@WebServlet("/UserShow")
public class UserShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UserShow() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int pagesize=8;
		String pageIndex=request.getParameter("pageIndex");//null
		int currentPage=pageIndex==null?1:Integer.parseInt(pageIndex);
		int count =new UserMapperImpl().getAllCount();//总数
		int totalPage=count%pagesize==0?count/pagesize:count/pagesize+1;
			//List<Student> list= 传入一个当前页面和size
			List<User> usersall=new UserMapperImpl().selectAll();
			List<User> users=new UserMapperImpl().getPage(pagesize, currentPage,totalPage,usersall);
			request.setAttribute("users", users);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("totalPage", totalPage);//设置total
			request.getRequestDispatcher("UserManegeMain.jsp").forward(request, response);
	}

}
