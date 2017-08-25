<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<!-- saved from url=(0079)http://m.58jude.com/nearMerchants.do?lat=37.844246&lon=112.575349&distance=5000 -->
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
	src="${pageContext.request.contextPath}/common/nearMerchants1.js"></script>
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
	<script type="text/javascript">
		var s = {
			lon : "${wechatPos.longitude}",
			lat : "${wechatPos.latitude}",
			distance : 5000,
			size : "${mallSize }"
		};
	</script>
	<header class="header">
		<h2>附近商家</h2>
	</header>
	<div class="main">
		<div class="near_range">
			<c:if test="${distance } == 5000">
				<a
					href="${pageContext.request.contextPath }/user/userNearbyStoresResult.action?latitude=${wechatPos.latitude }&amp;longitude=${wechatPos.longitude }&amp;distance=5000"
					class="hover">5公里内 </a>
			</c:if>
			<c:if test="${distance } != 5000">
				<a
					href="${pageContext.request.contextPath }/user/userNearbyStoresResult.action?latitude=${wechatPos.latitude }&amp;longitude=${wechatPos.longitude }&amp;distance=5000">5公里内
				</a>
			</c:if>

			<c:if test="${distance } == 10000">
				<a class="hover" 
					href="${pageContext.request.contextPath }/user/userNearbyStoresResult.action?latitude=${wechatPos.latitude }&amp;longitude=${wechatPos.longitude }&amp;distance=10000">10公里内
				</a>
			</c:if>
			<c:if test="${distance } != 10000">
				<a
					href="${pageContext.request.contextPath }/user/userNearbyStoresResult.action?latitude=${wechatPos.latitude }&amp;longitude=${wechatPos.longitude }&amp;distance=10000">10公里内
				</a>
			</c:if>
	
			<c:if test="${distance } == 20000">
			<a class="hover"
				href="${pageContext.request.contextPath }/user/userNearbyStoresResult.action?latitude=${wechatPos.latitude }&amp;longitude=${wechatPos.longitude }&amp;distance=20000">20公里内</a>
			</c:if>
			<c:if test="${distance } != 20000">
				href="${pageContext.request.contextPath }/user/userNearbyStoresResult.action?latitude=${wechatPos.latitude }&amp;longitude=${wechatPos.longitude }&amp;distance=20000">20公里内</a>
			</c:if>
		</div>
		<div class="jui_list_cells">
			<c:if test="${empty malls}">
				<div class="jui_list_cell emptyInfo">没有查询到数据!</div>
			</c:if>

			<c:if test="${not empty malls}">
				<c:forEach items="${malls }" var="mall">
					<a
						href="${pageContext.request.contextPath }/user/shopDetail.action?mallId=${mall.id}"
						class="jui_list_cell"> <em> <img
							src="<%=mallPicImgPath %>${mall.mallMainPicUrl }">
					</em>
						<div class="shopInfo">
							<p class="shopName">${mall.mallName }</p>
							<p class="shopRemark">${mall.mallDesc}</p>
							<p class="shopLP">联系电话：${mall.mallPhone }</p>
							<span class="shop_distance">${mall.distance}km</span>
						</div>
					</a>
				</c:forEach>
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