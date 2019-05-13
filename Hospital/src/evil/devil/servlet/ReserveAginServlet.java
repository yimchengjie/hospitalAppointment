package evil.devil.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.print.Doc;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import evil.devil.dao.DoctorMapper;
import evil.devil.dao.impl.DoctorMapperImpl;
import evil.devil.entity.Doctor;

/**
 * Servlet implementation class ResrveAginServlet
 */
@WebServlet("/jsp/reserveAgin")
public class ReserveAginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveAginServlet() {
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
		//获取再次预约的科室和医生
		String department=request.getParameter("department");
		String doctor=request.getParameter("doctor");
		List<String> list=new ArrayList<String>();
		//将信息存入list转换成json格式传回ajax
		list.add(department);
		list.add(doctor);
		DoctorMapper mapper=new DoctorMapperImpl();
		List<Doctor> doctors=mapper.selectAll();
		for (Doctor doctor2 : doctors) {
			if(doctor2.getName().equals(doctor))
				list.add(doctor2.getPrice().toString());
		}
		response.setHeader("content-type","text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String message=JSON.toJSON(list).toString();
		response.getWriter().append(message);
	}

}
