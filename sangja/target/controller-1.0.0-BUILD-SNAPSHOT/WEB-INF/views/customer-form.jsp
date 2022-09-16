<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<%@ include file="sideba-fixed.jsp"%>
<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=customer-form"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Customer | SangJa Admin</title>
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
		<c:set var="secondmenu_code" value='2' />
		<c:set var="third_code" value='0' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">Customer</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Basic</span></li>

							<li><span>Customer Management </span></li>

							<li><span>Customer</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->
				<form class="ecommerce-form action-buttons-fixed"
					action="customer-form" method="post">
					<div class="row">
						<div class="col">
							<section class="card card-dark">
								<header class="card-header">
									<div class="card-actions">
										<a href="#" class="card-action card-action-toggle"
											data-card-toggle></a>
									</div>
									<h2 class="card-title">
										<i class="card-icon bx bx-box mx-2"></i>General Info
									</h2>
									<p class="card-subtitle">Add here the customer description
										with all details and necessary information.</p>
								</header>
								<div class="card-body">
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Name</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="cust_nm"
												value="" />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Address <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="addr" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">City <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="city" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">State <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="state" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Zip Code <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="zip_code"
												value="" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Visit Term(Week) <span
											class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="visit_term"
												value="0" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Status <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="cust_status" required>
												<option value="active">Active</option>
												<option value="inactive">Inactive</option>
												<option value="delete">Delete</option>
											</select>
										</div>
									</div>
									<input type="hidden" name="editor" value="system">
									<div class="form-group row pb-4">
										<div class="row justify-content-md-center">
											<div class="col-lg-5 col-xl-3 mb-0">Date of
												registration :</div>
											<div class="col-lg-5 col-xl-3 mb-0">Date of
												modification :</div>
										</div>
									</div>

								</div>
							</section>
						</div>
					</div>

					<div class="row action-buttons">
						<div class="col-12 col-md-auto">							
							<c:choose>
								<c:when test="${umvo.write_yn eq 'y'}">
									<button type="submit"
										class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading...">
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="alert( 'You do not have permission to write.');return false;"
								class="btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading...">
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
							<a href="customer-list.html"
								class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Cancel</a>
						</div>
						<!--  div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
							<a href="#"
								class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1">
								<i class="bx bx-trash text-4 me-2"></i> Delete
							</a>
						</div-->
					</div>
				</form>

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
	<script src="../resources/js/examples/product.datatables.default.js"></script>
	<script src="../resources/js/examples/examples.modals.js"></script>


</body>
</html>