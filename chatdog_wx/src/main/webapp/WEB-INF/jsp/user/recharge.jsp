<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF8">
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
	src="${pageContext.request.contextPath}/common/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/layer.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/layer.css" id="layui_layer_skinlayercss" style="">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/template.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/common/base.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
</head>

<body ontouchstart="">
	<header class="header">
		<div class="back">
			<a href="javascript:goToBack();"> <img
				src="${pageContext.request.contextPath}/common/back.png"></a>
		</div>
		<h2>余额充值</h2>
	</header>
	<div class="main">
		<form action="/member/recharge.do" method="post">
			<div class="jui_cells_title">填写充值金额</div>
			<div class="jui_cells">
				<div class="jui_cell">
					<div class="jui_cell_hd">
						<label class="jui_lable jui_lable_w4">充值金额</label>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<div class="jui_cell_bd jui_cell_primary">
							<input id="rechargeMoney" name="rechargeMoney" class="jui_input"
								placeholder="充值金额大于或等于1" type="text">
						</div>
					</div>
				</div>
			</div>
			<div class="jui_cells_title">选择充值方式</div>
			<div class="jui_cells jui_cells_checkbox">
				<label class="jui_cell jui_check_label" for="wx_pay">
					<div class="jui_cell_hd">
						<input type="radio" class=jui_check name="rechargeType"
							id="wx_pay" value="WXPAY" checked="checked"> <i
							class="jui_icon_checked"></i>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<p>微信支付</p>
					</div>
				</label>
				<!-- <label class="jui_cell jui_check_label" for="china_pay">
					<div class="jui_cell_hd">
						<input class="jui_check" name="rechargeType" id="china_pay"
							value="CHINAPAY" checked="checked" type="radio"> <i
							class="jui_icon_checked"></i>
					</div>
					<div class="jui_cell_bd jui_cell_primary">
						<p>银联在线支付</p>
					</div>
				</label> -->
			</div>
			<div class="jui_btn_area">
				<a id="test" class="jui_btn jui_btn_red"
					href="javascript:void(0);">充值</a>
			</div>
			<!-- 
		<div class="jui_btn_area">
			<a id="rechargeBtn" class="jui_btn jui_btn_fastreg" href="/member/withdrawalsRecord.do">充值记录查询</a>
		</div>
		 -->
		</form>
		<div class="jui_cells_title">
			<span class="modeDown"> 提示：<br>
				&nbsp;&nbsp;&nbsp;&nbsp;您在充值时可能根据所选支付方式有所延迟，如充值后尚未到帐，请耐心等待1-5分钟时间，如长时间未到帐，请联系客服(400-116-1056)咨询。
			</span>
		</div>
	</div>


	<footer class="footer">
		<p class="copy">
			©<span>2016</span>聚德购物商城
		</p>
		<p class="line">晋ICP备16009896号</p>
		<p class="line">微信公众账号：聚德购物商城</p>
	</footer>


	<script type="text/javascript">
	var flag = true;
	var basePath = "${pageContext.request.contextPath}";
	wx.config({
		debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。  
		appId : '${jsApiSign.appId}', // 必填，公众号的唯一标识  
		timestamp : '${ jsApiSign.timestamp}', // 必填，生成签名的时间戳  
		nonceStr : '${ jsApiSign.nonceStr}', // 必填，生成签名的随机串  
		signature : '${ jsApiSign.signature}',// 必填，签名，见附录1  
		jsApiList : [ 'chooseWXPay' ]
	// 必填，需要使用的JS接口列表，所有JS接口列表见附录2  
	});

	function preSubmit() {
		var a = $("#rechargeMoney").val();
		if (!/^[1-9]{1}([0-9])*(.[0-9]{1,2})?$/.test(a)) {
			layer.tips("请输入正确的充值金额!", "#rechargeMoney", {
				tips : 3
			});
			return false
		}
		return true
	}; 

	wx.ready(function() {
		$("#test").click(function() {
			if (flag == false)
				return;
			if (preSubmit() == false)
				return;
			flag = false; 
			$.ajax({
				type : "POST",
				url : basePath + "/wxpay/sellerSubmitOrderPay.action", //<span style="font-family:微软雅黑;">ajax调用微信统一接口获取prepayId</span>  
				data : {
					code : "${code}",
					tradeNum : $("#rechargeMoney").val()
				},
				success : function(data) {
					var obj = $.parseJSON(data);
					if (parseInt(obj.agent) < 5) {
						alert("您的微信版本低于5.0无法使用微信支付");
						return;
					}
					wx.chooseWXPay({
						timestamp : obj.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
						nonceStr : obj.nonceStr, // 支付签名随机串，不长于 32 位
						'package' : obj.packageValue, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=xxx）
						signType : obj.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
						paySign : obj.paySign, // 支付签名
						success : function(res) {
							window.location.href = obj.sendUrl;
						}
					});
				} 
			});
		}); 
	});
	//初始化jsapi接口 状态
	wx.error(function(res) {
		alert("调用微信jsapi返回的状态:" + res.errMsg);
	});
</script>
</body>
</html>