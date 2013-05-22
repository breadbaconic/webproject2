<%@page import="org.lxh.smart.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="util.*,java.util.*, org.lxh.servlet.*, org.lxh.smart.*, java.io.*"%>

<%
    String username = (String)session.getAttribute("username");
    if (username == null) {
        out.print("<script>window.close();</script>");
        return;
    }
    request.setCharacterEncoding("UTF-8");
    long size = 5 * 1024 * 1024;
    String fileType = "jpg,gif,JPG,png,jpeg";
    String imgName = "";
    String filePath = "";
    
    String path ="/Users/sb/Documents/workspace/Project2/WebContent/face/";
    
    SmartUpload su = new SmartUpload();
    su.initialize(pageContext);
    su.setMaxFileSize(size);
    su.setAllowedFilesList(fileType);
   
    try { 
	    su.upload();
	    
	    File upFile = su.getFiles().getFile(0);
	    
	    if (upFile.isMissing()) {
	        out.print("上传失败！");
	    	return;
	    }
	    
	    String ext = upFile.getFileExt();
	    
	    Calendar calendar = Calendar.getInstance();  
	    imgName = String.valueOf(calendar.getTimeInMillis());
	    
	    imgName = imgName + "." + ext;
	    path = path + imgName;
	    upFile.saveAs(path);
	    
	    
	    UserOperator.uploadImage(username, "face/" + imgName);
	    
	    out.print("上传成功！");
    
    } catch (Exception e){  
        out.print("上传失败！");
    }
    
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content=" charset=UTF-8">
<title>image uploading</title>
</head>
<body>

</body>
</html>