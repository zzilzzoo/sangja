<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
<jsp:forward page="/signin?return_path=inventory-list"></jsp:forward>
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
<link rel="stylesheet"
	href="../resources/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />

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
				<div class="ecommerce-form-sidebar-overlay-wrapper">
					<div class="ecommerce-form-sidebar-overlay-body">
						<a href="#" class="ecommerce-form-sidebar-overlay-close"><i
							class="bx bx-x"></i></a>
						<div class="scrollable h-100 loading-overlay-showing"
							data-plugin-scrollable>
							<div class="loading-overlay">
								<div class="bounce-loader">
									<div class="bounce1"></div>
									<div class="bounce2"></div>
									<div class="bounce3"></div>
								</div>
							</div>
							<div
								class="ecommerce-form-sidebar-overlay-content scrollable-content px-3 pb-3 pt-1"></div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<div class="card card-modern">
							<div class="card-body">
								<div class="datatables-header-footer-wrapper">
									<div class="datatable-header">
										<div class="row align-items-end mb-0">
											<div class="col-6 col-lg-auto ps-lg-1 mb-3 mb-lg-3">

												<a href="inventory-list"
													data-ajax-url="ajax-inventory-storing"
													class="ecommerce-sidebar-link btn btn-primary btn-md font-weight-semibold btn-py-2 px-4">Storing
													<i class="fas fa-plus"></i>
												</a>

											</div>
											<div
												class="col-6 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3 text-end">
												<a href="inventory-list"
													data-ajax-url="ajax-inventory-unstoring"
													class="ecommerce-sidebar-link btn btn-danger btn-md font-weight-semibold btn-py-2 px-4">Unstoring
													<i class="fas fa-minus"></i>
												</a>
											</div>
										</div>
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
									<table class="table table-ecommerce-simple table-striped mb-0"
										id="datatable-ecommerce-list" style="min-width: 900px;">
										<thead>
											<tr>
												<th>#</th>
												<th>Category</th>
												<th>Product</th>
												<th>Product#</th>
												<th>User Category</th>
												<th>User</th>
												<th>Qty</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${prdinvList}" var="prdinvList"
												varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td><a href="inventory-detail?prd_mng_num=${prdinvList.prd_mng_num}"><strong>${prdinvList.ctgry_nm}</strong></a></td>
													<td><a href="inventory-detail?prd_mng_num=${prdinvList.prd_mng_num}"><strong>${prdinvList.prd_nm}</strong></a></td>
													<td>${prdinvList.prd_code}</td>
													<td>${prdinvList.category}</td>
													<td>${prdinvList.user_nm}</td>
													<td>${prdinvList.qty}</td>
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
	<script
		src="../resources/vendor/bootstrapv5-multiselect/js/bootstrap-multiselect.js"></script>
	<script
		src="../resources/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="../resources/vendor/fuelux/js/spinner.js"></script>
	<script src="../resources/vendor/autosize/autosize.js"></script>
	<script src="../resources/vendor/select2/js/select2.js"></script>



	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<!-- Examples -->
	<script src="../resources/js/examples/inventory.datatables.list.js"></script>

	<script src="../resources/js/examples/onsite.sidebar.overlay.js"></script>




</body>
</html>