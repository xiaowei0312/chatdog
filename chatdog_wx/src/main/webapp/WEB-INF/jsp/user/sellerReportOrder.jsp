<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0063)http://m.58jude.com/member/offlineOrderSubmit.do?v=201610110701 -->
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
	src="${pageContext.request.contextPath}/common/submitOrder1.js"></script>
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
		<h2>线下报单</h2>
	</header>
	<form id="personRegForm" method="post" autocomplete="off">
		<div class="container">
			<div class="main">
				<div class="jui_cells_title">单据基本信息</div>
				<div class="jui_cells">
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">商家当前余额</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<div class="vip_a11">
								<span id="sellerbalance" class="jui_input_red">0.0元</span>
							</div>
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">订单号</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input" id="orderId" name="orderId" type="text"
								maxlength="7" placeholder="请输入订单号">
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">消费者手机号</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input" id="buyerAcct" name="buyerAcct"
								type="text" maxlength="11" placeholder="请输入消费者手机号">
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">消费者会员号</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input" id="buyerUserAcct" type="text"
								maxlength="16" readonly="readonly" placeholder="输入消费者账号后显示">
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">消费者姓名</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input" id="buyerName" type="text"
								maxlength="16" readonly="readonly" placeholder="输入消费者账号后显示">
						</div>
					</div>
					<div class="jui_cell jui_cell_select jui_select_after">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">商品大类</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<select id="goodsType" name="goodsType" class="jui_select">
								<option value="">---请选择---</option>
								<option value="1">3C数码</option>
								<option value="2">家居用品</option>
								<option value="3">电动、交通</option>
								<option value="4">家装、建材</option>
								<option value="5">珠宝饰品</option>
								<option value="6">美容护理</option>
								<option value="7">服装鞋帽</option>
								<option value="8">生活服务</option>
								<option value="9">医药蚕业</option>
								<option value="10">餐饮、住宿</option>
								<option value="11">家电类</option>
								<option value="12">电脑、办公</option>
								<option value="13">食品、保健</option>
								<option value="14">运动、健身</option>
								<option value="15">商业服务</option>
								<option value="16">汽车及用品</option>
								<option value="17">礼品箱包</option>
							</select>
						</div>
					</div>
					<div class="jui_cell jui_cell_select jui_select_after">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">商品小类</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<select name="goodsSubType" id="goodsSubType" class="jui_select">
								<option value="">---请选择---</option>
							</select>
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">商品名称</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input" type="text" name="goodsName"
								maxlength="50" id="goodsName" placeholder="请填写商品名称">
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">交易额</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input" type="text" name="dealPrice"
								maxlength="10" id="dealPrice" placeholder="请填写交易额">
						</div>
					</div>
				</div>
				<div class="jui_cells_title">商家优惠信息</div>
				<div class="jui_cells">
					<div class="jui_cell jui_cell_select jui_select_after">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">商家优惠</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<select name="serviceRate" id="serviceRate"
								class="jui_select jui_select_red">
								<option value="1">1%</option>
								<option value="2">2%</option>
								<option value="3">3%</option>
								<option value="4">4%</option>
								<option value="5">5%</option>
								<option value="6">6%</option>
								<option value="7">7%</option>
								<option value="8">8%</option>
								<option value="9">9%</option>
								<option value="10">10%</option>
								<option value="11">11%</option>
								<option value="12">12%</option>
								<option value="13">13%</option>
								<option value="14">14%</option>
								<option value="15">15%</option>
								<option value="16">16%</option>
								<option value="17">17%</option>
								<option value="18">18%</option>
								<option value="19">19%</option>
								<option value="20">20%</option>
							</select>
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">应付款</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input jui_input_red" type="text"
								id="servicePrice" name="servicePrice" placeholder=""
								readonly="readonly" value="0">
						</div>
					</div>
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">获赠积分</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input jui_input_green" type="text"
								name="giftJF" id="giftJF" placeholder="" readonly="readonly"
								value="0">
						</div>
					</div>
				</div>
				<div class="jui_cells_title rewardInfo_TR" style="display: none;">
					商家奖励信息</div>
				<div class="jui_cells rewardInfo_TR" style="display: none;">
					<div class="jui_cell">
						<div class="jui_cell_hd">
							<label class="jui_lable jui_lable_w6">奖励积分</label>
						</div>
						<div class="jui_cell_bd jui_cell_primary">
							<input class="jui_input jui_input_blue" type="text"
								name="rewardJF" id="rewardJF" value="0" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="jui_btn_area">
					<a id="btn_submit" class="jui_btn jui_btn_red"
						href="javascript:void(0);">提交报单</a>
				</div>
			</div>
			<input type="hidden" id="giftRate" name="giftRate" value="${globalParams.vipJfRatio }">
			<input type="hidden" id="rewardLimit" name="rewardLimit" value="60">
			<input type="hidden" id="rewardRate" name="rewardRate" value="${globalParams.busJfRatio }">
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