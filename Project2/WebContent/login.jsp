<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="util.*,java.util.*"%>

<%
    ArrayList<Person> newComers = UserOperator.getNewComers();
    ArrayList<Person> hots = UserOperator.getHot();
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>注目！- 妹子们来啦~~</title>
<link rel="stylesheet" type="text/css" href="project1.css" />
<script src="jquery.js"></script>
<script src="project1.js"></script>
</head>

<body>
<header class="mid"> <img src="image/nlogo2.png" alt="logo" /> </header>
<section class="contant mid">
  <div class="slogan">
    <div class="sloganpic"> <img src="image/slogan.jpg" alt="slogan" />
      <div class="loginbg">
        <button class="regbutton orangebutton button" onClick="clickReg()">立即加入注目</button>
        <div class="logintable">
          <div class="hinttip">登陆微博：</div>
          <form action="CheckLogin" method="post" onSubmit="return checkLogin()">
            <input class="logintxt" type="text" name="username" value="" placeholder="输入账号" id="usernametxt" autofocus />
            <br />
            <input class="logintxt" type="password" name="password" value="" placeholder="输入密码" id="passwordtxt" />
            <br />
            <input class="loginbutton bluebutton button" type="submit" value="登 录" id="login"/>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="main">
    <div class="reuser">
      <div class="title">
        <h3>最近加入：</h3>
      </div>
      <div class="reuserlist">
        <div class="reuserli" title="<%=newComers.get(0).getNickname()%>" id="<%=newComers.get(0).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(0).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(0).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(1).getNickname()%>" id="<%=newComers.get(1).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(1).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(1).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(2).getNickname()%>" id="<%=newComers.get(2).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(2).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(2).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(3).getNickname()%>" id="<%=newComers.get(3).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(3).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(3).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(4).getNickname()%>" id="<%=newComers.get(4).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(4).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(4).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(5).getNickname()%>" id="<%=newComers.get(5).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(5).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(5).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(6).getNickname()%>" id="<%=newComers.get(6).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(6).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(6).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(7).getNickname()%>" id="<%=newComers.get(7).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(7).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(7).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(8).getNickname()%>" id="<%=newComers.get(8).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(8).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(8).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(9).getNickname()%>" id="<%=newComers.get(9).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(9).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(9).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(10).getNickname()%>" id="<%=newComers.get(10).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(10).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(10).getNickname()%></div>
        </div>
        <div class="reuserli" title="<%=newComers.get(11).getNickname()%>" id="<%=newComers.get(11).getId()%>">
          <div class="reuserimg"> <img src="<%=newComers.get(11).getImage()%>" alt="face" /> </div>
          <div class="reusername"><%=newComers.get(11).getNickname()%></div>
        </div>
      </div>
      <p class="warning">根据<a href="http://news.ifeng.com/mainland/detail_2012_12/28/20637181_0.shtml">《全国人大常委会关于加强网络信息保护的决定》</a>要求，3月16日起未通过真实身份验证的用户将仅能使用浏览功能。</p>
    </div>
    <div class="collect">
      <div class="title">
        <h3>注目精选：</h3>
      </div>
      <div class="weiboco">
        <div class="weibocoimg"> <img src="face/10.jpg" alt="face"> </div>
        <p class="content"><b class="weiname">BigFly</b> 【民政部副部长：各地将建妇女儿童保护中心】全国政协委员、民政部副部长姜力透露，各地要建立儿童保护中心和妇女保护中心</p>
        <p class="subcontent weiname">15分钟前</p>
      </div>
      <div class="weiboco">
        <div class="weibocoimg"> <img src="face/12.jpg" alt="face"> </div>
        <p class="content"><b class="weiname">MornJ</b> 【张明森委员谈雾霾：细微颗粒的罪魁祸首是油还是煤？】全国政协委员、中国石化北京化工研究院副总工程师张明森委说道</p>
        <p class="subcontent weiname">22分钟前</p>
      </div>
      <div class="weiboco">
        <div class="weibocoimg"> <img src="face/13.jpg" alt="face"> </div>
        <p class="content"><b class="weiname">RP</b> 【宗庆后：北漂者应该回到家乡去 在那更容易受尊重】谈及80后北漂者该如何做出人生选择时，全国人大代表、哇哈哈集团董事长说道</p>
        <p class="subcontent weiname">28分钟前</p>
      </div>
      <div class="weiboco">
        <div class="weibocoimg"> <img src="face/9.jpg" alt="face"> </div>
        <p class="content"><b class="weiname">Espie</b> 【Siri等虚拟助理会走向何方？】Siri，这个嗓音甜美的虚拟助手已伴随iPhone融入到了许多人的生活中。虽然任务引擎可以变得很好</p>
        <p class="subcontent weiname">35分钟前</p>
      </div>
    </div>
    <div class="rank">
      <div class="title">
        <div class="subtitle">粉丝数</div>
        <h3>热门用户：</h3>
      </div>
      <ol class="topuser">
        <li class="firstclass" id="<%=hots.get(0).getId()%>"> <i class="number "><%=hots.get(0).getListenerNumber()%></i> <b class="name" title="<%=hots.get(0).getNickname()%>"><%=hots.get(0).getNickname()%></b> </li>
        <li class="firstclass" id="<%=hots.get(1).getId()%>"> <i class="number "><%=hots.get(1).getListenerNumber()%></i> <b class="name" title="<%=hots.get(1).getNickname()%>"><%=hots.get(1).getNickname()%></b> </li>
        <li class="firstclass" id="<%=hots.get(2).getId()%>"> <i class="number "><%=hots.get(2).getListenerNumber()%></i> <b class="name" title="<%=hots.get(2).getNickname()%>"><%=hots.get(2).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(3).getId()%>"> <i class="number "><%=hots.get(3).getListenerNumber()%></i> <b class="name" title="<%=hots.get(3).getNickname()%>"><%=hots.get(3).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(4).getId()%>"> <i class="number "><%=hots.get(4).getListenerNumber()%></i> <b class="name" title="<%=hots.get(4).getNickname()%>"><%=hots.get(4).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(5).getId()%>"> <i class="number "><%=hots.get(5).getListenerNumber()%></i> <b class="name" title="<%=hots.get(5).getNickname()%>"><%=hots.get(5).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(6).getId()%>"> <i class="number "><%=hots.get(6).getListenerNumber()%></i> <b class="name" title="<%=hots.get(6).getNickname()%>"><%=hots.get(6).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(7).getId()%>"> <i class="number "><%=hots.get(7).getListenerNumber()%></i> <b class="name" title="<%=hots.get(7).getNickname()%>"><%=hots.get(7).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(8).getId()%>"> <i class="number "><%=hots.get(8).getListenerNumber()%></i> <b class="name" title="<%=hots.get(8).getNickname()%>"><%=hots.get(8).getNickname()%></b> </li>
        <li class="secondclass" id="<%=hots.get(9).getId()%>"> <i class="number "><%=hots.get(9).getListenerNumber()%></i> <b class="name" title="<%=hots.get(9).getNickname()%>"><%=hots.get(9).getNickname()%></b> </li>
      </ol>
    </div>
  </div>
</section>
<footer class="mid"> <a target="_blank" href="login.jsp">注目</a> | <a target="_blank" href="login.jsp">版权申明</a> | <a target="_blank" href="login.jsp">联系我们</a> | <a target="_blank" href="login.jsp">意见反馈</a> <br />
  Copyright © 2013 VIEW. All Rights Reserved </footer>
</body>
</html>