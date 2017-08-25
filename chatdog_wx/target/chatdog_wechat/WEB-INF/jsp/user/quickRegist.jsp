<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!-- saved from url=(0038)http://m.58jude.com/member/register.do -->
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
<script src="${pageContext.request.contextPath}/common/hm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/layer.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/layer.css"
	id="layui_layer_skinlayercss">
<script type="text/javascript" src="${pageContext.request.contextPath}/common/template.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/reg1.js"></script>
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
		<h2>会员注册</h2>
	</header>
	
	<c:if test="${not empty errMsg }">
		<script>
			alert("${errMsg}");
		</script>
	</c:if>
	<form id="personRegForm" method="post" autocomplete="off">
		<input type="hidden" name="reqUrl" value="register"> <input
			type="hidden" name="reqType" value="reg">
		<input
			type="hidden" name="token" value="${token }">
		<input
			type="hidden" name="code" id="code" value="${code }">
		<div class="main">
			<div class="jui_cells">
				<div class="jui_cell">
					<input type="hidden" value="${token }" name="token"/>
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">会员号</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<input id="userAcct" name="username" class="jui_input"
							maxlength="16" type="text" placeholder="请输入会员名">
					</div>
				</div>
				<div class="jui_cell">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">密码</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<input id="password" name="password" class="jui_input"
							maxlength="16" type="password" placeholder="请输入密码">
					</div>
				</div>
				<div class="jui_cell">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">确认密码</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<input id="repassword" name="repassword" class="jui_input"
							maxlength="16" type="password" placeholder="请输入密码">
					</div>
				</div>
				<div class="jui_cell">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">手机号码</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<input id="userPhone" name="phone" class="jui_input"
							maxlength="11" type="text" placeholder="请输入您的手机号码">
					</div>
				</div>
				<div class="jui_cell jui_cell_select jui_select_after">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">常住省份</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<select id="provinceId" name="province"
							class="jui_select jui_input_blue">
							<option value="">--请选择--</option>
							<option value="1">北京市</option>
							<option value="2">天津市</option>
							<option value="3">河北省</option>
							<option value="4">山西省</option>
							<option value="5">内蒙古</option>
							<option value="6">辽宁省</option>
							<option value="7">吉林省</option>
							<option value="8">黑龙江</option>
							<option value="9">上海市</option>
							<option value="10">江苏省</option>
							<option value="11">浙江省</option>
							<option value="12">安徽省</option>
							<option value="13">福建省</option>
							<option value="14">江西省</option>
							<option value="15">山东省</option>
							<option value="16">河南省</option>
							<option value="17">湖北省</option>
							<option value="18">湖南省</option>
							<option value="19">广东省</option>
							<option value="20">广  西</option>
							<option value="21">海南省</option>
							<option value="22">重庆市</option>
							<option value="23">四川省</option>
							<option value="24">贵州省</option>
							<option value="25">云南省</option>
							<option value="26">西  藏</option>
							<option value="27">陕西省</option>
							<option value="28">甘肃省</option>
							<option value="29">青海省</option>
							<option value="30">宁  夏</option>
							<option value="31">新  疆</option>
						</select>
					</div>
				</div>
				<div class="jui_cell jui_cell_select jui_select_after">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">常住地市</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<select id="eparchyId" name="city"
							class="jui_select jui_input_blue">
							<option id="" value="">--请选择--</option>
						</select>
					</div>
				</div>
				<div class="jui_cell jui_cell_select jui_select_after">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">常住区县</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<select id="cityId" name="area"
							class="jui_select jui_input_blue">
							<option id="" value="">--请选择--</option>
						</select>
					</div>
				</div>
				<div class="jui_cell jui_cell_vcode">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">验证码</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<input id="verifyCode" name="verifyCode" class="jui_input"
							maxlength="4" type="text" placeholder="请输入图形验证码">
					</div>
					<div class="jui_cell_ft">
						<img id="verifyImg" src="${pageContext.request.contextPath}/user/imageVerifyCode.action">
					</div>
				</div>
				<div class="jui_cell">
					 <div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">短信码</label>
					<div class="jui_cell_bd jui_cell_primary">
						<input id="smsCode" name="smsCode" class="jui_input" maxlength="6"
							type="text" placeholder="请输入短信验证码">
					</div> 
					</div>
					<div class="jui_cell_ft">
						<a id="smsBtn" class="send_btn" href="javascript:void(0)"><span
							id="smsBtn_text">发送验证码</span></a>
					</div>
				</div>
			</div>
			<div class="reg_notice">
				<input type="checkbox" id="readme" name="readme"
					value="1"> 我已认真阅读并同意 <a class="reg_readme" id="readme_yhxy"
					href="javascript:void(0);" target="blank"> <span
					class="readme_yhxy">《用户协议》</span>
				</a>
				<!-- 
			和
			<a class="reg_readme" href="javascript:void(0);" target="blank">
				<span class="readme_zsgz">《赠送规则》</span>
			</a>
			 -->
			</div>
			<div class="jui_btn_area">
				<a id="reg_btn" class="jui_btn jui_btn_red"
					href="javascript:void(0);">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
			</div>
			<div class="jui_btn_area">
				<a id="fastRegBtn" class="jui_btn jui_btn_fastreg"
					href="${pageContext.request.contextPath }/user/loginPage.action">已有帐号？登录</a>
			</div>
		</div>
	</form>
	<footer class="footer">
		<p class="copy">
			©<span>2016</span>聚德购物商城
		</p>
		<p class="line">晋ICP备16009896号</p>
		<p class="line">微信公众账号：聚德购物商城</p>
	</footer>

</body>
</html>