package evil.devil.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import evil.devil.entity.User;

/**
 * Servlet Filter implementation class LoginFilter
 */

@WebFilter(
		urlPatterns = { "/jsp/index.jsp",
				"/jsp/contact.jsp",
				"/jsp/doctorDepartment.jsp", 
				"/jsp/gallery.jsp" ,
				"/jsp/services.jsp",
				"/jsp/about.jsp", 
				"/jsp/contact.jsp" ,
				"/jsp/update" ,
				"/jsp/datetime" ,
				"/jsp/reserveAgin" ,
				"/jsp/reserve" ,
				"/jsp/contact.jsp" 
		}  
		)
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		response.setContentType("text/html;charset=utf-8");
		HttpServletRequest req=(HttpServletRequest) request;
//		if(req.getParameter("username")!=null) {
//			chain.doFilter(request, response);
//		}
//		else {
		User user=(User) req.getSession().getAttribute("user");
		HashMap<Integer, String> map=(HashMap<Integer, String>) req.getServletContext().getAttribute("UserSession");
		if(map!=null) {
			if(map.get(user.getId()).equals(req.getSession().getId()) && user!=null) {
					chain.doFilter(request, response);
				}
				else {
					if(map==null||user==null) {
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
					else if(!map.get(user.getId()).equals(req.getSession().getId())) {
						PrintWriter out = response.getWriter();
						out.print("<script>alert('你的帐号在别处登录，请确认后重新登录！');window.location.href='login.jsp'</script>");
					}
				}
		}
		else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		//}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
