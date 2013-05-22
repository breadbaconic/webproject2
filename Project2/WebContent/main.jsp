<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%@ page import="util.*"%>


<%
	Person user = null;
	String title = "";
	String tag = "";
	String myHomeClass = " focus";
	String myPageClass = "";
	String squareClass = "";
	String addFriendClass = "hidden";
	String buttonTextString = "";
	boolean isFriend = true;
	String friendType = "";
	String letterString = "";

	String username = (String) session.getAttribute("username");
	String type = request.getParameter("type");
	if (username == null || type == null) {
		response.sendRedirect("login.jsp");
		return;
	}

	Person loginUser = UserOperator.getPeople(username, false);

	if (type.equals("home") || type.equals("afterlogin")) {
		user = loginUser;
		title = "我的首页 注目 - 妹子们来啦~";
		tag = "新 鲜 事";
		myHomeClass = " focus";
		myPageClass = "";
		squareClass = "";
		addFriendClass = "hidden";
	} else if (type.equals("my")) {
		user = loginUser;
		title = "我的微博 注目 - 妹子们来啦~";
		tag = "我的微博";
		myHomeClass = "";
		myPageClass = " focus";
        squareClass = "";
		addFriendClass = "hidden";
	} else if (type.equals("other")) {
		String otherid = request.getParameter("userid");
		user = UserOperator.getPeople(otherid, true);
		if (user.getUsername().equals(username)) {
			user = loginUser;
			title = "我的微博 注目 - 妹子们来啦~";
			tag = "我的微博";
			myHomeClass = "";
			myPageClass = " focus";
	        squareClass = "";
			addFriendClass = "hidden";
		} else {
			title = user.getUsername() + "的微博 注目 - 妹子们来啦~";
			tag = user.getUsername() + "的微博";
			myHomeClass = "";
			myPageClass = "";
	        squareClass = "";
			addFriendClass = "";
			isFriend = UserOperator.isFriend(loginUser.getId(),
					user.getId());
			if (isFriend) {
				friendType = "0";
				buttonTextString = "解除关注";
			} else {
				friendType = "1";
				buttonTextString = "添加关注";
			}
		}
	}

	ArrayList<Person> hots = UserOperator.getHot();

	if (UserOperator.hasUnreadLetter(loginUser.getId())
			&& type.equals("afterlogin")) {
		letterString = "<script>alert('您有未读邮件！');</script>";
	}
%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title%></title>
<link rel="stylesheet" type="text/css" href="project1.css" />
<script src="jquery.js"></script>
<script src="project1.js"></script>
<%=letterString%>
</head>

<body class="mainbody">
	<header class="mainheader">
		<div class="mid">
			<div class="headimg">
				<img src="image/minilogo.png" alt="logo" />
			</div>
			<a class="exit headlink" href="exit.jsp">退出</a> <a
				class="option headlink" href="letter.jsp">信件</a> <a
				class="username headlink" href="main.jsp?type=my"
				title="<%=loginUser.getNickname()%>"><%=loginUser.getNickname()%></a>
			<form action="#" method="get" class="search">
				<input type="text" name="search" placeholder="Search..."
					class="searchtxt" /> <input type="submit" class="searchbtn"
					value="" />
			</form>
		</div>
	</header>
	<section class="contant mid mainbubble">
		<div class="maintip">
			<h2>发条微博，引人注目！</h2>
		</div>
		<section class="weibg">
			<div class="writeboard">
				<form method="post" action="sendblog.jsp">
				    <input type="hidden" name="userid" value="<%=loginUser.getId()%>" />
					<textarea name="content" class="writearea" id="wbwrite" rows="4"
						onKeyDown="checkInCount()" onKeyUp="checkInCount()"
						onFocus="checkInCount()" onBlur="checkInCount()"></textarea>
					<div class="writefunc">
						<button class="writebtn button whitebutton" id="fabu">发
							布</button>
						<div class="wordcount" id="wordcount">
							还可输入 14<strong>6</strong> 字
						</div>
						<div class="writeac">音频</div>
						<div class="writeac">图片</div>
						<div class="writeac">视频</div>
					</div>
				</form>
			</div>
			<div class="mainweibg">
				<div class="maintitle">
					<h2><%=tag%></h2>
				</div>
				<div class="plainwei">
					<div class="weibocoimg">
						<img src="face/10.jpg" alt="face">
					</div>
					<div class="name">BigFly</div>
					<p class="content">热烈祝贺习近平当选为国家主席！</p>
					<div class="subcontent weiname">
						<div class="time">2013 - 3 - 14 21：05</div>
						<div class="origin">来自网页</div>
						<div class="comment">评论</div>
						<div class="comma">|</div>
						<div class="forward">转发</div>
					</div>
				</div>
				<div class="plainwei" id="123">
					<div class="weibocoimg">
						<img src="face/12.jpg" alt="face">
					</div>
					<div class="name">RP</div>
					<p class="content">喜欢的球员 斯通 马步里都来cba了 就差埃迪库里和斯卡拉布莱恩了 嗷嗷嗷嗷嗷嗷啊啊</p>
					<div class="subcontent weiname">
						<div class="time">2013 - 3 - 13 13：05</div>
						<div class="origin">来自网页</div>
						<div class="comment">评论</div>
						<div class="comma">|</div>
						<div class="forward">转发</div>
					</div>
					<div class="tranglearea">
						<div class="trangle "></div>
					</div>
					<div class="commentbox">
						<textarea class="commentarea" rows="3"></textarea>
						<div class="commentfunc">
							<div class="forwardcheck">
								<input type="checkbox" name="forward" /> 同时转发到我的微博
							</div>
							<button class="commentbtn button whitebutton">评 论</button>
						</div>
					</div>
				</div>
				<div class="plainwei">
					<div class="weibocoimg">
						<img src="face/13.jpg" alt="face">
					</div>
					<div class="name">EasyGod</div>
					<p class="content">季神V5！</p>
					<div class="forwardtranglearea">
						<div class="forwardtrangle"></div>
					</div>
					<div class="forwardbox">
						<div class="name">@MornJ</div>
						<p class="content">火箭比赛现场，季神一时兴起亲吻胖女神，未曾想却遭一记重重耳光，尴尬之余只好送火箭熊爆米花赔礼，可女神不买账，还把饮料倒在他头上。这时旁边美女看不下去了，起身主动向此男球迷献吻……</p>
						<div class="weiimg">
							<img src="image/wei1.jpg" alt="wei1" />
						</div>
						<div class="subcontent weiname">
							<div class="time">2012 - 2 - 13 08：15</div>
							<div class="origin">来自网页</div>
							<div class="comment">评论</div>
							<div class="comma">|</div>
							<div class="forward">转发</div>
						</div>
					</div>
					<div class="subcontent weiname">
						<div class="time">2013 - 2 - 23 11：05</div>
						<div class="origin">来自网页</div>
						<div class="comment">评论</div>
						<div class="comma">|</div>
						<div class="forward">转发</div>
					</div>
				</div>
			</div>
		</section>
		<aside class="weiaside">
			<div class="info">
				<div class="infopic">
					<img src="<%=user.getImage()%>" alt="face" />
				</div>
				<p class="infoname"><%=user.getNickname()%></p>
				<p class="infofrom"><%=user.getComefrom()%></p>
			</div>
			<div class="stat">
				<div class="statblk">
					<p class="statnum"><%=user.getFriendsNumber()%></p>
					<p class="statname">关注</p>
				</div>
				<div class="statblk">
					<p class="statnum"><%=user.getListenerNumber()%></p>
					<p class="statname">粉丝</p>
				</div>
				<div class="statblk rtst">
					<p class="statnum"><%=user.getWeiboNumber()%></p>
					<p class="statname">微博</p>
				</div>
			</div>
			<div>
				<a class="loginbutton bluebutton button <%=addFriendClass%>"
					href="doFriendOp.jsp?type=<%=friendType%>&uid=<%=user.getId()%>&f_uid=<%=loginUser.getId()%>"><%=buttonTextString%></a>
			</div>
			<div class="func">
				<div class="funclink<%=myHomeClass%>" id="myhome">我的首页</div>
				<div class="funclink<%=myPageClass%>" id="mypage">我的微博</div>
				<div class="funclink<%=squareClass%>" id="square">微博广场</div>
				<div class="funclink" id="changeface">修改头像</div>
			</div>
			<div class="topiclist">
				<h3>可能感兴趣的妹子</h3>
				<ul>
					<li class="topicitem">波多野结衣</li>
					<li class="topicitem">苍井空</li>
					<li class="topicitem">吉泽明步</li>
					<li class="topicitem">仓麻优</li>
					<li class="topicitem">饭岛爱</li>
					<li class="topicitem">刘雅诺</li>
				</ul>
			</div>
			<div class="topiclist">
				<h3>热门话题</h3>
				<ul>
					<li class="topicitem">看两会之稳定物价</li>
					<li class="topicitem">冷空气又来袭</li>
					<li class="topicitem">黄浦江惊险千头死猪</li>
					<li class="topicitem">植树节晒绿色</li>
					<li class="topicitem">复旦自主考又见神题</li>
					<li class="topicitem">农业厅称死猪是冻死</li>
				</ul>
			</div>
			<div class="topiclist">
				<h3>热门用户</h3>
			</div>
			<div class="reuserlist">
				<div class="reuserli" title="<%=hots.get(0).getNickname()%>"
					id="<%=hots.get(0).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(0).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(0).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(1).getNickname()%>"
					id="<%=hots.get(1).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(1).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(1).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(2).getNickname()%>"
					id="<%=hots.get(2).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(2).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(2).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(3).getNickname()%>"
					id="<%=hots.get(3).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(3).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(3).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(4).getNickname()%>"
					id="<%=hots.get(4).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(4).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(4).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(5).getNickname()%>"
					id="<%=hots.get(5).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(5).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(5).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(6).getNickname()%>"
					id="<%=hots.get(6).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(6).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(6).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(7).getNickname()%>"
					id="<%=hots.get(7).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(7).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(7).getNickname()%></div>
				</div>
				<div class="reuserli" title="<%=hots.get(8).getNickname()%>"
					id="<%=hots.get(8).getId()%>">
					<div class="reuserimg">
						<img src="<%=hots.get(8).getImage()%>" alt="face" />
					</div>
					<div class="reusername"><%=hots.get(8).getNickname()%></div>
				</div>
			</div>
		</aside>
	</section>
	<footer class="mid">
		<a target="_blank" href="login.jsp">注目</a> | <a target="_blank"
			href="login.jsp">版权申明</a> | <a target="_blank" href="login.jsp">联系我们</a>
		| <a target="_blank" href="login.jsp">意见反馈</a> <br /> Copyright ©
		2013 VIEW. All Rights Reserved
	</footer>
</body>
</html>
