<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>
<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=today-visit"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>On-Site Sales | SangJa Admin</title>
<meta name="keywords" content="SangJa Admin" />
<meta name="description" content="SangJa Admin">
<meta name="author" content="Sangja">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
/>

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light"
	rel="stylesheet" type="text/css"
>

<!-- Vendor CSS -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,300,400,600,700,800,900"
	rel="stylesheet" type="text/css"
>

<!-- Vendor CSS -->
<link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.css" />

<link rel="stylesheet" href="../resources/vendor/animate/animate.compat.css">
<link rel="stylesheet" href="../resources/vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet" href="../resources/vendor/boxicons/css/boxicons.min.css" />
<link rel="stylesheet" href="../resources/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet" href="../resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../resources/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="../resources/vendor/datatables/media/css/dataTables.bootstrap5.css" />
<link rel="stylesheet" href="../resources/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<link rel="stylesheet" href="../resources/vendor/select2/css/select2.css" />
<link rel="stylesheet" href="../resources/vendor/select2-bootstrap-theme/select2-bootstrap.min.css" />


<!-- Theme CSS -->
<link rel="stylesheet" href="../resources/css/theme.css" />

<!-- Theme Layout -->
<link rel="stylesheet" href="../resources/css/layouts/modern.css" />

<!-- Skin CSS -->
<link rel="stylesheet" href="../resources/css/skins/default.css" />

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="../resources/css/custom.css">

<!-- Head Libs -->
<script src="../resources/vendor/modernizr/modernizr.js"></script>

</head>
<body>
	<section class="body">

		<!-- start: header -->
		<c:set var="firstmenu_code" value='2' />
		<c:set var="secondmenu_code" value='1' />
		<c:set var="third_code" value='2' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->



		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->


			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">On-Site</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Sales</span></li>

							<li><span>Sales Management </span></li>

							<li><span>On-Site Sales</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->
				<div class="ecommerce-form-sidebar-overlay-wrapper">
					<div class="ecommerce-form-sidebar-overlay-body">
						<a href="#" class="ecommerce-form-sidebar-overlay-close"><i class="bx bx-x"></i></a>
						<div class="scrollable h-100 loading-overlay-showing" data-plugin-scrollable>
							<div class="loading-overlay">
								<div class="bounce-loader">
									<div class="bounce1"></div>
									<div class="bounce2"></div>
									<div class="bounce3"></div>
								</div>
							</div>
							<div class="ecommerce-form-sidebar-overlay-content scrollable-content px-3 pb-3 pt-1"></div>
						</div>
					</div>
				</div>

				<form class="order-details action-buttons-fixed" name="saveSales" method="post" action="#"
					id="saveSales"
				>
					<input type="hidden" id="editmode" value="${editMode}">
					<div class="row">
						<div class="col-xl-12">
							<div class="card card-modern">
								<div class="card-header">
									<h2 class="card-title">Customer Info</h2>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12 mb-4 mb-lg-0">
											<div class="form-row">
												<div class="form-group col mb-3">
													<label>Order #</label>
													<input type="text" name="sale_num" value="${salenum}" id="sale_num"
														class="form-control" readonly="readonly"
													>${salevo.sale_num }
													<input type="hidden" name="sale_user_num" value="${sess_user.user_num}"
														id="sale_user_num" class="form-control" readonly="readonly"
													>
												</div>
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text">
													<i class="fas fa-store"></i>
												</span>
												<!-- 모든 주소중 셀렉트 검색하여 찾기 -->
												<select id="selectaddress" name="selectaddress" data-plugin-selectTwo
													class="form-control populate" data-plugin-options='{ "minimumInputLength": 2 }'
													title="Please search address"
												>
													<option value="">Choose Address</option>
													<c:forEach items="${cuList}" var="cuList" varStatus="status">
														<option value="${cuList.cust_num}"><span class="name">${cuList.cust_nm}</span>,
															<span class="address">${cuList.addr}</span>,
															<span class="city">${cuList.city}</span>,
															<span class="state">${cuList.state}</span>,
															<span class="zip">${cuList.zip_code}</span>
														</option>
													</c:forEach>
												</select>
												<!--모든 주소중 셀렉트 검색하여 찾기 끝-->

												<!-- 검색버튼 눌러서 주소 찾기 
													<input type="text" class="form-control" placeholder="Address Search">
													<a href="#searchForm" class="btn btn-default modal-with-form" type="button"><i class="fas fa-search"></i></a>
													<!-- search start -->
												<div id="searchForm" class="modal-block modal-block-md mfp-hide">
													<section class="card">
														<header class="card-header">
															<h2 class="card-title">Customer List</h2>
														</header>
														<div class="card-body">
															<div class="datatables-header-footer-wrapper">
																<table class="table table-ecommerce-simple mb-0" id="search-default">
																	<thead>
																		<tr>
																			<th></th>
																			<th>Name</th>
																			<th>Addrsss</th>
																			<th>City</th>
																			<th>State</th>
																			<td>Zip Code</td>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${cuList}" var="cuList" varStatus="status">
																			<tr>
																				<td><input type="radio" id="searchAddress{$status.count}"
																						name="searchAddress"
																					></td>
																				<td>${cuList.cust_nm}</td>
																				<td>${cuList.addr}</td>
																				<td>${cuList.city}${cuList.city},${cuList.state}${cuList.zip_code}</td>
																				<td>${cuList.state}</td>
																				<td>${cuList.zip_code}</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
														<footer class="card-footer">
															<div class="row">
																<div class="col-md-12 center">
																	<button class="btn btn-primary modal-confirm">Add Customer</button>
																	<button class="btn btn-default modal-dismiss">Cancel</button>
																</div>
															</div>
														</footer>
													</section>
												</div>
												<!-- modelForm end -->
												<!-- 검색버튼 눌러서 주소 찾기 끝 -->
											</div>

											<ul class="list list-unstyled list-item-bottom-space-0">
												<li><label>Name</label> <input type="hidden" name="cust_num" id="cust_num"
														value="${salevo.cust_num }" class="form-control"
													> <input type="text" name="cust_nm" id="cust_nm" value="${salevo.cust_nm }"
														class="form-control"
													></li>
												<li><label>Address</label> <input type="text" name="addr" id="addr"
														value="${salevo.addr }" class="form-control"
													></li>
												<li><label>City</label> <input type="text" name="city" id="city"
														value="${salevo.city }" class="form-control"
													></li>
												<li><label>State</label> <input type="text" name="state" id="state"
														value="${salevo.state }" class="form-control"
													></li>
												<li><label>Zip Code</label> <input type="text" name="zip_code" id="zip_code"
														value="${salevo.zip_code }" class="form-control"
													></li>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col">

							<div class="card card-modern">
								<div class="card-header">
									<h2 class="card-title">Products</h2>
								</div>
								<div class="card-body">
									<div class="form-group row pb-4">
										<div>
											<a class="col-lg-2 modal-with-form btn btn-primary btn-md btn-py-1 px-4 "
												href="#modalForm"
											>Add <i class="fas fa-plus"></i></a> <a
												class="col-lg-3 modal-with-form btn btn-primary btn-md btn-py-1 px-4 "
												href="#modalBarcode"
											>Add By Barcode <i class="fas fa-plus"></i></a>
										</div>
										<!-- modelBarcode start -->
										<div id="modalBarcode" class="modal-block modal-block-md mfp-hide">
											<div class="card-body  form-group row">
												<div class="col-4">
													<select class="form-control" id="borcode-option" required>
														<option value="sales" selected>Sales</option>
														<option value="credit">Credit</option>
														<option value="sample">Sample</option>
														<option value="defecitve-return">Defecitve Return</option>
													</select>
												</div>
												<div class="col">
													<input type="text" class="upccode form-control" id="bar-code"
														placeholder="Search UPCCode" onkeydown="bar_code_read(this.value);"
													>
												</div>
												<div class="col-3">
													<button class="btn btn-default modal-dismiss">Close</button>
												</div>
											</div>
										</div>
										<!-- modelForm start -->
										<div id="modalForm" class="modal-block modal-block-md mfp-hide">
											<section class="card">
												<header class="card-header">
													<h2 class="card-title">Product List</h2>
												</header>
												<div class="card-body">
													<div class="datatables-header-footer-wrapper">

														<div>
															<div class="d-flex align-items-lg-center flex-column flex-lg-row">
																<label class="ws-nowrap me-3 mb-0">Option:</label> <select
																	class="form-control form-control-sm" id="popup-option"
																>
																	<option value="sales">Sales</option>
																	<option value="credit">Credit</option>
																	<option value="sample">Sample</option>
																	<option value="defecitve-return">Defecitve Return</option>
																</select>
															</div>
														</div>
														<div class="datatable-header">
															<div class="row align-items-center mb-0">
																<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
																	<div class="d-flex align-items-lg-center flex-column flex-lg-row">
																		<label class="ws-nowrap me-3 mb-0">Show:</label> <select
																			class="form-control results-per-page" name="results-per-page"
																		>
																			<option value="10" selected>5</option>
																			<option value="25">10</option>
																		</select>
																	</div>
																</div>
																<div class="col-8 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
																	<div class="d-flex align-items-lg-center flex-column flex-lg-row">
																		<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
																			class="form-control filter-by" name="filter-by" id="filter-by"
																		>
																			<option value="all" selected>All</option>
																			<option value="1">Category</option>
																			<option value="2">UPC Code</option>
																			<option value="3">Item</option>
																			<option value="4">Unit Price</option>
																		</select>
																	</div>
																</div>
																<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
																	<div class="search search-style-1-lg mx-lg-auto">
																		<div class="input-group">
																			<input type="text" class="search-term form-control" name="search-term"
																				id="search-term" placeholder="Search Product"
																			>
																			<button class="btn btn-default" type="submit">
																				<i class="bx bx-search"></i>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<table class="table table-ecommerce-simple mb-0" id="addproduct-ecommerce-list">
															<thead>
																<tr>
																	<th width="3%"><input type="checkbox" name="select-all"
																			class="select-all checkbox-style-1 p-relative top-2" value=""
																		/></th>
																	<th width="10%">Category</th>
																	<th width="10%">UPC Code</th>
																	<th width="72%">Item</th>
																	<th width="5%">Unit Price($)</th>
																</tr>
															</thead>
															<tbody>

																<c:forEach items="${pcList}" var="pcList" varStatus="status">
																	<tr>
																		<td><input type="checkbox" name="checkboxRow1"
																				class="checkbox-style-1 p-relative top-2" value="${pcList.prd_mng_num}"
																				onclick="getCheckboxValue(event)"
																			/></td>
																		<td>${pcList.ctgry_nm}</td>
																		<td>${pcList.upc_code}</td>
																		<td>${pcList.prd_nm}</td>
																		<td><fmt:formatNumber value="${pcList.unit_price}" pattern="#,##0.00" /></td>
																	</tr>
																</c:forEach>

															</tbody>
														</table>
													</div>
												</div>
												<footer class="card-footer">
													<div class="row">
														<div class="col-md-12 center">
															<button class="btn btn-primary modal-confirm px-4" id="addBtn">Add</button>
															<button class="btn btn-default modal-dismiss">Cancel</button>
														</div>
														<input type="hidden" id="check_result">
													</div>
												</footer>
											</section>
										</div>
										<!-- modelForm end -->
									</div>
									<div class="row justify-content-md-center" id="saleprodList">
										<div class="col-lg-12">
											<div class="table-responsive pb-4">
												<table class="table table-responsive-md table-hover mb-0" style="min-width: 500px;"
													id="saleprodTbl"
												>
													<thead>
														<tr>
															<th>#</th>
															<th>Item</th>
															<th>Option</th>
															<th>Uint Price($)</th>
															<th>Sales price($)</th>
															<th>Qty</th>
															<th>Amount($)</th>
															<th>Delete</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${spvoList}" var="spvoList" varStatus="status">
															<tr>
																<td>${status.count}</td>
																<td><input type="hidden" name="SaleProdVOList[${status.count-1}].prd_mng_num"
																		value="${spvoList.prd_mng_num}"
																	> <input type="hidden" name="SaleProdVOList[${status.count-1}].prd_nm"
																		value="${spvoList.prd_nm}"
																	>${spvoList.prd_nm}</td>
																<!-- 
																<c:choose>
																	<c:when test="${spvoList.sale_opt eq 'sales'}">
																		<c:set var="select1" value='selected' />
																		<c:set var="select2" value='' />
																		<c:set var="select3" value='' />
																		<c:set var="select4" value='' />
																	</c:when>
																	<c:when test="${spvoList.sale_opt eq 'credit'}">
																		<c:set var="select1" value='' />
																		<c:set var="select2" value='selected' />
																		<c:set var="select3" value='' />
																		<c:set var="select4" value='' />
																	</c:when>
																	<c:when test="${spvoList.sale_opt eq 'sample'}">
																		<c:set var="select1" value='' />
																		<c:set var="select2" value='' />
																		<c:set var="select3" value='selected' />
																		<c:set var="select4" value='' />
																	</c:when>
																	<c:when
																		test="${spvoList.sale_opt eq 'defecitve-return'}">
																		<c:set var="select1" value='' />
																		<c:set var="select2" value='' />
																		<c:set var="select3" value='' />
																		<c:set var="select4" value='selected' />
																	</c:when>
																	<c:otherwise>
																		<c:set var="select1" value='' />
																		<c:set var="select2" value='' />
																		<c:set var="select3" value='' />
																		<c:set var="select4" value='' />
																	</c:otherwise>
																</c:choose>
 															    -->
																<td><input type="hidden" name="SaleProdVOList[${status.count-1}].sale_opt"
																		value="${spvoList.sale_opt}"
																	>${spvoList.sale_opt} <!--  select class="form-control form-control-sm"
																	name="SaleProdVOList[${status.count-1}].sale_opt"
																	required>
																		<option value="sales" ${select1}>Sales</option>
																		<option value="credit" ${select2}>Credit</option>
																		<option value="sample" ${select3}>Sample</option>
																		<option value="defecitve-return" ${select4}>Defecitve
																			Return</option>
																</select --></td>
																<td><input type="text" class="form-control form-control-sm"
																		style="min-width: 60px;" name="SaleProdVOList[${status.count-1}].unit_price"
																		value="<fmt:formatNumber value="${spvoList.unit_price}" pattern="#,##0.00"/>"
																		readonly
																	></td>
																<td><input type="text" class="form-control form-control-sm"
																		style="min-width: 60px;" name="SaleProdVOList[${status.count-1}].sale_price"
																		value="<fmt:formatNumber value="${spvoList.sale_price}" pattern="#,##0.00"/>"
																		onKeyUp="removeChar(event);inputNumberFormat(this);"
																		onKeyDown="inputNumberFormat(this);" onchange="getVal(this);"
																	></td>
																<td><input type="text" class="form-control form-control-sm"
																		name="SaleProdVOList[${status.count-1}].sale_qty" value="${spvoList.sale_qty}"
																		onchange="getVal(this);"
																	></td>
																<td><input type="text" class="form-control form-control-sm"
																		style="min-width: 60px;" name="SaleProdVOList[${status.count-1}].tot_sale_price"
																		value="<fmt:formatNumber value="${spvoList.tot_sale_price}" pattern="#,##0.00"/>"
																	></td>
																<td><button class="btn btn-danger btn-sm" onclick="deleterow(this);">
																		<i class="fas fa-times"></i></td>
															</tr>
															<c:set var="rowcnt" value='${status.count}' />
														</c:forEach>

													</tbody>
												</table>
											</div>

											<div class="row justify-content-end">
												<button class="col-lg-3 btn btn-success btn-md btn-py-1 px-4"
													onclick="calcTotal();return false;"
												>
													Update <i class="fas fa-sync-alt"></i>
											</div>
											<div class="row justify-content-end">
												<div class="col-auto">
													Discount
													<input type="text" name="discount_amt" id="discount_amt"
														value="<fmt:formatNumber value="${salevo.discount_amt}" pattern="#,##0.00" />"
														class="form-control form-control-sm" onKeyUp="removeChar(event);"
														"
														onChange="inputNumberFormat(this);calcTotal();"
													>
												</div>
											</div>
											<div class="row justify-content-end">

												<div class="col-auto">
													<h3 class="font-weight-bold text-color-dark text-4 mb-3">Order Total</h3>
													<span class="d-flex align-items-center">
														<span class="item-cnt">${rowcnt}</span>
														&nbsp;Items <i class="fas fa-chevron-right text-color-primary px-3"></i>
														<span class="d-flex align-items-center justify-content-lg-end">
															<strong class="text-color-dark text-5">$ &nbsp; <span class="total-sale-amt">
																	<fmt:formatNumber value="${salevo.tot_sale_amt}" pattern="#,##0.00" />
																</span> <input class="total-sale-amt-val" type="hidden" name="tot_sale_amt" value="0">
															</strong>
														</span>
													</span>
												</div>
											</div>
											<div class="row justify-content-end mt-3">
												<button class="col-lg-3 btn btn-dark btn-px-4 py-3 font-weight-semibold line-height-1"
													onclick="saleSave();return false;"
												>
													<!--  mkPrnFile('${salevo.sale_num}'); -->
													<i class="bx bx-printer text-4 me-2"></i> Print invoice
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col">

							<div class="card card-modern">
								<div class="card-header">
									<h2 class="card-title">Pay By</h2>
								</div>
								<div class="card-body">
									<div class="row justify-content-center mb-4">
										<div class="col-lg-2">
											<div class="radio-custom radio-primary">
												<input name="pay_type" type="radio" id="cash" checked="checked" value="cash"
													onchange="setDisplay()"
												>
												<label for="cash" class="text-4">Cash</label>
											</div>
										</div>
										<div class="col-lg-2">
											<div class="radio-custom radio-primary">
												<input id="moneyorder" name="pay_type" type="radio" value="moneyorder"
													onchange="setDisplay()"
												>
												<label for="moneyorder" class="text-4">Money Order</label>
											</div>
										</div>
										<div class="col-lg-2">
											<div class="radio-custom radio-primary form-check-inline">
												<input id="check" name="pay_type" type="radio" value="check" onchange="setDisplay()">
												<label for="check" class="text-4">Check</label>
											</div>
										</div>
										<div class="col-lg-3">
											<div class="radio-custom radio-primary form-check-inline">
												<input id="ar" name="pay_type" type="radio" value="ar" onchange="setDisplay()">
												<label for="ar" class="text-4">AR<span class="text-1">(Account
														Receivable)</span></label>
											</div>
										</div>
										<div class="col-lg-2">
											<div class="radio-custom radio-primary form-check-inline">
												<input id="bymail" name="pay_type" type="radio" value="bymail" onchange="setDisplay()">
												<label for="bymail" class="text-4">By Mail</label>
											</div>
										</div>
									</div>

									<!-- cash Money Order -->
									<div id="payment" class="row justify-content-center">
										<div class="col-lg-12 alert alert-default">
											<h4 class="font-weight-bold text-dark">Payment Amount</h4>
											<div class="row">
												<div class="col-lg-3">
													<div class="input-group my-2">
														<span class="input-group-text">$</span>
														<input type="text" id="pay_amt1" name="pay_amt" class="pay_amt1 form-control"
															value="0"
														>
													</div>
												</div>
												<c:choose>
													<c:when test="${editMode eq 'new' }">
														<!-- button class="col-lg-3 btn btn-success my-2"
															onclick="alert('You need to save first.'); return false;">Pay</button-->
														<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
													</c:when>
													<c:otherwise>
														<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>

									<!-- check -->
									<div id="checkpayment" class="row justify-content-center" style="display: none">
										<div class="col-lg-12 alert alert-default">
											<h4 class="font-weight-bold text-dark">Payment Amount</h4>
											<div class="row">
												<div class="col-lg-auto">
													<div class="input-group my-2">
														<span class="input-group-text text-2">Check #</span>
														<input type="text" name="check_no" id="check_no" class="form-control" maxlength="60"
															style="width: 80px"
														>
													</div>
												</div>
												<div class="col-lg-3">
													<div class="input-group my-2">
														<span class="input-group-text">$</span>
														<input type="text" id="pay_amt2" name="pay_amt" class="pay_amt2 form-control"
															value="0"
														>
													</div>
												</div>
												<c:choose>
													<c:when test="${editMode eq 'new' }">
														<!--  button class="col-lg-3 btn btn-success my-2"
															onclick="alert('You need to save first.'); return false;">Pay</button-->
														<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
													</c:when>
													<c:otherwise>
														<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
													</c:otherwise>
												</c:choose>


											</div>
										</div>
									</div>

									<div id="invoice" class="row justify-content-center" style="display: none">

										<div class="col-lg-12 alert alert-default">
											<h4 class="font-weight-bold text-dark">Invoice Save</h4>
											<div class="row">
												<div class="col-lg-auto">
													<div class="fileupload fileupload-new my-2" data-provides="fileupload">
														<div class="input-append">
															<div class="uneditable-input">
																<i class="fas fa-file fileupload-exists"></i>
																<span class="fileupload-preview"></span>
															</div>
															<span class="btn btn-default btn-file">
																<span class="fileupload-exists">Change</span>
																<span class="fileupload-new">Select Invoice</span>
																<input type="file" id="upload_file" name="upload_file" accept=".gif, .jpg, .png" />
															</span>
															<a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Remove</a>
														</div>
													</div>
												</div>
												<button class="col-lg-3 btn btn-success my-2" onclick="fileUpload(); return false;">Save
													Invoice</button>
											</div>
										</div>

									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="row" id="paylist">
						<div class="col">

							<div class="card card-modern">
								<div class="card-header">
									<h2 class="card-title">Account Receivable</h2>
								</div>
								<div class="card-body">
									<c:forEach items="${saleList}" var="saleList" varStatus="status">
										<div class="alert alert-info mb-2">
											<div class="row">
												<div class="col-lg-5 mb-2">
													<span class="text-4 px-2">
														<strong>${saleList.sale_ymd}</strong>
													</span>
													<span class="text-4 px-2">
														<strong> <span class="text-2 px-2">
																$
																<fmt:formatNumber value="${saleList.tot_ord_amt}" pattern="#,##0.00" />
																($
																<fmt:formatNumber value="${saleList.tot_pay_amt}" pattern="#,##0.00" />
																)
															</span> $ <fmt:formatNumber value="${saleList.tot_ord_amt - saleList.tot_pay_amt}"
																pattern="#,##0.00"
															/>

														</strong>
													</span>
												</div>
												<div class="col-lg-7">
													<div class="row justify-content-end">
														<a href="order-detail.html"
															data-ajax-url="ajax-onsite-ar-detail?sale_num=${saleList.sale_num}"
															class="ecommerce-sidebar-link col-lg-5 btn btn-info"
														>Check a history</a>
													</div>
												</div>

											</div>
										</div>
									</c:forEach>
								</div>

							</div>

						</div>
					</div>
					<div class="row action-buttons">
						<div class="col-12 col-md-auto">
							<c:choose>
								<c:when test="${umvo.write_yn eq 'y'}">
									<button type="button"
										class="btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading..." onclick="check_save()"
									>
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="alert('You do not have permission to write.');return false;"
										class="btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading..."
									>
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:otherwise>
							</c:choose>

						</div>
						<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
							<a href="order-list"
								class="btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3"
							>Cancel</a>
						</div>
						<c:choose>
							<c:when test="${umvo.delete_yn eq 'y'}">
								<div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
									<a href="#" onclick="del_sales('${salenum}')"
										class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
									><i class="bx bx-trash text-4 me-2"></i> Delete </a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
									<a href="#" onclick="alert('You do not have permission to write.');return false;"
										class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
									><i class="bx bx-trash text-4 me-2"></i> Delete </a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</form>

				<!-- end: page -->
			</section>
		</div>

	</section>

	<!-- Vendor -->
	<script src="../resources/vendor/jquery/jquery.js"></script>
	<script src="../resources/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="../resources/vendor/popper/umd/popper.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../resources/vendor/common/common.js"></script>
	<script src="../resources/vendor/nanoscroller/nanoscroller.js"></script>
	<script src="../resources/vendor/magnific-popup/jquery.magnific-popup.js"></script>
	<script src="../resources/vendor/jquery-placeholder/jquery.placeholder.js"></script>

	<!-- Specific Page Vendor -->
	<script src="../resources/vendor/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="../resources/vendor/datatables/media/js/dataTables.bootstrap5.min.js"></script>
	<script src="../resources/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="../resources/vendor/fuelux/js/spinner.js"></script>
	<script src="../resources/vendor/autosize/autosize.js"></script>
	<script src="../resources/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script src="../resources/vendor/select2/js/select2.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<!-- Examples -->
	<script src="../resources/js/examples/onsite.datatables.default.js"></script>
	<script src="../resources/js/examples/examples.modals.js"></script>
	<script src="../resources/js/examples/onsite.sidebar.overlay.js"></script>
	<script src="../resources/js/examples/examples.advanced.form.js"></script>
	<script src="../resources/js/examples/sales.addproduct.datatables.list.js"></script>

	<script>
		function setDisplay() {
			if ($('input:radio[id=cash]').is(':checked')) {
				$('#payment').show();
				$('#checkpayment').hide();
				$('#invoice').hide();
			} else if ($('input:radio[id=moneyorder]').is(':checked')) {
				$('#payment').show();
				$('#checkpayment').hide();
				$('#invoice').hide();
			} else if ($('input:radio[id=check]').is(':checked')) {
				$('#payment').hide();
				$('#checkpayment').show();
				$('#invoice').hide();
			} else if ($('input:radio[id=ar]').is(':checked')) {
				$('#payment').hide();
				$('#checkpayment').hide();
				$('#invoice').show();
			} else if ($('input:radio[id=bymail]').is(':checked')) {
				$('#payment').hide();
				$('#checkpayment').hide();
				$('#invoice').show();
			}
		}
	</script>
	<script>
		$("#addBtn")
				.click(
						function() {
							
							 var result = '';
							  var oldResult=document.getElementById('check_result').value;
							  var arr=oldResult.split(",");
							  if(arr.length>0){
								  for(var i=0;i<arr.length-1;i++){
									
									  var formData = new FormData();
									  formData.append("prod_num", arr[i]);
									  $.ajax({
											type : "POST",				
											url : "sale-prod-add-num",
											data : formData,
											processData:false,
											contentType:false,
											dataType:"text",
											async: false,
											success : function(data) {
												//log.textContent = data;
												//var contact=JSON.parse(data); 
												//alert(contact["ctgry_mng_num"]);
												prod_add2(data);
												//document.getElementById('bar-code').value="";
												//document.getElementById('bar-code').focus();
												
												
											},
											error : function(request, status, error) {
												alert("code:" + request.status + "\n" + "message:"
														+ request.responseText + "\n" + "error:" + error);
											}
										});	
									  
								  }
						  	}
							calcTotal();
							checkClear();
						});

		function deleterow(obj) {
			var tr = $(obj).parent().parent();
			tr.remove();
			calcTotal();
		}

		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
				return;
			else
				//숫자와 소수점만 입력가능
				event.target.value = event.target.value.replace(/[^-\.0-9]/g,
						"");
		}
		//콤마 찍기
		function comma(obj) {

			var bExists = obj.indexOf(".");//0번째부터 .을 찾는다.
			if (bExists > -1) {
				strArr = obj.split('.')
				//. 소수점 문자열이 발견되지 않을 경우 -1 반환
				obj = strArr[0].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')
						+ "." + strArr[1].padEnd(2, '0');
			} else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환 
				obj = obj.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + ".00";
			}
			return obj;//문자열 반환
		}
		//콤마 풀기
		function uncomma(str) {
			str = "" + str.replace(/,/gi, ''); // 콤마 제거 
			str = str.replace(/(^\s*)|(\s*$)/g, ""); // trim()공백,문자열 제거 
			return (new Number(str));//문자열을 숫자로 반환
		}
		//input box 콤마달기
		function inputNumberFormat(obj) {
			obj.value = comma(obj.value);
		}
		//input box 콤마풀기 호출
		function uncomma_call() {
			var input_value = document.getElementById('input1');
			input_value.value = uncomma(input_value.value);
		}
		function commaStr(str) {
			str = String(str);
			str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			try{
				var arr=str.split(".");
				str=arr[0]+"."+arr[1].padEnd(2,"0");
			}catch{
				str=str+".00"
			}
			return str;
		}
		function getVal(obj) {
			var tr = $(obj).parent().parent();
			var td = tr.children();

			var val1 = td.eq(4).children().val();
			var val2 = td.eq(5).children().val();
			//var val3 = td.eq(8).children().val();
			var temp = uncomma(val1) * uncomma(val2)
			temp = commaStr(temp.toFixed(2));
			td.eq(6).children().val(temp);
			if(temp<0)
			{
				 td.eq(3).children().val("0.00");
			}
			//alert(val1);
			calcTotal();
		}

		function divReload() {
			//$("#saleprodList").load(location.href + " #saleprodList");
			$("#modalForm").load(location.href + " #modalForm");
		}
	</script>
	<script>
		function calcTotal() {
			var i = 0;
			var temp = 0;
			var total = 0;
			$('#saleprodTbl tr').each(function() {
				var tr = $(this);
				var idx = tr.index();
				//alert(i);
				if (i > 0) {

					var td = tr.children();
					var val = td.eq(6).children().val();
					temp = uncomma(val);
					total = total + temp;
					//alert(total);
				}
				i++;
			});

			var disc_val=uncomma(document.getElementById('discount_amt').value);
			//alert(disc_val);
			total=total-disc_val;
			$(".item-cnt").text(i - 1);
			$(".total-sale-amt").text(comma(String(total.toFixed(2))));
			$(".total-sale-amt-val").val(total);
			$(".pay_amt1").val(comma(String(total.toFixed(2))));
			$(".pay_amt2").val(comma(String(total.toFixed(2))));

		}
	</script>
	<!-- 팝업 check 해제 -->
	<script>
		function checkClear() {
			var i = 0;
			$('#addproduct-ecommerce-list tr').each(function() {
				var tr = $(this);
				var idx = tr.index();
				//alert(i);
				if (i > 0) {

					var td = tr.children();
					td.eq(0).children().prop("checked", false);
					//alert(i);
				}
				i++;
			});
			//divReload();
			$("#filter-by").val("all").prop("selected", true);
			$("#search-term").val("");			
			//document.getElementById("modalForm").innerHTML.reload;
			//$("#checkbox-style-1").show();
		}
	</script>
	<!-- pay -->
	<script>
		function payPost() {

			if(${salevo.tot_pay_amt}>=${salevo.tot_sale_amt})
				{
				alert('The deposit has already been completed.');
				return;
				}
			var editmode=document.getElementById("editmode").value;
			if(editmode=="new")
				{
				alert('You need to save first.');
				return;
				}
			
			var sale_num;
			var pay_type;
			var check_no;
			var pay_amt;
			var obj_length = document.getElementsByName("pay_type").length;

			for (var i = 0; i < obj_length; i++) {
				if (document.getElementsByName("pay_type")[i].checked == true) {
					pay_type = document.getElementsByName("pay_type")[i].value;
				}
			}
			sale_num = document.getElementById("sale_num").value;
			check_no = document.getElementById("check_no").value;
			if (pay_type == "check") {
				pay_amt = document.getElementById("pay_amt2").value;
			} else {
				pay_amt = document.getElementById("pay_amt1").value;
			}
			//alert(sale_num + ":" + pay_type + ":" + check_no + ":" + pay_amt);

			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post"); //Post 방식
			form.setAttribute("action", "sale-pay"); //요청 보낼 주소

			var hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "pay_sale_num");
			hiddenField1.setAttribute("value", sale_num);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "pay_type");
			hiddenField1.setAttribute("value", pay_type);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "check_no");
			hiddenField1.setAttribute("value", check_no);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "pay_amt");
			hiddenField1.setAttribute("value", pay_amt);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "posturl");
			hiddenField1.setAttribute("value", "on-site-sales");
			form.appendChild(hiddenField1);

			document.body.appendChild(form);

			form.submit();

		}
	</script>
	<!-- 폼 전송 print 하기전-->
	<script>
	function check_save(){
		var status=true;
		var i=0;
		if(document.getElementById('discount_amt').value=="")
			{			
			document.getElementById('discount_amt').value="0.00";			
			}
		//alert(document.getElementById('discount_amt').value);
		//return;
		$('#saleprodTbl tr').each(function() {
			var tr = $(this);
			var idx = tr.index();
			//alert(i);
			if (i > 0) {

				var td = tr.children();
				var val = td.eq(5).children().val();
				if(val=="" || val=="0"){									
				status=false;
				return;
				}
			}
			i++;
		});
		if(i==0){
			alert("No Product !");
			return;
		}
		if(status==false){
			alert("Check the quantity !");
			return;
		}else{
		document.getElementById('saveSales').submit();
		}
		
	}
	</script>
	<script>
		function saleSave() {
			if(document.getElementById('discount_amt').value=="")
			{				
			document.getElementById('discount_amt').value="0.00";
			}
		//수량 체크
		var status=true;
      	var i=0;
		$('#saleprodTbl tr').each(function() {
			var tr = $(this);
			var idx = tr.index();
			//alert(i);
			if (i > 0) {

				var td = tr.children();
				var val = td.eq(5).children().val();
				if(val==""||val=="0"){
				alert("Check the quantity !");		
				status=false;
				return;
				}
			}
			i++;
		});
		
		if(i==0){
			alert("No Product !");
			return;
		}
		if(status==false){
			alert("Check the quantity !");
			return;
		}
			var fdata = $('form[name="saveSales"]').serialize();
			
			$.ajax({
				type : "POST",				
				url : "on-site-sales2",
				data : fdata,				
				success : function(data) {
					//<c:set var="editMode" value="modify"/> 
					document.getElementById("editmode").value="modify";					
					mkPrnFile(data);
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
	</script>
	<!-- file_up -->
	<script>
		function fileUpload() {

			var pay_type;
			var obj_length = document.getElementsByName("pay_type").length;

			for (var i = 0; i < obj_length; i++) {
				if (document.getElementsByName("pay_type")[i].checked == true) {
					pay_type = document.getElementsByName("pay_type")[i].value;
				}
			}

			var upload_file = $('#upload_file')[0].files[0];
			var sale_num = $('#sale_num').val();
			//var posturl= $('#posturl').val();			
			var formData = new FormData();

			formData.append('upload_file', upload_file);
			formData.append('sale_num', sale_num);
			formData.append('posturl', 'on-site-sales');
			formData.append('pay_type', pay_type);

			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				url : "sale-file",
				data : formData,
				processData : false,
				contentType : false,
				cache : false,
				timeout : 600000,
				success : function(data) {
					alert("image save success");
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
	</script>
	<script>
	function ltrim(value) {
		 return value.replace(/^\s+/,"");
	}
	</script>
	<script>
		$("select[name=selectaddress]").change(function() {
			var addr = $("#selectaddress option:selected").text();
			var cust_num = $("#selectaddress option:selected").val();
			var reg = /\t/gi;
			var newaddr;
			if (reg.test(addr)) {
				newaddr = addr.replace(reg, "");
			}
			addrs = newaddr.split(',');
			$('#cust_num').val(ltrim(cust_num));
			$('#cust_nm').val(ltrim(addrs[0]));
			$('#addr').val(ltrim(addrs[1]));
			$('#city').val(ltrim(addrs[2]));
			$('#state').val(ltrim(addrs[3]));
			$('#zip_code').val(ltrim(addrs[4]));

			//alert(addr); //value값 가져오기
		});
		$(document).ready(function() {
			calcTotal();
		});
	</script>

	<script>
		function mkPrnFile(sale_num) {

			var file_name = "0";
			var formData = new FormData();
			formData.append('sale_num', sale_num);
			$.ajax({
				type : "POST",
				url : "invoice-mobile-print-write",
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				cache : false,
				async : false,
				success : function(data) {
					//alert(data);
					location.href = "/invoice-download?fname=" + data;
					//file_name = data;
				},
				error : function(request, status, error) {
					//alert("code:" + request.status + "\n" + "message:"
					//		+ request.responseText + "\n" + "error:" + error);
					file_name = "";
				}
			});

		}
	</script>

	<script type="text/javascript">
	$(function(){
	  var text1 = $('.pay_amt1');
	  text1.focus(function(){
		  calcTotal();
	  });
	 
	  var text2 = $('.pay_amt2');
	  text2.focus(function(){
		  calcTotal();
	  });
	});
	</script>
	<script>	
	  function bar_code_read(val) {
		  if(val.length > 11){
		  const log = document.getElementById('log');
		  var formData = new FormData();
		  formData.append("upc_code", val);
		  $.ajax({
				type : "POST",				
				url : "sale-prod-add",
				data : formData,
				processData:false,
				contentType:false,
				dataType:"text",
				async: false,
				success : function(data) {
					//log.textContent = data;
					//var contact=JSON.parse(data); 
					//alert(contact["ctgry_mng_num"]);
					prod_add(data);
					document.getElementById('bar-code').value="";
					document.getElementById('bar-code').focus();
					
					
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});		  
		  }
		 // alert(val);
	    //log.textContent = val;
	  }
	  
	  function  find_cust_sale_price(cust_num,prd_mng_num) {
		  var sale_price=0;
		  var formData = new FormData();
		  formData.append("cust_num", cust_num);
		  formData.append("prd_mng_num", prd_mng_num);
		  $.ajax({
				type : "POST",				
				url : "find-cust-sale-price",
				data : formData,
				processData:false,
				contentType:false,
				dataType:"text",
				async: false,
				success : function(data) {
					//log.textContent = data;
					var contact=JSON.parse(data); 
					//alert(contact["sale_price"]);
					sale_price=contact["sale_price"];					
					//return sale_price;
					
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
					sale_price=0;
				}
			});		  
		  return sale_price;
		 // alert(val);
	    //log.textContent = val;
	  }
	  
	  function prod_add(data) {
		    var contact=JSON.parse(data); 
		    var cust_num = document.getElementById("cust_num").value;
			var prd_mng_num=contact["prd_mng_num"];
			var sale_price=0;
			if(cust_num!=""){
				sale_price=find_cust_sale_price(cust_num,prd_mng_num);
			}
			
			//alert(prd_mng_num);
			var prd_nm=contact["prd_nm"];
			var selectOption = document.getElementById("borcode-option");
			selectOption = selectOption.options[selectOption.selectedIndex].value;
			var unit_price=comma(String(contact["unit_price"]));
			
			if (sale_price=="0"){
				sale_price=unit_price;
			}else
				{
				sale_price=commaStr(sale_price);
				}
			
			if(selectOption=="credit")
			{
				sale_price='-'+sale_price;
			}
			else if(selectOption=="sample")
			{
				sale_price='0.00'
			}
			else if(selectOption=="defecitve-return")
			{
				sale_price='0.00'
			}else
				{}
			
			var ic = 0;
			var chkc = 0;
			$('#saleprodTbl tr')
					.each(
							function() {
								var trc = $(this);
								var idxc = trc.index();
								//alert(i);
								if (ic > 0) {

									var tdc = trc.children();
									var valc = tdc.eq(1).children().eq(0).val();
									var valc2 = tdc.eq(2).children().eq(0).val();
									//alert(valc);
									//alert(valc2);
									if (prd_mng_num == valc
											&& selectOption == valc2) {
										chkc = 1;
									}

								}
								ic++;
							});
			if (chkc>0){
				return;
			}
			var trLen = $('#saleprodTbl > tbody tr').length;
			var rownum = trLen + 1;
			
			$('#saleprodTbl > tbody:last')
					.append(
							'<tr>' + '<td>'
									+ rownum
									+ '</td>'
									//상품묭
									+ '<td>'
									+ '<input type="hidden" name="SaleProdVOList['+trLen+'].prd_mng_num" value="'+prd_mng_num+'">'
									+ '<input type="hidden" name="SaleProdVOList['+trLen+'].prd_nm" value="'+prd_nm+'">'
									+ prd_nm
									+ '</td>'
									//판매 옵션
									+ '<td>'
									+ '<input type="hidden" name="SaleProdVOList['+trLen+'].sale_opt" value="'+selectOption+'">'
									+ selectOption
									//+ '<select class="form-control form-control-sm"	name="SaleProdVOList['+trLen+'].sale_opt" required>'
									//+ '<option value="sales" selected>Sales</option>'
									//+ '<option value="credit">Credit</option>'
									//+ '<option value="sample">Sample</option>'
									//+ '<option value="defecitve-return">DefecitveReturn</option>'
									//+ '</select>'
									+ '</td>'
									//단가
									+ '<td><input type="text" class="form-control form-control-sm" style="min-width: 60px;" name="SaleProdVOList['+trLen+'].unit_price" value="'+unit_price+'" readonly>'
									+ '</td>'
									//판가
									+ '<td>'
									+ '<input type="text" class="form-control form-control-sm" style="min-width: 60px;" name="SaleProdVOList['
									+ trLen
									+ '].sale_price" value="'
									+ sale_price
									+ '" '
									+ 'onKeyUp="removeChar(event);" onchange="getVal(this);inputNumberFormat(this);">'
									+ '</td>'
									//수량
									+ '<td>'
									+ '<input type="number" class="form-control form-control-sm" name="SaleProdVOList['
									+ trLen
									+ '].sale_qty" value="" onchange="getVal(this);">'
									+ '</td>'
									//총판매가
									+ '<td>'
									+ '<input type="text" class="form-control form-control-sm" style="min-width: 60px;" name="SaleProdVOList['+trLen+'].tot_sale_price" value="'
								+ sale_price
								+ '" '
								+ 'readonly >'
									+ '</td>'
									+ '<td>'
									+ '<button class="btn btn-danger btn-sm" onclick="deleterow(this);"><i class="fas fa-times"></i>'
									+ '</td>'
									+ '</tr>');
			
			calcTotal();			

		}
	  function prod_add2(data) {
		    var contact=JSON.parse(data); 
		    var cust_num = document.getElementById("cust_num").value;
			var prd_mng_num=contact["prd_mng_num"];
			var sale_price=0;
			if(cust_num!=""){
				sale_price=find_cust_sale_price(cust_num,prd_mng_num);
			}
			
			//alert(prd_mng_num);
			var prd_nm=contact["prd_nm"];
			var selectOption = document.getElementById("popup-option");
		    selectOption = selectOption.options[selectOption.selectedIndex].value;		       
			var unit_price=comma(String(contact["unit_price"]));
			
			if (sale_price=="0"){
				sale_price=unit_price;
			}else
				{
				sale_price=commaStr(sale_price);
				}
			
			if(selectOption=="credit")
			{
				sale_price='-'+sale_price;
			}
			else if(selectOption=="sample")
			{
				sale_price='0.00'
			}
			else if(selectOption=="defecitve-return")
			{
				sale_price='0.00'
			}else
				{}
			
			var ic = 0;
			var chkc = 0;
			$('#saleprodTbl tr')
					.each(
							function() {
								var trc = $(this);
								var idxc = trc.index();
								//alert(i);
								if (ic > 0) {

									var tdc = trc.children();
									var valc = tdc.eq(1).children().eq(0).val();
									var valc2 = tdc.eq(2).children().eq(0).val();
									//alert(valc);
									//alert(valc2);
									if (prd_mng_num == valc
											&& selectOption == valc2) {
										chkc = 1;
									}

								}
								ic++;
							});
			if (chkc>0){
				return;
			}
			var trLen = $('#saleprodTbl > tbody tr').length;
			var rownum = trLen + 1;
			
			$('#saleprodTbl > tbody:last')
					.append(
							'<tr>' + '<td>'
									+ rownum
									+ '</td>'
									//상품묭
									+ '<td>'
									+ '<input type="hidden" name="SaleProdVOList['+trLen+'].prd_mng_num" value="'+prd_mng_num+'">'
									+ '<input type="hidden" name="SaleProdVOList['+trLen+'].prd_nm" value="'+prd_nm+'">'
									+ prd_nm
									+ '</td>'
									//판매 옵션
									+ '<td>'
									+ '<input type="hidden" name="SaleProdVOList['+trLen+'].sale_opt" value="'+selectOption+'">'
									+ selectOption
									//+ '<select class="form-control form-control-sm"	name="SaleProdVOList['+trLen+'].sale_opt" required>'
									//+ '<option value="sales" selected>Sales</option>'
									//+ '<option value="credit">Credit</option>'
									//+ '<option value="sample">Sample</option>'
									//+ '<option value="defecitve-return">DefecitveReturn</option>'
									//+ '</select>'
									+ '</td>'
									//단가
									+ '<td><input type="text" class="form-control form-control-sm" style="min-width: 60px;" name="SaleProdVOList['+trLen+'].unit_price" value="'+unit_price+'" readonly>'
									+ '</td>'
									//판가
									+ '<td>'
									+ '<input type="text" class="form-control form-control-sm" style="min-width: 60px;" name="SaleProdVOList['
									+ trLen
									+ '].sale_price" value="'
									+ sale_price
									+ '" '
									+ 'onKeyUp="removeChar(event);" onchange="getVal(this);inputNumberFormat(this);">'
									+ '</td>'
									//수량
									+ '<td>'
									+ '<input type="number" class="form-control form-control-sm" name="SaleProdVOList['
									+ trLen
									+ '].sale_qty" value="" onchange="getVal(this);">'
									+ '</td>'
									//총판매가
									+ '<td>'
									+ '<input type="text" class="form-control form-control-sm" style="min-width: 60px;" name="SaleProdVOList['+trLen+'].tot_sale_price" value="'
								+ sale_price
								+ '" '
								+ 'readonly >'
									+ '</td>'
									+ '<td>'
									+ '<button class="btn btn-danger btn-sm" onclick="deleterow(this);"><i class="fas fa-times"></i>'
									+ '</td>'
									+ '</tr>');
			
			calcTotal();			

		}
	</script>
	<script type="text/javascript">
	//삭제
	function del_sales(salenum) {		
		var sale_num=salenum;
		if(salenum="")
			{
			alert("There is no information to delete.");
			return;
			}
		if (!confirm("You sure you want to delete it?")) {            
            return;
        }else{
        	//alert(sale_num);
			$.ajax({
				url : "del-sales",
				type : "POST",
				data : {
					"sale_num" : sale_num
				},
				dataType : "text",
				success : function(data) {
					if (data == "ok") {
						alert("Deleted!!.");
						location.href="/order-list";
					
					}
	
					else {
						alert(data);
					}
				},
				error : function(error) {
					alert(error);
				}
			});
        }
		
		
	}
	 function getCheckboxValue(event)  {
		  var result = '';
		  var oldResult=document.getElementById('check_result').value;
		  if(event.target.checked)  {
		    result = oldResult + event.target.value + ",";
		  }else {
			  var arr=oldResult.split(",");
			  if(arr.length>0){
				  for(var i=0;i<arr.length-1;i++){
					  if(arr[i]!=event.target.value)
						  {
						  result=result+arr[i]+","
						  }
				  }
		  	}
		  }
		  //alert(result);
		  document.getElementById('check_result').value = result;
	 }
	</script>

	<script type="text/javascript">
		var message = "${msg}";
		var url = "${url}";
		if (message != "") {
			alert(message);
		}
		if (url != "") {
			document.location.href = url;
		}
	</script>
</body>
</html>