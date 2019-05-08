package evil.devil.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.AccountMapperImpl;
import evil.devil.dao.impl.UserMapperImpl;
import evil.devil.entity.Account;
import evil.devil.entity.User;

/**
 * Servlet implementation class PageServlet
 */
@WebServlet("/jsp/PageServlet")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag=request.getParameter("for");
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int totalPage=(int)request.getSession().getAttribute("totalPage");
		int pagesize=(int)request.getSession().getAttribute("pagesize");
		
		if (flag==null||flag=="") {
			List<User> allUsers=(List<User>) request.getSession().getAttribute("allUsers");//得到所有的
			List<User>  users=new UserMapperImpl().getPage(pagesize, pageIndex,totalPage,allUsers);
			request.getSession().setAttribute("users", users);
			request.getSession().setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("UserManegeMain.jsp").forward(request, response);
		}else if (flag.equals("account")) {
			List<Account> allAccounts=(List<Account>) request.getSession().getAttribute("allAccounts");//得到所有的
			List<Account>  accounts=new AccountMapperImpl().getPage(pagesize, pageIndex,totalPage,allAccounts);
			request.getSession().setAttribute("accounts", accounts);
			request.getSession().setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("accountManegeMain.jsp").forward(request, response);
		}
		
	
		
	
	}

}
