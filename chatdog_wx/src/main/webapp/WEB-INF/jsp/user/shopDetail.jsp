<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userHeadImgPath = basePath + "upload/userHeadImg/";
	//String mallPicImgPath = basePath + "upload/mallPicture/";
	String mallPicImgPath = "/mallImgs/";
%>


<!DOCTYPE html>
<!-- saved from url=(0058)http://m.58jude.com/shopDetail.do?shopSeq=2016060910002480 -->
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/shopDetail.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/api"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/getscript"></script>

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
	<script>
		var s = {
			lat : "${mall.mallPos_lat}",
			lng : "${mall.mallPos_lnt}"
		};
	</script>
	<header class="header">
		<div class="back">
			<a href="javascript:goToBack();"> <img
				src="${pageContext.request.contextPath}/common/back.png"></a>
		</div>
		<h2>${mall.mallName }</h2>
	</header>
	<div class="main">
		<div class="shopBaner">
			<c:if test="${not empty mall.mallMainPicUrl }">
				<img
					src="<%=mallPicImgPath %>${mall.mallMainPicUrl }">
			</c:if>
		</div>
		<div class="shopDetail">
			<div class="near_range">
				<a href="javascript:void(0);" class="hover">商家信息</a> <a
					href="javascript:void(0);">商家图片</a> <a href="javascript:void(0);">地理位置</a>
			</div>
			<dl style="display: block;">
				<dd>
					商家名称：<span>${mall.mallName }</span>
				</dd>
				<dd>
					联系人：<span>${mall.mallLinkMan }</span>
				</dd>
				<dd>
					联系电话：<span>${mall.mallPhone }</span>
				</dd>
				<dd>
					商家地址：<span>${mall.mallAddress }</span>
				</dd>
			</dl>
			<dl style="display: none;">
				<c:if test="${not empty mall.mallPicUrl1 }">
					<dd>
						<img src="<%=mallPicImgPath %>${mall.mallPicUrl1}">
					</dd>
				</c:if>
				<c:if test="${not empty mall.mallPicUrl2 }">
					<dd>
						<img src="<%=mallPicImgPath %>${mall.mallPicUrl2}">
					</dd>
				</c:if>
				<c:if test="${not empty mall.mallPicUrl3 }">
					<dd>
						<img src="<%=mallPicImgPath %>${mall.mallPicUrl3}">
					</dd>
				</c:if>
				<c:if test="${not empty mall.mallPicUrl4 }">
					<dd>
						<img src="<%=mallPicImgPath %>${mall.mallPicUrl4}">
					</dd>
				</c:if>
				<c:if test="${not empty mall.mallPicUrl5 }">
					<dd>
						<img src="<%=mallPicImgPath %>${mall.mallPicUrl5}">
					</dd>
				</c:if>
			</dl>
			<dl style="display: none;">
				<div id="mapContent"></div>
			</dl>
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