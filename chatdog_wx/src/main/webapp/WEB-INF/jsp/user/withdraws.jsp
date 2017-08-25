<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<!-- saved from url=(0056)http://m.58jude.com/member/withdrawals.do?v=201611080854 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>聚德购物商城</title>
<meta name="Keywords" content="聚德购物|聚德购物商城|聚德养老购物">
<meta name="Description" content="聚德购物是社会新型消费养老电子商务平台！">
<meta content="telephone=no" name="format-detection">
<meta content="email=no" name="format-detection">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/base.css">
<script src="${pageContext.request.contextPath}/common/hm.js"></script><script type="text/javascript" src="${pageContext.request.contextPath}/common/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/layer.min.js"></script><link rel="stylesheet" href="${pageContext.request.contextPath}/common/layer.css" id="layui_layer_skinlayercss">
<script type="text/javascript" src="${pageContext.request.contextPath}/common/template.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/base.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/common/withdrawals.js"></script>

<script>
//百度统计
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?1346cf343a580b8f985dbdac5d67e432";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script></head>

<body ontouchstart=""><header class="header">
	<div class="back">
		<a href="javascript:goToBack();">
		<img src="${pageContext.request.contextPath}/common/back.png"></a>
	</div>
	<h2>申请提现</h2>
</header>
<div class="main">
		<div class="jui_cells_title">
		提现信息填写（提现到微信）
	</div>
	<div class="jui_cells">
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">账户余额</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<span class="modeDown">${balance }</span>元
			</div>
		</div>
		<div class="jui_cell" style="display:none;">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">信用额度</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<span class="credit">9999999</span>元
			</div>
		</div>
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">可提金额</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<span class="canTxMoney modeDown">${canMoney}</span>元
			</div>
		</div>
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">提现金额</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<input id="txMoney" name="txMoney" class="jui_input" type="text" placeholder="请输入100的整数倍" autocomplete="off">
			</div>
		</div>
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">手续费</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<input id="serviceMoney" class="jui_input" type="text" placeholder="输入提现金额后计算" autocomplete="off" readonly="readonly">
			</div>
		</div>
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">实际到帐</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<input id="actualMoney" class="jui_input" type="text" placeholder="输入提现金额后计算" autocomplete="off" readonly="readonly">
			</div>
		</div>
	</div>
	<!-- <div class="jui_cells_title">
		提现银行信息
	</div>
	<div class="jui_cells">
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">卡号</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<span>6228450910005300914</span>
			</div>
		</div>
		<div class="jui_cell">
			<div class="jui_cell_hd">
				<label class="jui_lable jui_lable_w4">开户银行</label>
			</div>
			<div class="jui_cell_bd jui_cell_primary">
				<span>大同市农业银行朝阳支行</span>
			</div>
		</div>
	</div> -->
	<div class="jui_btn_area">
		<a id="rechargeBtn" class="jui_btn jui_btn_red" href="javascript:void(0);">申请提现</a>
	</div>
	<div class="jui_btn_area">
		<a id="rechargeBtn" class="jui_btn jui_btn_fastreg" href="${pageContext.request.contextPath }/user/withDrawsRecords.action">提现记录查询</a>
	</div>
	<div class="jui_cells_title">
		<span class="modeDown">
			提示：<br>
			1、请确保您账户中有充足的余额并且距离上次成功提现时间大于7天<br>
			2、提现成功后，提现金额会自动进入微信零钱，请注意查收<br>
			3、手续费计算标准：
			<p style="text-indent: 2em">提现手续费按照提现金额的2%计算</p>
			<!-- <p style="text-indent: 2em">提现金额 &lt;=1000</p>
			<p style="text-indent: 3em">每次提现收2元手续费</p>
			<p style="text-indent: 2em">提现金额 &gt; 1000 并且 &lt;= 10000</p>
			<p style="text-indent: 3em">每次提现收取5‰手续费</p>
			<p style="text-indent: 2em">提现金额 &gt; 10000</p>
			<p style="text-indent: 3em">每次提现收取3‰手续费</p> -->
		</span>
	</div>
	</div>


		<footer class="footer">
		    <p class="copy">©<span>2016</span>聚德购物商城</p>
			<p class="line">晋ICP备16009896号</p>
			<p class="line">微信公众账号：聚德购物商城</p>
		</footer>
	
</body></html>