package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UsersDAO;
import model.Users;

/**
 * Servlet implementation class Doimatkhau
 */
@WebServlet("/Doimatkhau")
public class Doimatkhau extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Doimatkhau() {
		super();
		// TODO Auto-generated constructor stub
	}

	UsersDAO usersDAO = new UsersDAO();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		Users users = new Users();
		String newpass = request.getParameter("newpass");
		String currentpass = request.getParameter("currentpass");
		String cofirmpass = request.getParameter("confirmpass");
		String username=request.getParameter("username");
		try {
			users=usersDAO.getUsers(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pass=users.getPassword();
		if (currentpass.equals(pass)) {
			if (newpass.equals(cofirmpass)) 
			{
				if(!currentpass.equals(newpass))		
				{
				users.setUserName(username);
				users.setPassword(newpass);
				usersDAO.updatePass(users);
				if (users != null) 
				{
					response.sendRedirect("/ExamOnline/Login.jsp");
				}
				}
				else{
					try (PrintWriter out = response.getWriter()) {
	                    /* TODO output your page here. You may use following sample code. */
	                    out.println("<html>");
	                    out.println("<head>");
	                    out.println("<title>Thông báo</title>");
	                    out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/bootstrap/css/bootstrap.min.css\">");
	                    out.println("</head>");
	                    out.println("<body>");
	                    out.println("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
	                            + ">Mật khẩu mới không được trùng mật khẩu cũ, vui lòng nhấn <a href=\"Doimatkhau.jsp?UserName="+username+"\">vào đây</a> để tiếp tục hoặc <a href=\"index.jsp\">Trang chủ</a> để quay về trang chủ</div>");
	                    out.println("</body>");
	                    out.println("</html>");
	                }
					}
					
			}
			else{
				try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Thông báo</title>");
                    out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/bootstrap/css/bootstrap.min.css\">");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                            + ">Xác nhận mật khẩu không đúng, vui lòng nhấn <a href=\"Doimatkhau.jsp?UserName="+username+"\">vào đây</a> để tiếp tục hoặc <a href=\"index.jsp\">Trang chủ</a> để quay về trang chủ</div>");
                    out.println("</body>");
                    out.println("</html>");
                }
			}
		}
		else
		{
			try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Thông báo</title>");
                out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/bootstrap/css/bootstrap.min.css\">");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                        + ">Mật khẩu không đúng, vui lòng nhấn <a href=\"Doimatkhau.jsp?UserName="+username+"\">vào đây</a> và tiếp tục hoặc <a href=\"index.jsp\">Trang chủ</a> để quay về trang chủ</div>");
                out.println("</body>");
                out.println("</html>");
            }
		}
	
	}
}
