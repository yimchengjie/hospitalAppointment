package evil.devil.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import evil.devil.dao.impl.DoctorMapperImpl;
import evil.devil.entity.Doctor;
import evil.devil.servcie.impl.UserServiceImpl;
import evil.devil.service.UserService;

/**
 * Servlet implementation class DoctorEditAdd
 */
@WebServlet("/jsp/DoctorEditAdd")
public class DoctorEditAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoctorEditAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload fileUpdate = new ServletFileUpload(fileItemFactory);
		/* String path=this.getServletContext().getRealPath("/test"); */
		String path = "C:\\Users\\xieaichen\\git\\repository\\Hospital\\WebContent\\doctor";
		System.out.println(this.getServletContext().getContextPath());
		System.out.println(this.getServletContext().getRealPath("/test"));
		String name = "", type = "", gender = "", colleage = "", editoradd = "";
		String pathName = "";

		int id = 0, price = 0, depart = 0;

		Long tel = (long) 0;

		List<FileItem> list;
		try {
			list = fileUpdate.parseRequest(request);

			for (FileItem fileItem : list) {
				if (fileItem.isFormField()) {
					fileItem.getFieldName();// 字符串---转化成一个同名变量
					if ("name".equals(fileItem.getFieldName())) {
						name = fileItem.getString("utf-8");
						System.out.println(name);
					} else if ("id".equals(fileItem.getFieldName())) {
						id = Integer.parseInt(fileItem.getString("utf-8"));
						System.out.println(id);
					} else if ("type".equals(fileItem.getFieldName())) {
						type = fileItem.getString("utf-8");
					} else if ("gender".equals(fileItem.getFieldName())) {
						gender = fileItem.getString("utf-8");
					} else if ("depart".equals(fileItem.getFieldName())) {
						depart = Integer.parseInt(fileItem.getString("utf-8"));
					} else if ("colleage".equals(fileItem.getFieldName())) {
						colleage = fileItem.getString("utf-8");
					} else if ("editoradd".equals(fileItem.getFieldName())) {
						editoradd = fileItem.getString("utf-8");
					} else if ("price".equals(fileItem.getFieldName())) {
						price = Integer.parseInt(fileItem.getString("utf-8"));
						System.out.println(price);
					} else if ("tel".equals(fileItem.getFieldName())) {
						tel = Long.parseLong(fileItem.getString("utf-8"));
						System.out.println(tel);
					}

				} else {
					String fileName = fileItem.getName();
					if(fileName==null || "".equals(fileName)) {
						continue;
					}
					pathName = fileName.substring(fileName.lastIndexOf("\\") + 1);
					System.out.println(fileItem.getName());
					String pic1 = path + "\\" + pathName;
					System.out.println(pic1);// 存入的路径
					fileItem.write(new File(path, pathName));
					
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String data = "操作失败";
		int flag = -1;
		if (editoradd.equals("adddoctor")) {
			Doctor doctor = new Doctor(name, gender, depart, colleage, tel, type, price);
			doctor.setPhoto(pathName);
			System.out.println(doctor);
			flag = new DoctorMapperImpl().insert(doctor);
			if (flag == 1) {
				data = "操作成功";
			}
		} else if (editoradd.equals("updatedoctor")) {
			Doctor doctor = new Doctor(id, name, gender, depart, colleage, tel, type, price);
			doctor.setPhoto(pathName);
			System.out.println(doctor);
			flag = new DoctorMapperImpl().updateByPrimaryKey(doctor);
			if (flag == 1) {
				data = "操作成功";
			}
		}

		response.getWriter().append(data);
//				int flag = 0;
//				String date=flag==1?"注册成功":"注册失败";

	}
}
