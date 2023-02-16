<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=today-visit"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Today Visit | SangJa Admin</title>
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
		<c:set var="third_code" value='1' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">Today Visit</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Basic</span></li>

							<li><span>Customer Management </span></li>

							<li><span>Today Visit</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->
				<div class="row">
					<div class="col">
						<div class="card card-modern">
							<div class="card-body">
								<div class="datatables-header-footer-wrapper">
									<form name="search" action="today-visit" method="post">
										<div class="datatable-header">
											<div class="row align-items-center mb-0">
												<div class="col-lg-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<span class="text-5 font-weight-bold text-dark">Today
														: <span class="text-danger">${serverTimeCST}</span>
													</span>
												</div>
												<div class="col-8 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<a
														href="/excel/today-visit?search_user=${search_user}&filter_by=${filter_by}&search_term=${search_term}"
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
													class="col-6 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
													<div
														class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Sales Person:</label> <select
															class="col-12 form-contro selectperson"
															multiple="multiple" data-plugin-multiselect
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
																		${uListC.user_nm_l}</option>
																</c:forEach>
															</optgroup>
															<optgroup label="Individual Saller">
																<c:forEach items="${uListS}" var="uListS">
																	<option value="${uListS.user_num}" selected>${uListS.user_nm_f}
																		${uListS.user_nm_l}</option>
																</c:forEach>
															</optgroup>
															<optgroup label="Not Setting">
																<c:forEach items="${uListNA}" var="uListNA">
																	<option value="${uListNA.user_num}" selected>${uListNA.user_nm_f}
																		${uListNA.user_nm_l}</option>
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
														</select>
													</div>
												</div>

												<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="search search-style-1-lg mx-lg-auto">
														<div class="input-group">
															<input type="text" class="form-control"
																name="search_term" id="search-term"
																placeholder="Search Customer">
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
										id="datatable-ecommerce-list" style="min-width: 750px;">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Address</th>
												<th>City</th>
												<th>State</th>
												<th>Zip Code</th>
												<th>Visit Term(Week)</th>
												<th>Last Visit</th>
												<th class="text-center" style="min-width: 90px;"
													width="90px">Sales</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="list" varStatus="status">
												<tr>
													<td>${status.count }</td>
													<td><a
														href="customer-modify?cust_num=${list.cust_num}"><strong>${list.cust_nm}</strong></a></td>
													<td><a
														href="customer-modify?cust_num=${list.cust_num}"><strong>${list.addr}</strong></a></td>
													<td>${list.city}</td>
													<td>${list.state}</td>
													<td>${list.zip_code}</td>
													<td>${list.visit_term}</td>
													<fmt:parseDate var="visit_ymd"
														value="${list.last_visit_ymd}" pattern="yyyy-MM-dd" />
													<td><span hidden>${list.last_visit_ymd}</span><fmt:formatDate value="${visit_ymd}"
															pattern="MM/dd/yyyy" /></td>
													<td><a class="btn btn-primary btn-md btn-py-1 px-6"
														href="on-site-sales?cust_num=${list.cust_num}"><i
															class="fas fa-store"></i> On-Site</a></td>
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