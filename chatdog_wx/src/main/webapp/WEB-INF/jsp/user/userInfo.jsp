<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<!-- saved from url=(0034)http://m.58jude.com/member/home.do -->
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
	src="${pageContext.request.contextPath}/common/home.js"></script>
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
		<h2>会员中心</h2>
	</header>
	<div class="main">
		<div class="jui_cells" style="margin-top: 10px;">
			<div class="member_info clearfix">
				<div class="headArea">
					<em class="headImg"> <a> <img
							src="${sessionScope.user.headImgUrl}">
					</a>
					</em>
				</div>
				<div class="acctInfo">
					<p>${sessionScope.user.username }</p>
					<p>
						剩余积分：<span>${user.jfAccount.accountBalance }</span>分
					</p>
					<p class="userType">
						<span> 
							${sessionScope.user.role.roleName }
						</span>
					</p>
				</div>
			</div>
		</div>
		<div class="acctStatInfo">
			<div class="acctTitle">账户余额</div>
			<div class="acctNum balance">${user.moneyAccount.accountBalance }</div>
		</div>
		<div class="acctStatInfo">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td>
							<div class="acctTitle">当前聚财宝</div>
							<div class="acctNum">${user.dlbAccount.accountBalance }</div>
						</td>
						<td style="border-left: 1px solid #ddd;">
							<div class="acctTitle">当前养老金</div>
							<div class="acctNum">${user.yljAccount.accountBalance }</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="acctStatInfo">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td>
							<div class="acctTitle">累计消费</div>
							<div class="acctNum">${user.moneyAccount.totalPlatformOutgoings }</div>
						</td>
						<td>
							<div class="acctTitle">累计赠送</div>
							<div class="acctNum">${user.moneyAccount.totalPlatformIncomings }</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="jui_cells_title">账户管理</div>
		<div class="jui_cells jui_cells_access">
			<a class="jui_cell"
				href="${pageContext.request.contextPath }/user/getMoneyAccountRecord.action?userId=${user.id}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">余额变更记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="${pageContext.request.contextPath }/user/getSyAccountRecord.action?userId=${user.id}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">收益变更记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="${pageContext.request.contextPath }/user/getJfAccountRecord.action?userId=${user.id}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">积分变更记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="${pageContext.request.contextPath }/user/getDlbAccountRecord.action?userId=${user.id}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">聚财宝变更记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="${pageContext.request.contextPath }/user/getYljAccountRecord.action?userId=${user.id}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">养老金转存记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a>
		</div>
		<div class="jui_cells_title">资金管理</div>
		<div class="jui_cells jui_cells_access">
			<a class="jui_cell"
				href="${pageContext.request.contextPath }/user/recharge.action?openId=${openId}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">余额充值</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="${pageContext.request.contextPath }/user/withdraws.action?openId=${openId}">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">提现申请</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <!-- <a class="jui_cell"
				href="javascript:void(0);">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">我的银行卡</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> -->
		</div>
		<div class="jui_cells_title">交易中心</div>
		<div class="jui_cells jui_cells_access">
			<a class="jui_cell"
				href="${pageContext.request.contextPath }/user/offlineConsumeRecord.action">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">线下消费记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a>
		</div>
		<div class="jui_cells_title">商家管理</div>
		<div class="jui_cells jui_cells_access">
			<a class="jui_cell"
				href="${pageContext.request.contextPath }/user/sellerReportOrder.action">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">线下报单</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="${pageContext.request.contextPath }/user/submitOrderRecord.action">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">报单记录</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a>
		</div>
		<!-- <div class="jui_cells_title">安全管理</div>
		<div class="jui_cells jui_cells_access">
			<a class="jui_cell"
				href="javascript:void(0);">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">修改密码</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a> <a class="jui_cell"
				href="javascript:void(0);">
				<div class="jui_cell_bd jui_cell_primary">
					<lable class="jui_lable">实名认证</lable>
				</div>
				<div class="jui_cell_ft"></div>
			</a>
		</div> -->
		<footer class="footer">
			<p class="copy">
				©<span>2016</span>聚德购物商城
			</p>
			<p class="line">晋ICP备16009896号</p>
			<p class="line">微信公众账号：聚德购物商城</p>
		</footer>

	</div>
</body>
</html>