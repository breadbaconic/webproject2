<%@page import="util.UserOperator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String username = (String)session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String type = request.getParameter("type");
    String uid = request.getParameter("uid");
    String f_uid = request.getParameter("f_uid");
    
    if (type.equals("0")) {
    	UserOperator.doFriend(f_uid, uid, false);
    } else {
        UserOperator.doFriend(f_uid, uid, true);
    }
    response.sendRedirect("main.jsp?type=other&userid=" + uid);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>