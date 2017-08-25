<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String mallPicImgPath = "/QAContentPic/";
	String onlineCommodImgPath = "/QASubjectPic/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="keywords"
	content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<base href="<%=basePath%>"></base>

<link rel="shortcut icon" href="#" type="image/png">
<title>AdminX</title>

<!--icheck-->
<link href="js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
<link href="js/iCheck/skins/square/square.css" rel="stylesheet">
<link href="js/iCheck/skins/square/red.css" rel="stylesheet">
<link href="js/iCheck/skins/square/blue.css" rel="stylesheet">

<!--pickers css-->
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-datepicker/css/datepicker-custom.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-timepicker/css/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-datetimepicker/css/datetimepicker-custom.css" />


<!--dashboard calendar-->
<link href="css/clndr.css" rel="stylesheet">

<!--Morris Chart CSS -->
<link rel="stylesheet" href="js/morris-chart/morris.css">

<!--common-->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
<link href="css/Pager.css" rel="stylesheet" type="text/css" />
<link href="css/doc2.css" rel="stylesheet">


<link href="js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
<link href="js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link rel="stylesheet" href="js/data-tables/DT_bootstrap.css" />
<link href="css/style-responsive.css" rel="stylesheet">

<style type="text/css">
	.uploadFile_div
	{
	    position: relative;
	}
	.uploadFile_div input
	{
	    opacity:0;
	    filter:alpha(opacity=0);
	    height: 95px;
	    width: 100px;
	    position: absolute;
	    top: 0;
	    left: 0;
	    z-index: 9;
	}
	.myTable td
	{
		word-wrap: break-word;
	}
</style>

</head>

<body class="sticky-header">
	<section>
		<!-- 左栏信息 -->
		<jsp:include page="/user1/getUserOperations.action"></jsp:include>

		<!-- main content start-->
		<div class="main-content">
			<!-- 头部信息 -->
			<jsp:include page="/user1/getLoginInfo.action"></jsp:include>

			<!-- page heading start-->
			<div class="page-heading">
				<h3>Q&A Management</h3>
				<ul class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath }/user/main.action">Home</a></li>
					<li><a href="#">Q&A Management</a></li>
					<li class="active">Q&A Opeartion</li>
				</ul>
			</div>
			<!-- page heading end-->

			<!--body wrapper start-->
			<div class="wrapper">
				<div class="row">
					<div class="col-sm-12">
						<section class="panel">
							<header class="panel-heading">
								Dynamic Table <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<div id="search-condition" class="search-condition row">
									<div class="col-md-6">
										<form class="form-inline" role="form">
											<div class="form-group col-md-4" style="padding-left:0">
												<input type="text" class="form-control"
													id="searchKey" placeholder="Question、Answer">
											</div>
											<div class="form-group col-md-6">
												<div class="input-group input-large custom-date-range"
													data-date="" data-date-format="yyyy/mm/dd">
													<input type="text" class="form-control dpd1" name="startDate"
														id = "searchStartDate" placeholder="Start Date"> <span
														class="input-group-addon">To</span> <input type="text"
														id = "searchEndDate" class="form-control dpd2" name="to" placeholder="End Date">
												</div>
											</div>
											<div class="form-group col-md-1">
												<button type="button" id="searchBtn" class="btn btn-primary">Search</button>
											</div>
										</form>
									</div>
									<!-- <div class="col-md-1">
									</div> -->
									<div class="col-md-5" style="padding-left:0">
										<div class="col-md-3" style="padding-left:0">
										<select class="form-control" name="statusSelect" id="statusSelect">
											<option value="0" checked="checked">Normal</option>
											<option value="-2">All Status</option>
											<option value="1">Disabled</option>
											<option value="2">Deleted</option>
										</select> 
										</div>
										<div class="col-md-3">
										<select class="form-control" name="typeSelect" id="typeSelect">
											<option value="-2" checked="checked">All Type</option>
										</select>
										</div>
										<div class="col-md-3">
										<select class="form-control" name="flagSelect" id="flagSelect">
											<option value="-2" checked="checked">All Flag</option>
										</select>
										</div>
										<div class="col-md-3">
										<select class="form-control" name="timeOrderBy" id="timeOrderBy">
											<option value="0" checked="checked">Time Desc</option>
											<option value="1">Time Asc</option>
										</select>
										</div>
									</div>
									<div class="col-md-1" style="padding-left:0;margin-left:0">
										<a href="#addModal" data-toggle="modal"><button type="button" id="addNewCommodityBtn" class="btn btn-primary">Add New</button></a>
									</div> 
								</div>
								<br/>
								<div class="adv-table">
									<table class="display table table-bordered myTable" 
										id="hidden-table-info" style="table-layout:fixed">
										<thead>
											<tr class="orderTr" id="theadTr">
												<th style="width:15%">Question</th>
												<th style="width:28%">Answer / Linked Url</th>
												<th style="width:7%">Picture</th>
												<th style="width:7%">Type</th>
												<th style="width:8%">Flag</th>
												<th style="width:7%">Status</th>
												<!-- <th style="width:5%">Extra</th> -->
												<th style="width:13%">ModifyTime</th>
												<th style="width:15%">Operation</th>
											</tr>
										</thead>
										<tbody id="commodityList">
										</tbody>
									</table>
								</div>
								<div id="pager_div" class="pager_div">
									<div id="pager"></div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To <input type="text"
										class="text-box" id="numberOfPages"> Page <input
										type="button" value="GO" class="sub-btn"
										onclick="javascript:orderListComp.goToPage();">
								</div>
							</div>
						</section>
						<section class="model">
							<!-- 修改商品类别 模态框 -->
							<div aria-hidden="true" aria-labelledby="myModalLabel"
								role="dialog" tabindex="-1" id="editModal" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- <div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal"
												class="close" type="button">×</button>
											<h4 class="modal-title">Update the Commodity Type</h4>
										</div> -->
										<div class="modal-body">
											<section class="panel">
												<header class="panel-heading"> Update the QA Information </header>
												<div class="panel-body">
													<form class="form-horizontal" role="form" id="editModalForm">
														<!-- <div class="form-group">
															<label for="commodityId_editModal"
																class="col-lg-2 col-sm-2 control-label">商品ID</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="commodityId_editModal"
																	id="commodityId_editModal" placeholder="商品ID" readonly="readonly">
																<p class="help-block">商品ID是商品唯一标识，有数据库自动生成，用户无法修改.</p>
															</div>
														</div> -->
														<div class="form-group">
															<label for="commodityName_editModal"
																class="col-lg-2 col-sm-2 control-label">Question</label>
															<div class="col-lg-10">
																<input type="hidden" class="form-control" name="id"
																	id="commodityId_editModal" placeholder="商品ID">
																<input type="text" class="form-control" name="question"
																	id="commodityName_editModal" placeholder="The Question">
																<!-- <p class="help-block">The Question will be display on the front web site.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commoditySeq_editModal"
																class="col-lg-2 col-sm-2 control-label">Answer</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="answer"
																	id="commoditySeq_editModal" placeholder="The Answer">
																<!-- <p class="help-block">The Answer will be display on the front web site.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commoditySeq_editModal"
																class="col-lg-2 col-sm-2 control-label">Url</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="url"
																	id="commodityUrl_editModal" placeholder="The Url">
																<!-- <p class="help-block">The Url will be display on the front web site.</p> -->
															</div>
														</div>
														<!-- <div class="form-group">
															<label for="commoditySeq_editModal"
																class="col-lg-2 col-sm-2 control-label">PicUrl</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="picUrl"
																	id="commodityPicUrl_editModal" placeholder="The Picture's Url">
																<p class="help-block">The PicUrl will be display on the front web site.</p>
															</div>
														</div> -->
														<div class="form-group">
															<label for="commoditySeq_editModal"
																class="col-lg-2 col-sm-2 control-label">PicUrl</label>
															<div class="col-lg-10">
																<img alt="" src="" style="width:50px;height:50px" id="picUrl_img_editModal" onclick="imgClicked_edit_editModal('picUrl_upload_editModal')"/>
																<script type="text/javascript">
																	function imgClicked_edit_editModal(id)
																	{
																		$('#editModal' + ' ' + '#'+id).click();
																	}
																	function fileSelected_edit_editModal(o,id){
																		var val = o.value;
																		$('#editModal' + ' ' + '#'+id).attr('src',"");
																		$('#editModal' + ' ' + '#'+id).attr('alt',val.split("\\")[val.split("\\").length-1]);
																	}
																</script>
															</div>
															<div class="col-lg-10">
																<input type="file"  style="display:none" id="picUrl_upload_editModal" name="img" onchange="fileSelected_edit_editModal(this,'picUrl_img_editModal')">
															</div>
														</div>
														<div class="form-group">
															<label for="commodityStatus_editModal"
																class="col-lg-2 col-sm-2 control-label">Status</label>
															<div class="col-lg-10">
																<select name="status" id="commodityStatus_editModal">
																	<option value="-2">--- Modify the question status --</option>
																	<option value="0">Normal</option>
																	<option value="1">Disabled</option>
																	<option value="2">Deleted</option>
																</select>
																<!-- <p class="help-block">Please select the Status.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commodityType_editModal"
																class="col-lg-2 col-sm-2 control-label">Question Type</label>
															<div class="col-lg-10">
																<select name="typeId" id="commodityType_editModal">
																	<option value="-2">--- Modify the question type --</option>
																</select>
																<!-- <p class="help-block">Please select the question type.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commodityFlag_editModal"
																class="col-lg-2 col-sm-2 control-label">Question Flag</label>
															<div class="col-lg-10">
																<select name="flagId" id="commodityFlag_editModal">
																	<option value="-2">--- Modify the question flag --</option>
																</select>
																<!-- <p class="help-block">Please select hte question flag.</p> -->
															</div>
														</div> 
														<div class="form-group">
															<div class="col-lg-offset-2 col-lg-2">
																<button type="button" id="editModalSubmitBtn" class="btn btn-primary">确定</button>
															</div>
															<div class="col-lg-8">
															<button type="button" class="btn btn-default"
																data-dismiss="modal"">关闭</button>
															</div>
														</div>
													</form>
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>
							<!-- 添加商品类别 模态框 -->
							<div aria-hidden="true" aria-labelledby="myModalLabel"
								role="dialog" tabindex="-1" id="addModal" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- <div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal"
												class="close" type="button">×</button>
											<h4 class="modal-title">Update the Commodity Type</h4>
										</div> -->
										<div class="modal-body">
											<section class="panel">
												<header class="panel-heading"> Add New QA Information </header>
												<div class="panel-body">
													<form class="form-horizontal" role="form" id="addModalForm">
														<div class="form-group">
															<label for="commodityName_addModal"
																class="col-lg-2 col-sm-2 control-label">Question</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="question"
																	id="commodityName_addModal" placeholder="The Question">
																<!-- <p class="help-block">The Question will be display on the front web site.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commoditySeq_addModal"
																class="col-lg-2 col-sm-2 control-label">Answer</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="answer"
																	id="commoditySeq_addModal" placeholder="The Answer">
																<!-- <p class="help-block">The Answer will be display on the front web site.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commodityUrl_addModal"
																class="col-lg-2 col-sm-2 control-label">Url</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="url"
																	id="commodityUrl_addModal" placeholder="The Url">
																<!-- <p class="help-block">The Url will be display on the front web site.</p> -->
															</div>
														</div>
														<!-- <div class="form-group">
															<label for="commodityPicUrl_addModal"
																class="col-lg-2 col-sm-2 control-label">PicUrl</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="picUrl"
																	id="commodityPicUrl_addModal" placeholder="The Picture's Url">
																<p class="help-block">The PicUrl will be display on the front web site.</p>
															</div>
														</div> -->
														<div class="form-group">
															<label for="picUrl_img_addModal"
																class="col-lg-2 col-sm-2 control-label">PicUrl</label>
															<div class="col-lg-10">
																<img alt="" src="" style="width:50px;height:50px" id="picUrl_img_addModal" onclick="imgClicked_edit_addModal('picUrl_upload_addModal')"/>
																<script type="text/javascript">
																	function imgClicked_edit_addModal(id)
																	{
																		$('#addModal' + ' ' + '#'+id).click();
																	}
																	function fileSelected_edit_addModal(o,id){
																		var val = o.value;
																		$('#addModal' + ' ' + '#'+id).attr('src',"");
																		$('#addModal' + ' ' + '#'+id).attr('alt',val.split("\\")[val.split("\\").length-1]);
																	}
																</script>
															</div>
															<div class="col-lg-10">
																<input type="file"  style="display:none" id="picUrl_upload_addModal" name="img" onchange="fileSelected_edit_addModal(this,'picUrl_img_addModal')">
															</div>
														</div>
														<div class="form-group">
															<label for="commodityStatus_addModal"
																class="col-lg-2 col-sm-2 control-label">Status</label>
															<div class="col-lg-10">
																<select name="status" id="commodityStatus_addModal">
																	<option value="-2">--- Modify the question status --</option>
																	<option value="0">Normal</option>
																	<option value="1">Disabled</option>
																	<option value="2">Deleted</option>
																</select>
																<!-- <p class="help-block">Please select the Status.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commodityType_addModal"
																class="col-lg-2 col-sm-2 control-label">Question Type</label>
															<div class="col-lg-10">
																<select name="typeId" id="commodityType_addModal">
																	<option value="-2">--- Modify the question type --</option>
																</select>
																<!-- <p class="help-block">Please select the question type.</p> -->
															</div>
														</div>
														<div class="form-group">
															<label for="commodityFlag_addModal"
																class="col-lg-2 col-sm-2 control-label">Question Flag</label>
															<div class="col-lg-10">
																<select name="flagId" id="commodityFlag_addModal">
																	<option value="-2">--- Modify the question flag --</option>
																</select>
																<!-- <p class="help-block">Please select hte question flag.</p> -->
															</div>
														</div> 
														<div class="form-group">
															<div class="col-lg-offset-2 col-lg-2">
																<button type="button" id="addModalSubmitBtn" class="btn btn-primary">确定</button>
															</div>
															<div class="col-lg-8">
															<button type="button" class="btn btn-default"
																data-dismiss="modal"">关闭</button>
															</div>
														</div>
													</form>
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>
							<!-- 商品详情 模态框 -->
							<div aria-hidden="true" aria-labelledby="myModalLabel"
								role="dialog" tabindex="-1" id="commodityDetailModal" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<section class="panel">
												<header class="panel-heading"> 更新商品详情 </header>
											<!-- 	<header class="panel-heading">
													CKEditor <span class="tools pull-right"> <a
														class="fa fa-chevron-down" href="javascript:;"></a> <a
														class="fa fa-times" href="javascript:;"></a>
													</span>
													</header> -->
													
												<div class="panel-body">
													<div class="form-group">
														<form action="#" class="form-horizontal" id="updateDetailForm">
															<div class="form-group">
																<div class="col-sm-12">
																	<input type="hidden"  name="id" id="commodityId_detail_modal"
																		rows="6"></textarea>
																	<textarea class="form-control ckeditor" name="editor1" id="ckeditorTxArea"
																		rows="6"></textarea>
																</div>
															</div>
														</form>
													</div>
													<div class="form-group">
														<div class="col-lg-offset-2 col-lg-2">
															<button type="button" id="commodityDetailModalSubmitBtn" class="btn btn-primary">确定</button>
														</div>
														<div class="col-lg-8">
														<button type="button" class="btn btn-default"
															data-dismiss="modal"">关闭</button>
														</div>
													</div>
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			<!--body wrapper end-->
			<jsp:include page="/user1/footer.action"></jsp:include>
		</div>
	</section>
	


	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/jquery.pager1.js"></script>
	<!-- <script src="js/jquery_002.js"></script> -->
	<!--common scripts for all pages-->
	<script src="js/scripts.js"></script>


	<!--pickers plugins-->
	<script type="text/javascript"
		src="js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

	<!--pickers initialization-->
	<script src="js/pickers-init.js"></script>

	<!--data table-->
	<script type="text/javascript"
		src="js/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="js/data-tables/DT_bootstrap.js"></script>

	<!--script for editable table-->
	<script src="js/editable-table.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/common/layer.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/common/template.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/common/base.js"></script>
	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
	<script src="js/qaEntityList.js"></script>
	<script type="text/javascript">
		var basePath = '<%=basePath%>';
		var onlineCommodImgPath = '<%=onlineCommodImgPath%>';
	</script>
</body>
</html>