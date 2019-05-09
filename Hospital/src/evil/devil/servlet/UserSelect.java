package evil.devil.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.UserMapperImpl;
import evil.devil.entity.User;



/**
 * Servlet implementation class UserSelect
 */
@WebServlet("/jsp/UserSelect")
public class UserSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserSelect() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int pagesize=8;
		int count=0;
		int totalPage=0;
		List<User> allUsers=null;
		List<User> users=null;
		
		String selectmsg=(String) request.getParameter("selectmsg");
		int currentPage=request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
		String way=request.getParameter("way")==null?"all":request.getParameter("way");//如果传进来的way是空就是all
		if (way.equals("all")) {
			allUsers =new UserMapperImpl().selectAll();
		}
		else if (way.equals("name")) {//第二次来还是要传入way
			allUsers =new UserMapperImpl().getSelectByName(selectmsg);
			//模糊查询
		}else if (way.equals("gender")) {
			allUsers =new UserMapperImpl().getSelectByGender(selectmsg);
		}
		else if (way.equals("idcard")) {
			allUsers =new UserMapperImpl().getSelectByIdcard(selectmsg);
		}
		else if (way.equals("tel")) {
			allUsers =new UserMapperImpl().getSelectByPhone(selectmsg);
		}
		
		count=allUsers.size();
		if (count!=0) {
			totalPage=count%pagesize==0?count/pagesize:count/pagesize+1;
			users=new UserMapperImpl().getPage(pagesize,currentPage,totalPage,allUsers);
			System.err.println("totalPage"+totalPage);
				//List<Student> list= 传入一个当前页面和size
				request.getSession().setAttribute("allUsers", allUsers);
				request.getSession().setAttribute("users", users);
				request.getSession().setAttribute("pagesize", pagesize);
				request.getSession().setAttribute("pageIndex", currentPage);
				request.getSession().setAttribute("totalPage", totalPage);
				response.getWriter().append("查询成功");
		}else {
			response.getWriter().append("查询结果为空");
		}
		if (request.getParameter("way")==null) {
			request.getRequestDispatcher("UserManegeMain.jsp").forward(request, response);
		}
			
	}

}
