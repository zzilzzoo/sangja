<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<%@ include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=product-list"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Product List | SangJa Admin</title>
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

		<c:set var="firstmenu_code" value='1' />
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
					<h2 class="font-weight-bold text-6">Product</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Basic</span></li>

							<li><span>Product Management </span></li>

							<li><span>Product</span></li>

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
										<div class="row align-items-center mb-0">
											<div class="col-8 col-lg-auto ps-lg-1 mb-3 mb-lg-3">

												<c:choose>
													<c:when test="${umvo.write_yn eq 'y'}">
														<a href="product-form"
															class="btn btn-primary btn-md font-weight-semibold btn-py-2 px-4">Add
															<i class="fas fa-plus"></i>
														</a>
													</c:when>
													<c:otherwise>
														<a
															onclick="alert('You do not have permission to write.');"
															class="btn btn-primary btn-md font-weight-semibold btn-py-2 px-4">Add
															<i class="fas fa-plus"></i>
														</a>
													</c:otherwise>
												</c:choose>
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
												class="col-12 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3"><form method="post" action="">
												<div
													class="d-flex align-items-lg-center flex-column flex-lg-row">
													<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
														class="form-control" name="filter-by">
														<option value="all" selected>All</option>
														<option value="category">Category</option>
														<option value="prd_nm">Product</option>
														<option value="sale_status">Status</option>
													</select>
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
												</form>
											</div>
											
										</div>
									</div>
									<table class="table table-ecommerce-simple table-striped mb-0"
										id="datatable-ecommerce-list" style="min-width: 750px;">
										<thead>
											<tr>
												<th>#</th>
												<th>Category</th>
												<th>Product</th>
												<th>Product #</th>
												<th>Description</th>
												<th>UPC Code</th>
												<th>Cost Price($)</th>
												<th>Unit Price($)</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="list" varStatus="status">
												<tr data-item-id="${list.prd_mng_num}">
													<td>${status.count}</td>
													<td><a
														href="product-form?prd_mng_num=${list.prd_mng_num}"><strong>${list.ctgry_nm}</strong></a></td>
													<td><a
														href="product-form?prd_mng_num=${list.prd_mng_num}"><strong>${list.prd_nm}</strong></a></td>
													<td>${list.prd_code}</td>
													<td>${list.prd_dscp}</td>
													<td>${list.upc_code}</td>
													<td><fmt:formatNumber value="${list.cost_price}"
															pattern="#,##0.00" /></td>
													<td><fmt:formatNumber value="${list.unit_price}"
															pattern="#,##0.00" /></td>
													<c:if test="${list.sale_status eq 'active'}">
														<td><span class="ecommerce-status active">${list.sale_status}</span></td>
													</c:if>
													<c:if test="${list.sale_status eq 'inactive'}">
														<td><span class="ecommerce-status inactive">${list.sale_status}</span></td>
													</c:if>
													<c:if test="${list.sale_status eq 'delete'}">
														<td><span class="ecommerce-status delete">${list.sale_status}</span></td>
													</c:if>
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

	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<!-- Examples -->
	<script src="../resources/js/examples/sangja.datatables.list.js"></script>

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