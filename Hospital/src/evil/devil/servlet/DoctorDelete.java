package evil.devil.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import evil.devil.dao.impl.DoctorMapperImpl;

/**
 * Servlet implementation class DoctorDelete
 */
@WebServlet("/jsp/DoctorDelete")
public class DoctorDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoctorDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		int id=Integer.parseInt(request.getParameter("id"));
		int flag=new DoctorMapperImpl().deleteByPrimaryKey(id);
		String data="删除失败";
		if (flag==1) {
			data="删除成功";
		}
		response.getWriter().append(data);
		
	}

}
