<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta id="viewport" name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>聚德购物商城</title>
<meta name="Keywords" content="聚德购物|聚德购物商城|聚德养老购物">
<meta name="Description" content="聚德购物是社会新型消费养老电子商务平台！">
<meta content="telephone=no" name="format-detection">
<meta content="email=no" name="format-detection">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/common/base.css">
<script src="${pageContext.request.contextPath }/common/hm.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/common/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/common/layer.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/common/layer.css"
	id="layui_layer_skinlayercss">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/common/template.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/common/base.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/common/login.js"></script>
<script>
	//百度统计
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?1346cf343a580b8f985dbdac5d67e432";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
	
</script>
</head>

<body ontouchstart="">
	<header class="header">
		<h2>登录</h2>
	</header>
	<c:if test="${not empty errMsg }">
		<script>
			alert("用户名或密码错误")
		</script>
	</c:if>
	<div class="main">
		<input type="hidden" id="openId" name="openId" value="">
		<div class="jui_cells_title">欢迎登录聚德购物商城</div>
		<div class="jui_cells">
			<div class="jui_cell">
				<div class="jui_cell_hd">
					<label class="jui_lable jui_lable_w3">会员号</label>
				</div>
				<div class="jui_cell_bd jui_cell_primary">
					<input id="loginname" name="username" class="jui_input" type="text"
						placeholder="请输入会员名/手机号">
				</div>
			</div>
			<div class="jui_cell">
				<div class="jui_cell_hd">
					<label class="jui_lable jui_lable_w3">密码</label>
				</div>
				<div class="jui_cell_bd jui_cell_primary">
					<input id="loginpass" name="password" class="jui_input"
						type="password" placeholder="请输入密码">
				</div>
			</div>
			<div class="jui_cell jui_cell_vcode">
				<div class="jui_cell_hd">
					<label class="jui_lable jui_lable_w3">验证码</label>
				</div>
				<div class="jui_cell_bd jui_cell_primary">
					<input id="verifyCode" name="verifyCode" class="jui_input"
						type="text" placeholder="请输入图形验证码">
				</div>
				<div class="jui_cell_ft">
					<img id="validateCodeImg" src="${pageContext.request.contextPath }/user/imageVerifyCode.action">
				</div>
			</div>
		</div>
		<div class="jui_btn_area">
			<a id="loginBtn" class="jui_btn jui_btn_red"
				href="javascript:void(0);">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
		</div>
		<div class="jui_btn_area">
			<a id="fastRegBtn" class="jui_btn jui_btn_fastreg"
				href="javascript:void(0);">没有帐号？注册</a>
		</div>
	</div>
	<footer class="footer">
		<p class="copy">
			©<span>2016</span>聚德购物商城
		</p>
		<p class="line">晋ICP备16009896号</p>
		<p class="line">微信公众账号：聚德购物商城</p>
	</footer>

</body>
</html>