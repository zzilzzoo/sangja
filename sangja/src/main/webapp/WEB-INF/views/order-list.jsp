<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<%@ include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=order-list"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Order Report | SangJa Admin</title>
<meta name="keywords" content="SangJa Admin" />
<meta name="description" content="SangJa Admin">
<meta name="author" content="Sangja">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,300,400,600,700,800,900"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="../resources/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="../resources/vendor/animate/animate.compat.css">
<link rel="stylesheet"
	href="../resources/vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet"
	href="../resources/vendor/boxicons/css/boxicons.min.css" />
<link rel="stylesheet"
	href="../resources/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet"
	href="../resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
<link rel="stylesheet"
	href="../resources/vendor/datatables/media/css/dataTables.bootstrap5.css" />
<link rel="stylesheet"
	href="../resources/vendor/select2/css/select2.css" />
<link rel="stylesheet"
	href="../resources/vendor/select2-bootstrap-theme/select2-bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/vendor/bootstrap-multiselect/css/bootstrap-multiselect.css" />

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
		<c:set var="third_code" value='4' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">Order Report</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Sales</span></li>

							<li><span>Sales Management </span></li>

							<li><span>Order Report</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->
				<div class="row">
					<div class="col">
						<div class="card card-modern">
							<div class="card-body">
								<div class="datatables-header-footer-wrapper">
									<form name="search" action="order-list" method="post">
										<div class="datatable-header">
											<div class="row align-items-end mb-0">
												<div class="col-8 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<a
														href="/excel/order-list?sale_ymd_s=${sale_ymd_s}&sale_ymd_e=${sale_ymd_e}&search_user=${search_user}&filter_by=${filter_by}&search_term=${search_term}"
														class="btn btn-success btn-md font-weight-semibold">Excel
														<i class="far fa-file-excel"></i>
													</a>
												</div>
												<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div
														class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Show:</label> <select
															class="form-control results-per-page"
															name="results-per-page">
															<option value="10" selected>10</option>
															<option value="25">25</option>
															<option value="50">50</option>
															<option value="100">100</option>
														</select>
													</div>
												</div>

												<div
													class="col-12 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="input-daterange input-group"
														data-plugin-datepicker>
														<span class="input-group-text"> <i
															class="fas fa-calendar-alt"></i>
														</span>
														<fmt:parseDate  var="dateValue_s"  value="${sale_ymd_s}" pattern="yyyy-MM-dd"/>
														 <input name="sale_ymd_s" type="text" class="form-control" value="<fmt:formatDate value="${dateValue_s}" pattern="MM/dd/yyyy"/>" autocomplete='off'>
														<span
															class="input-group-text border-start-0 border-end-0 rounded-0">
															to </span> 
															<fmt:parseDate  var="dateValue_e"  value="${sale_ymd_e}" pattern="yyyy-MM-dd"/>
															<input type="text" class="form-control"	name="sale_ymd_e" value="<fmt:formatDate value="${dateValue_e}" pattern="MM/dd/yyyy"/>" autocomplete='off'>
													</div>
												</div>
												<div class="col-6 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div
														class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Sales Person:</label> <select
															class="form-control" multiple="multiple"
															data-plugin-multiselect
															data-plugin-options='{ "maxHeight": 200, "includeSelectAllOption": true}'
															id="ms_example5" name="search_user">
															<optgroup label="Employee">
																<c:forEach items="${uListE}" var="uListE">
																	<option value="${uListE.user_num}" selected>${uListE.user_nm_f}
																		${uListE.user_nm_l}</option>
																</c:forEach>
															</optgroup>
															<optgroup label="Commissioner">
																<c:forEach items="${uListC}" var="uListC">
																	<option value="${uListC.user_num}" selected>${uListC.user_nm_f}
																		${uListC.user_nm_f}</option>
																</c:forEach>
															</optgroup>
															<optgroup label="Individual Saller">
																<c:forEach items="${uListS}" var="uListS">
																	<option value="${uListS.user_num}" selected>${uListS.user_nm_f}
																		${uListS.user_nm_f}</option>
																</c:forEach>
															</optgroup>
														</select>
													</div>
												</div>
												<div class="col-6 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div
														class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
															class="form-control filter-by" name="filter_by">
															<option value="all" selected>All</option>
															<option value="cust_nm">Name</option>
															<option value="addr">Address</option>
															<option value="city">City</option>
															<option value="state">State</option>
															<option value="zip_code">Zip Code</option>
															<!--  option value="prod">Item</option>
														<option value="sale_opt">Option</option-->
															<option value="sale_type">Sale Type</option>
															<option value="sale_status">Status</option>
														</select>
													</div>
												</div>

												<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="search search-style-1-lg mx-lg-auto">
														<div class="input-group">
															<input type="text" class="form-control"
																name="search_term" id="search-term"
																placeholder="Search Order List">
															<button class="btn btn-default" type="submit">
																<i class="bx bx-search"></i>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									<table class="table table-ecommerce-simple table-striped mb-0"
										id="datatable-ecommerce-list" style="min-width: 900px;">
										<thead>
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>Sales Person</th>
												<th>Name</th>
												<th>Address</th>
												<th>City</th>
												<th>State</th>
												<th>Zip Code</th>
												<th>Item, Option, Qty</th>
												<th>Amount($)</th>
												<th>Payment($)</th>
												<th>Balance($)</th>
												<th>Type</th>
												<th>PayBy</th>
												<th style="min-width: 120px;">Status</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="tot_ord_amt_sum" value="0" />
											<c:set var="tot_pay_amt_sum" value="0" />
											<c:set var="tot_balance_sum" value="0" />
											<c:forEach items="${salelist}" var="salelist"
												varStatus="status">
												<tr>
													<fmt:parseDate var="sale_ymd" value="${salelist.sale_ymd}"
														pattern="yyyy-MM-dd" />
													<td>${status.count}</td>
													<td><span hidden>${salelist.sale_ymd}</span><c:if test="${salelist.sale_type eq 'onsite' }">
															<a
																href="on-site-sales-detail?sale_num=${salelist.sale_num}"><strong><fmt:formatDate
																		value="${sale_ymd}" pattern="MM/dd/yyyy" /></strong></a>
														</c:if> <c:if test="${salelist.sale_type ne 'onsite' }">
															<a
																href="other-sales-detail?sale_num=${salelist.sale_num}"><strong><fmt:formatDate
																		value="${sale_ymd}" pattern="MM/dd/yyyy" /></strong></a>
														</c:if></td>
													<td>${salelist.sale_user_nm}</td>
													<td><c:if test="${salelist.sale_type eq 'onsite' }">
															<a href="on-site-sales?sale_num=${salelist.sale_num}"><strong>${salelist.cust_nm}</strong></a>
														</c:if> <c:if test="${salelist.sale_type ne 'onsite' }">
															<a href="other-sales?sale_num=${salelist.sale_num}"><strong>${salelist.cust_nm}</strong></a>
														</c:if></td>
													<td>${salelist.addr}</td>
													<td>${salelist.city}</td>
													<td>${salelist.state}</td>
													<td>${salelist.zip_code}</td>
													<td><c:forEach items="${saleprodlist}"
															var="saleprodlist" varStatus="statusP">
															<c:if
																test="${saleprodlist.sale_num eq salelist.sale_num}">
																<div>
																	<span class="product">${saleprodlist.prd_nm}</span>, <span
																		class="option">${saleprodlist.sale_opt}</span>, <span
																		class="qty">${saleprodlist.sale_qty}</span>
																</div>
															</c:if>
														</c:forEach></td>
													<td><fmt:formatNumber value="${salelist.tot_ord_amt}"
															pattern="#,##0.00" /></td>
													<td><fmt:formatNumber value="${salelist.tot_pay_amt}"
															pattern="#,##0.00" /></td>
													<c:set var="balance"
														value="${salelist.tot_ord_amt-salelist.tot_pay_amt}" />
													<td><fmt:formatNumber value="${balance}"
															pattern="#,##0.00" /></td>
													<td>${salelist.sale_type}</td>
													<td><c:forEach items="${salepaylist}"
															var="salepaylist" varStatus="statusPs">
															<c:if test="${salepaylist.sale_num eq salelist.sale_num}">
																<div>${salepaylist.pay_type}
																	<c:if test="${salepaylist.pay_type eq 'check'}">
																(${salepaylist.check_no})
																</c:if>
																	:
																	<fmt:formatNumber value="${salepaylist.pay_amt}"
																		pattern="#,##0.00" />
																</div>
															</c:if>
														</c:forEach></td>
													<td><c:choose>
															<c:when test="${balance eq 0 }">
																<span class="ecommerce-status completed">Completed</span>
															</c:when>
															<c:otherwise>
																<span class="ecommerce-status pending">Pending
																	payment</span>
															</c:otherwise>
														</c:choose></td>

												</tr>
												<c:set var="tot_ord_amt_sum"
													value="${tot_ord_amt_sum+salelist.tot_ord_amt}" />
												<c:set var="tot_pay_amt_sum"
													value="${tot_pay_amt_sum+salelist.tot_pay_amt}" />
												<c:set var="tot_balance_sum"
													value="${tot_balance_sum+balance}" />

											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="9" align="right"
													class="text-4 font-weight-bold">Total</td>
												<td class="text-4 font-weight-bold"><fmt:formatNumber
														value="${tot_ord_amt_sum }" pattern="#,##0.00" /></td>
												<td class="text-4 font-weight-bold"><fmt:formatNumber
														value="${tot_pay_amt_sum }" pattern="#,##0.00" /></td>
												<td class="text-4 font-weight-bold"><fmt:formatNumber
														value="${tot_balance_sum }" pattern="#,##0.00" /></td>
												<td colspan="3"></td>
											</tr>
										</tfoot>
									</table>
									<div class="datatable-footer">
										<div
											class="row align-items-center justify-content-between mt-3">
											<div class="col-lg-auto text-center order-3 order-lg-2">
												<div class="results-info-wrapper"></div>
											</div>
											<div class="col-lg-auto order-2 order-lg-3 mb-3 mb-lg-0">
												<div class="pagination-wrapper"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end: page -->
			</section>
		</div>

	</section>
	<!-- Vendor -->
	<script src="../resources/vendor/jquery/jquery.js"></script>
	<script
		src="../resources/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="../resources/vendor/popper/umd/popper.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="../resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../resources/vendor/common/common.js"></script>
	<script src="../resources/vendor/nanoscroller/nanoscroller.js"></script>
	<script
		src="../resources/vendor/magnific-popup/jquery.magnific-popup.js"></script>
	<script
		src="../resources/vendor/jquery-placeholder/jquery.placeholder.js"></script>

	<!-- Specific Page Vendor -->
	<script
		src="../resources/vendor/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../resources/vendor/datatables/media/js/dataTables.bootstrap5.min.js"></script>
	<script src="../resources/vendor/select2/js/select2.js"></script>
	<script
		src="../resources/vendor/bootstrapv5-multiselect/js/bootstrap-multiselect.js"></script>


	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<!-- Examples -->
	<script src="../resources/js/examples/sangja.datatables.list.js"></script>
	<script src="../resources/js/examples/examples.advanced.form.js"></script>
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