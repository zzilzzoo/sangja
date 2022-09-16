<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
<jsp:forward page="/signin?return_path=inventory-detail"></jsp:forward>
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
		<c:set var="firstmenu_code" value='3' />
		<c:set var="secondmenu_code" value='0' />
		<c:set var="third_code" value='0' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->



		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">Inventory</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Inventory</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->
				<div class="row">
					<div class="col">
						<div class="card card-modern">
							<div class="card-body">
								<div class="datatables-header-footer-wrapper">
									<div class="datatable-header">
										<div class="row align-items-end mb-0">
											<div class="col-8 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
												<a href="#"
													class="btn btn-success btn-md font-weight-semibold">Excel
													Download <i class="far fa-file-excel"></i>
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
											<div class="col-12 col-lg-auto ms-auto ml-auto mb-3 mb-lg-3">
												<div
													class="d-flex align-items-lg-center flex-column flex-lg-row">
													<label class="ws-nowrap me-3 mb-0">User:</label> <select
														class="form-control" multiple="multiple"
														data-plugin-multiselect
														data-plugin-options='{ "maxHeight": 200, "includeSelectAllOption": true}'
														id="ms_example5">
														<optgroup label="Employee">
															<option value="changho" selected>ChangHo</option>
															<option value="danielra" selected>Danielra</option>
															<option value="anna" selected>Anna</option>
														</optgroup>
														<optgroup label="Commissioner">
															<option value="changsu" selected>Changsu</option>
															<option value="daniel" selected>Daniel</option>
															<option value="anni" selected>Anni</option>
														</optgroup>
														<optgroup label="Individual Saller">
															<option value="coco" selected>Coco</option>
															<option value="nana" selected>Nana</option>
														</optgroup>
													</select>
												</div>
											</div>
											<div class="col-7 col-lg-auto mb-3 mb-lg-3">
												<div
													class="d-flex align-items-lg-center flex-column flex-lg-row">
													<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
														class="form-control filter-by" name="filter-by">
														<option value="all" selected>All</option>
														<option value="1">Product</option>
														<option value="2">Product#</option>
													</select>
												</div>
											</div>
											<div class="col-5 col-lg-auto mb-3 mb-lg-3">
												<div
													class="d-flex align-items-lg-center flex-column flex-lg-row">
													<label class="ws-nowrap me-3 mb-0">Qty:</label>
													<div class="input-group">
														<select class="form-control">
															<option class="qtynone">-</option>
															<option class="qtygreater">&#62;</option>
															<option class="qtyequal">&#61;</option>
															<option class="qtyless">&#60;</option>
														</select> <input type="text" class="form-control" placeholder="Qty">
													</div>
												</div>
											</div>
											<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
												<div class="search search-style-1-lg mx-lg-auto">
													<div class="input-group">
														<input type="text" class="search-term form-control"
															name="search-term" id="search-term"
															placeholder="Search Product">
														<button class="btn btn-default" type="submit">
															<i class="bx bx-search"></i>
														</button>
													</div>
												</div>
											</div>

										</div>
									</div>
									<div
										class="col-12 col-lg-aut font-weight-bold text-color-dark text-4 text-lg-5">
										[<span class="productcategory">${prdvo.ctgry_nm}</span>] <span
											class="productname">${prdvo.prd_nm}</span> <span
											class="producrcode">${prdvo.prd_code}</span>
									</div>
									<table class="table table-ecommerce-simple table-striped mb-0"
										id="datatable-ecommerce-list" style="min-width: 900px;">
										<thead>
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>User Category</th>
												<th>User</th>
												<th>Option</th>
												<th>회사내부재고</th>
												<th>User재고</th>
												<th>단가</th>
												<th>Qty</th>
												<th>금액($)</th>
												<th>변동회사내부재고</th>
												<th>변동User재고</th>
												<th>전체회사재고</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${invUserList}" var="invUserList"
												varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td>${invUserList.inout_ymdt}</td>
													<td>${invUserList.category}</td>
													<td>${invUserList.user_nm}</td>
													<td>${invUserList.event_opt}</td>
													<td>${invUserList.bf_comp_qty}</td>
													<td>${invUserList.bf_user_qty}</td>
													<td><fmt:formatNumber value="$${invUserList.unit_price}<" pattern="#,##0.00"/></td>
													<td>${invUserList.event_qty}</td>
													<td><fmt:formatNumber value="$${invUserList.event_amt}<" pattern="#,##0.00"/></td>
													<td>${invUserList.af_comp_qty}</td>
													<td>${invUserList.af_user_qty}</td>
													<td>${invUserList.tot_qty}</td>
													<td>${invUserList.event_note}</td>

												</tr>
											</c:forEach>

										</tbody>
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
	<script src="../resources/js/examples/examples.lightbox.js"></script>


</body>
</html>