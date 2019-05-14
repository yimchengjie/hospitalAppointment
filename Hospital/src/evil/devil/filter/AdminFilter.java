package evil.devil.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter(
		urlPatterns = { "/jsp/accountManegeMain.jsp",
				"/jsp/departManegeMain.jsp",
				"/jsp/doctorDetailManegement.jsp", 
				"/jsp/doctorManegement.jsp" ,
				"/jsp/UserManegeMain.jsp",
				"/jsp/addDoctor.jsp",
				"/jsp/DepartSelect",
				"/jsp/AccountSelect",
				"/jsp/DoctorEditAdd",
				"/jsp/DoctorSelect",
				"/jsp/UserSelect",
				"/jsp/UserShow"
		}  
		)
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
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
		HttpServletRequest req=(HttpServletRequest) request;
		System.out.println("hahahh");
			if(req.getSession().getAttribute("admin")==null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else {
				chain.doFilter(request, response);
			}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
