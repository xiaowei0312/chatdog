<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0058)http://m.58jude.com/member/balanceDetail.do?v=201611010916 -->
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
	href="${pageContext.request.contextPath}/common/base.css">
<script src="${pageContext.request.contextPath}/common/hm.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/layer.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/layer.css"
	id="layui_layer_skinlayercss">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/template.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/base.js"></script>

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
		<div class="back">
			<a href="javascript:goToBack();"> <img
				src="${pageContext.request.contextPath}/common/back.png"></a>
		</div>
		<h2>用户提现记录</h2>
	</header>
	<div class="container">
		<div class="main">
			<div class="jui_cells_title">默认展示最近15次变更记录，更多请登录商城查询!</div>
			<c:if test="${empty records}">
				<div class="jui_list_cells">
					<div class="jui_list_cell emptyInfo">没有查询到数据!</div>
				</div>
			</c:if>

			<c:if test="${not empty records}">
				<div class="jui_list_cells">
					<c:forEach items="${records }" var="record">
						<div class="jui_list_cell">
							<div class="info">
								<p>
									提现时间：<span><fmt:formatDate
											value="${record.operateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
								</p>
								<p>
									提现金额：<span>${record.operateNum - record.serviceNum }</span>
								</p>
							</div>
							<c:if test="${record.operateState == 0 }">
								<span class="changeVal modelUp">
									处理中
								</span>
							</c:if>
							<c:if test="${record.operateState == 1}">
								<span class="changeVal modeDown">
									提现失败
								</span>
							</c:if>
							<c:if test="${record.operateState == 2}">
								<span class="changeVal modeDown">
									提现成功
								</span>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</c:if>
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