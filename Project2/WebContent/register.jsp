<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="util.*"%>

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
    <h2>想找妹纸？立即加入注目！</h2>
  </div>
  <div class="regmain">
    <div class="regcontent">
      <p class="regtitle">请填写下列信息：</p>
      <form action="checkreg" method="post" class="regform" onSubmit="return checkRegister()">
        <fieldset>
          <div class="regitem">
            <label for="username" class="reglabel">账 号：</label>
            <input type="text" id="username" name="username" class="reginput" onBlur="checkUsrname()" />
            <b class="regwarning"></b> </div>
          <div class="regitem">
            <label for="nickname" class="reglabel">昵 称：</label>
            <input type="text" id="nickname" name="nickname" class="reginput" onBlur="checkNickname()" />
            <b class="regwarning"></b> </div>
          <div class="regitem">
            <label for="pass" class="reglabel">密 码：</label>
            <input type="password" id="pass" name="password" class="reginput" onBlur="checkPassword1()" />
            <b class="regwarning"></b> </div>
          <div class="regitem">
            <label for="repass" class="reglabel">确认密码：</label>
            <input type="password" id="repass" class="reginput" onBlur="checkPassword2()"/>
            <b class="regwarning"></b> </div>
          <div class="regitem">
            <label for="come" class="reglabel">您来自：</label>
            <input type="text" id="come" name="comefrom" class="reginput" onBlur="checkCome()" />
            <b class="regwarning"></b> </div>
          <div class="regitem">
            <label for="tname" class="reglabel">真实姓名：</label>
            <input type="text" id="tname" class="reginput" onBlur="checkName()" />
            <b class="regwarning"></b> </div>
          <div class="regitem">
            <label for="cardnum" class="reglabel">身份证号：</label>
            <input type="text" id="cardnum" class="reginput" onBlur="checkID()" />
            <b class="regwarning"></b> </div>
          <input type="submit" value="注 册" class="regconfirm whitebutton button" />
        </fieldset>
      </form>
    </div>
    <aside><div class="loghint">
      <p class="regtitle">已有注目账号？</p>
      <button class="loginbutton bluebutton button" onClick="clickLogin()">登 录</button>
      <p class="warning">根据<a href="http://news.ifeng.com/mainland/detail_2012_12/28/20637181_0.shtml">《全国人大常委会关于加强网络信息保护的决定》</a>要求，3月16日起未通过真实身份验证的用户将仅能使用浏览功能。<strong>请用户务必填写真实的身份信息!</strong></p>
      </div>
    </aside>
  </div>
</section>
<footer class="mid"> <a target="_blank" href="login.jsp">注目</a> | <a target="_blank" href="login.jsp">版权申明</a> | <a target="_blank" href="login.jsp">联系我们</a> | <a target="_blank" href="login.jsp">意见反馈</a> <br />
  Copyright © 2013 VIEW. All Rights Reserved </footer>
</body>
</html>