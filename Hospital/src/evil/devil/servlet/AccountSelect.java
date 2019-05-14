package evil.devil.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.AccountMapperImpl;
import evil.devil.entity.Account;
import evil.devil.entity.User;

/**
 * Servlet implementation class AccountSelect
 */
@WebServlet("/jsp/AccountSelect")
public class AccountSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountSelect() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int pagesize=8;
		int count=0;
		int totalPage=0;
		List<Account> allAccounts=null;
		List<Account> accounts=null;
		
		String selectmsg=(String) request.getParameter("selectmsg");
		int currentPage=request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
		String way=request.getParameter("way")==null?"all":request.getParameter("way");//如果传进来的way是空就是all
		if (way.equals("all")) {
			allAccounts =new AccountMapperImpl().selectAll();
		}
		else if (way.equals("userid")) {
			allAccounts = new AccountMapperImpl().selectByUser(Integer.parseInt(selectmsg));
			for (Account account : allAccounts) {
				System.err.println(account);
			}
			
		}else if (way.equals("doctorid")) {
			allAccounts =new AccountMapperImpl().selectByDoctor(Integer.parseInt(selectmsg));
		}
		else if (way.equals("accounttime")) {
			allAccounts =new AccountMapperImpl().getSelectByAccounttime(selectmsg);
		}
		else if (way.equals("datetime")) {
			allAccounts =new AccountMapperImpl().getSelectByDatetime(selectmsg);//挑选某一日的
		}
		
		count=allAccounts.size();
		if (count!=0) {
			totalPage=count%pagesize==0?count/pagesize:count/pagesize+1;
			accounts=new AccountMapperImpl().getPage(pagesize,currentPage,totalPage,allAccounts);
				//List<Student> list= 传入一个当前页面和size
				request.getSession().setAttribute("allAccounts", allAccounts);
				request.getSession().setAttribute("accounts", accounts);
				request.getSession().setAttribute("pagesize", pagesize);
				request.getSession().setAttribute("pageIndex", currentPage);
				request.getSession().setAttribute("totalPage", totalPage);
				response.getWriter().append("查询成功");
				
		}else {
				response.getWriter().append("查询结果为空");
		}
		if (request.getParameter("way")==null) {
			request.getRequestDispatcher("accountManegeMain.jsp").forward(request, response);
		}
		
	
	}

}
