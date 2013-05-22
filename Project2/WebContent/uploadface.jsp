<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="util.*"%>

<%
    String username = (String)session.getAttribute("username");
    if (username == null) {
    	out.print("<script>window.close();</script>");
    	return;
    }
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="doUploadImage.jsp" encType=multipart/form-data method=post>
      <input type="file" name="path"/>
      <input type="submit" />
    </form>
</body>
</html>