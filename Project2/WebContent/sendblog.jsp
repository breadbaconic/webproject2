<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.*"%>
<%@ page import="util.*"%>

<%
    String username = (String)session.getAttribute("username");
    if (username == null) {
    	response.sendRedirect("login.jsp");
        return;
    }
    
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String content = request.getParameter("content");
    
    UserOperator.sendBlog(userid, content);
    
    response.sendRedirect("main.jsp?type=home");
    
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blog Sending...</title>
</head>
<body>

</body>
</html>