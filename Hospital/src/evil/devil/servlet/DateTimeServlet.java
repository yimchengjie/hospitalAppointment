package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import evil.devil.dao.AccountMapper;
import evil.devil.dao.impl.AccountMapperImpl;
import evil.devil.entity.Account;

/**
 * Servlet implementation class DateTimeServlet
 */
@WebServlet("/datetime")
public class DateTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DateTimeServlet() {
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
		String date=request.getParameter("date");
		AccountMapper accountMapper=new AccountMapperImpl();
		List<Account> accounts=accountMapper.selectByDoctor(id);
		List<String> list=new ArrayList<String>();
		
		for (Account account : accounts) {
			if(date.equals(account.getDateTime().split(" ")[0])) {
			if(account.getDateTime().split(" ")[1].substring(0,1).equals("1"))
					list.add(account.getDateTime().split(" ")[1].substring(0,2));
			else
				list.add(account.getDateTime().split(" ")[1].substring(0,1));
			}
		}
		String message=JSON.toJSON(list).toString();
		request.getSession().setAttribute("doctorid", id);
		response.getWriter().append(message);
	}

}
