<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="util.*"%>

<%
    String username = (String)session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    ArrayList<Letter> letters = UserOperator.getLetters(username);
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>注册 - 注目微博</title>
<link rel="stylesheet" type="text/css" href="project1.css" />
<script src="jquery.js"></script>
<script src="project1.js"></script>
</head>

<body>
<header class="mid"> <img src="image/nlogo2.png" alt="logo" /> </header>
<section class="contant mid bubble">
  <div class="rectangle">
    <h2>站 内 信</h2>
  </div>
  <div class="lettermain">
  	<p class="regtitle">发信：</p>
    <form action="SendLetter" method="post" class="regform" >
        <fieldset>
          <div class="regitem">
            <label for="receiver" class="reglabel">收件人ID：</label>
            <input type="text" id="receiver" name="receiver" class="reginput" />
          </div>
          <div class="regitem">
            <label for="title" class="reglabel">题 目：</label>
            <input type="text" id="title" name="title" class="reginput" />
          </div>
          <div class="regitem">
            <label for="content" class="reglabel">内 容：</label>
            <input type="text" id="content" name="content" class="reginput" />
          </div>
          <input type="text" name="sender" value="<%=username%>" class="hidden" />
          <input type="submit" value="发 送" class="regconfirm whitebutton button" />
       </fieldset>
    </form>
    <table border="1" class="lettertable">
    <tr>
    	<th class="sender">发件人</th>
    	<th class="lettertitle">题目</th>
        <th class="lettercontent">内容</th>
    </tr>
    <tr class="<%=letters.get(0).getIsRead() ? "" : "notread"%>">
    	<td class="sender" title="<%=letters.get(0).getSendernickname() %>"><%=letters.get(0).getSendernickname() %></td>
    	<td class="lettertitle" title="<%=letters.get(0).getTitle() %>"><%=letters.get(0).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(0).getContent() %>"><%=letters.get(0).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(1).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(1).getSendernickname() %>"><%=letters.get(1).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(1).getTitle() %>"><%=letters.get(1).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(1).getContent() %>"><%=letters.get(1).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(2).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(2).getSendernickname() %>"><%=letters.get(2).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(2).getTitle() %>"><%=letters.get(2).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(2).getContent() %>"><%=letters.get(2).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(3).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(3).getSendernickname() %>"><%=letters.get(3).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(3).getTitle() %>"><%=letters.get(3).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(3).getContent() %>"><%=letters.get(3).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(4).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(4).getSendernickname() %>"><%=letters.get(4).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(4).getTitle() %>"><%=letters.get(4).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(4).getContent() %>"><%=letters.get(4).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(5).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(5).getSendernickname() %>"><%=letters.get(5).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(5).getTitle() %>"><%=letters.get(5).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(5).getContent() %>"><%=letters.get(5).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(6).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(6).getSendernickname() %>"><%=letters.get(6).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(6).getTitle() %>"><%=letters.get(6).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(6).getContent() %>"><%=letters.get(6).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(7).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(7).getSendernickname() %>"><%=letters.get(7).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(7).getTitle() %>"><%=letters.get(7).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(7).getContent() %>"><%=letters.get(7).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(8).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(8).getSendernickname() %>"><%=letters.get(8).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(8).getTitle() %>"><%=letters.get(8).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(8).getContent() %>"><%=letters.get(8).getContent() %></td>
    </tr>
    <tr class="<%=letters.get(9).getIsRead() ? "" : "notread"%>">
        <td class="sender" title="<%=letters.get(9).getSendernickname() %>"><%=letters.get(9).getSendernickname() %></td>
        <td class="lettertitle" title="<%=letters.get(9).getTitle() %>"><%=letters.get(9).getTitle()%></td>
        <td class="lettercontent" title="<%=letters.get(9).getContent() %>"><%=letters.get(9).getContent() %></td>
    </tr>
    
    </table>
  </div>
  <button class="loginbutton bluebutton button" id="myhome">返 回</button>
</section>
<footer class="mid"> <a target="_blank" href="login.jsp">注目</a> | <a target="_blank" href="login.jsp">版权申明</a> | <a target="_blank" href="login.jsp">联系我们</a> | <a target="_blank" href="login.jsp">意见反馈</a> <br />
  Copyright © 2013 VIEW. All Rights Reserved </footer>
</body>
</html>