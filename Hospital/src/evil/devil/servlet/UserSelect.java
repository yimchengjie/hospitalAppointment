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
@WebServlet("/UserSelect")
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
		List<User> users=null;
		String selectmsg=(String) request.getParameter("selectmsg");
		
		System.out.println("-----"+selectmsg);
		int currentPage=request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
		String way=request.getParameter("way")==null?"all":request.getParameter("way");//如果传进来的way是空就是all
		if (way.equals("all")) {
			users =new UserMapperImpl().selectAll();
		}
		else if (way.equals("name")) {//第二次来还是要传入way
			users =new UserMapperImpl().getSelectByName(selectmsg);
			//模糊查询
		}else if (way.equals("gender")) {
			users =new UserMapperImpl().getSelectByGender(selectmsg);
		}
		else if (way.equals("idcard")) {
			users =new UserMapperImpl().getSelectByGender(selectmsg);
		}
		else if (way.equals("phone")) {
			users =new UserMapperImpl().getSelectByGender(selectmsg);
		}
		
		for (User user : users) {
			System.out.println(user);
		}
		System.out.println("currentPage"+currentPage);
		count =users.size();//users
		System.out.println("count"+count);
		totalPage=count%pagesize==0?count/pagesize:count/pagesize+1;
		System.out.println("totalPage"+totalPage);
		users=new UserMapperImpl().getPage(pagesize, currentPage,totalPage,users);
		
			//List<Student> list= 传入一个当前页面和size
			request.setAttribute("users", users);
			request.setAttribute("pageIndex", currentPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("way", way);
			request.setAttribute("selectmsg", selectmsg);
//			request.getRequestDispatcher("jsp/UserManegeMain.jsp").forward(request, response);
			
			
			
			
	}

}
