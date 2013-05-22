package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.UserOperator;

/**
 * Servlet implementation class SendLetter
 */
@WebServlet("/SendLetter")
public class SendLetter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			request.setCharacterEncoding("UTF-8");
			String sendername = request.getParameter("sender");
			Person sender = UserOperator.getPeople(sendername, false);
			String senderid = sender.getId() + "";
			String sendernickname = sender.getNickname();
			String receiverid = request.getParameter("receiver");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			if (UserOperator.sendLetter(senderid, receiverid, title, content, sendernickname))
				out.print("<script>alert('信件已发送!');document.location.href='letter.jsp'</script>");
			else {
				out.print("<script>alert('信件发送失败!');document.location.href='letter.jsp'</script>");	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
