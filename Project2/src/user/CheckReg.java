package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.UserOperator;

/**
 * Servlet implementation class checkreg
 */
@WebServlet("/checkreg")
public class CheckReg extends HttpServlet {

	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		try {
			if (UserOperator.isExistName(username)) {
				out.print("<script>alert('用户名已存在!');document.location.href='register.jsp'</script>");
			} else {
				UserOperator.storeUser(request.getParameter("username"),
						request.getParameter("nickname"),
						request.getParameter("password"),
						request.getParameter("comefrom"));
				out.print("<script>alert('注册成功!');document.location.href='login.jsp'</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
