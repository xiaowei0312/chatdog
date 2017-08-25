<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!-- www.vxzsk.com原创 -->
<title>中转页面</title>
<meta name="viewport"
	content="width=320.1,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js">
	
</script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script type="text/javascript">
	wx.config({
		debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。  
		appId : '${jsApiSign.appId}', // 必填，公众号的唯一标识  
		timestamp : '${ jsApiSign.timestamp}', // 必填，生成签名的时间戳  
		nonceStr : '${ jsApiSign.nonceStr}', // 必填，生成签名的随机串  
		signature : '${ jsApiSign.signature}',// 必填，签名，见附录1  
		jsApiList : [ 'checkJsApi', 'chooseImage', 'previewImage',
				'uploadImage', 'downloadImage', 'getNetworkType',//网络状态接口
				'openLocation',//使用微信内置地图查看地理位置接口
				'getLocation' //获取地理位置接口
		]
	// 必填，需要使用的JS接口列表，所有JS接口列表见附录2  
	});

	wx.ready(function() {
				//alert(window.location.href);
		wx.getLocation({
			success : function(res) {
				var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
				var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
				var speed = res.speed; // 速度，以米/每秒计
				var accuracy = res.accuracy; // 位置精度
				var url = "${pageContext.request.contextPath }/user/userNearbyStoresResult.action?";
				url += ("latitude="+latitude+"&longitude="+longitude);
				url += ("&distance=5000");
				window.location.href = url;
			},
			cancel : function(res) {
				alert('用户拒绝授权获取地理位置');
			}
		});
	});
	//初始化jsapi接口 状态
	wx.error(function(res) {
		alert("调用微信jsapi返回的状态:" + res.errMsg);
	});
</script>
</head>

<body>
</body>
</html>