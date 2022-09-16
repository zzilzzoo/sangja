<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<%@ include file="sideba-fixed.jsp"%>
<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=category-list"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Category | SangJa Admin</title>
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
		<c:set var="third_code" value='1' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">Category</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Basic</span></li>

							<li><span>Product Management </span></li>

							<li><span>Category</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->
				<div class="row">
					<div class="col">
						<section class="card card-modern">
							<div class="card-body">
								<div class="datatables-header-footer-wrapper">
									<div class="mt-2">
										<div class="datatable-header">
											<div class="row align-items-center mb-3">
												<div class="col-12 col-lg-auto mb-3 mb-lg-0">
													<c:choose>
														<c:when test="${umvo.write_yn eq 'y'}">
															<button id="addToTable"
																class="btn btn-primary btn-md font-weight-semibold btn-py-2 px-4">
																Add<i class="fas fa-plus"></i>
															</button>
														</c:when>
														<c:otherwise>
															<button
																onclick="alert('You do not have permission to write.');"
																class="btn btn-primary btn-md font-weight-semibold btn-py-2 px-4">
																Add<i class="fas fa-plus"></i>
															</button>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
									<form name="categoryfrom">
										<input type="hidden" name="editor"value"system">
										<table class="table table-ecommerce-simple table-striped mb-0"
											id="datatable-editable" style="min-width: 400px;">
											<thead>
												<tr>
													<th width="20px">#</th>
													<th>Category</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="list" varStatus="status">
													<tr data-item-id="${list.ctgry_mng_num}">
														<td>${status.count}</td>
														<td>${list.ctgry_nm}</td>
														<td class="actions"><a href="#"
															class="hidden on-editing  save-row"><i
																class="fas fa-save"></i></a> <a href="#"
															class="hidden on-editing cancel-row"><i
																class="fas fa-times"></i></a> 
																<c:choose>
																<c:when test="${umvo.write_yn eq 'y'}">
																	<a href="#" class="on-default edit-row"><i
																class="fas fa-pencil-alt"></i></a>																	
																</c:when>
																<c:otherwise>
																	<a href="#" onclick="alert('You do not have permission to write.');return false;" ><i
																class="fas fa-pencil-alt"></i></a>																	
																</c:otherwise>
															    </c:choose>
															<c:choose>
																<c:when test="${umvo.delete_yn eq 'y'}">
																	<a href="#"
															class="on-default remove-row"><i
																class="far fa-trash-alt"></i></a>																
																</c:when>
																<c:otherwise>
																	<a href="#" onclick="alert('You do not have permission to delete.');return false;" ><i
																class="fas fa-trash-alt"></i></a>																	
																</c:otherwise>
															    </c:choose>
															    
															  </td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</form>
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
						</section>
					</div>
				</div>
				<!-- end: page -->
			</section>
		</div>

	</section>


	<div id="dialog" class="modal-block mfp-hide">
		<section class="card">
			<header class="card-header">
				<h2 class="card-title">Are you sure?</h2>
			</header>
			<div class="card-body">
				<div class="modal-wrapper">
					<div class="modal-text">
						<p>Are you sure that you want to delete this row?</p>
					</div>
				</div>
			</div>
			<footer class="card-footer">
				<div class="row">
					<div class="col-md-12 text-end">
						<button id="dialogConfirm" class="btn btn-primary">Confirm</button>
						<button id="dialogCancel" class="btn btn-default">Cancel</button>
					</div>
				</div>
			</footer>
		</section>
	</div>

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
	<script src="../resources/js/examples/category.datatables.editable.js"></script>
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