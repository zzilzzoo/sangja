<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=product-form"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Product | SangJa Admin</title>
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
				<form class="ecommerce-form action-buttons-fixed" action="#"
					method="post" id="comm-main">
					<div class="row">
						<div class="col">
							<section class="card card-dark">
								<header class="card-header">
									<div class="card-actions">
										<a href="#" class="card-action card-action-toggle"
											data-card-toggle></a>
									</div>

									<h2 class="card-title">
										<i class="card-icon bx bx-box mx-2"></i> General Info
									</h2>
									<p class="card-subtitle">Add here the product description
										with all details and necessary information.</p>
								</header>
								<div class="card-body">
									<input type="hidden" class="form-control" name="prd_mng_num"
										value="${view.prd_mng_num}" />
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Category <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="ctgry_mng_num" required>
												<c:forEach items="${cgList}" var="cgList">
													<option value="${cgList.ctgry_mng_num}" ${cgList.ctgry_mng_num == view.ctgry_mng_num ? 'selected' : ''}>${cgList.ctgry_nm}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Product Name <span
											class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="prd_nm"
												value="${view.prd_nm}" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Product#</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="prd_code"
												value="${view.prd_code}">
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Discription</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="prd_dscp"
												value="${view.prd_dscp}">
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">UPC Code</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="upc_code"
												value="${view.upc_code}">
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Status <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="sale_status" required>
												<c:choose>
													<c:when test="${view.sale_status eq 'active' }">
														<option value="active" selected>Active</option>
													</c:when>
													<c:otherwise>
														<option value="active">Active</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${view.sale_status eq 'inactive' }">
														<option value="inactive" selected>Inactive</option>
													</c:when>
													<c:otherwise>
														<option value="inactive">Inactive</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${view.sale_status eq 'delete' }">
														<option value="delete" selected>Delete</option>
													</c:when>
													<c:otherwise>
														<option value="delete">Delete</option>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
									</div>
									<div class="form-group row pb-4">
										<div class="row justify-content-md-center">
											<div class="col-lg-5 col-xl-3 mb-0">Date of
												registration : ${view.crt_ymdt}</div>
											<div class="col-lg-5 col-xl-3 mb-0">Date of
												modification : ${view.mod_ymdt}</div>
										</div>
									</div>

								</div>
							</section>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<section class="card card-dark">
								<header class="card-header">
									<div class="card-actions">
										<a href="#" class="card-action card-action-toggle"
											data-card-toggle></a>
									</div>

									<h2 class="card-title">
										<i class="card-icon bx bx-purchase-tag mx-2"></i>Price Info
									</h2>
									<p class="card-subtitle">Add here the product price info
										with all details and necessary information.</p>
								</header>
								<div class="card-body">
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Cost Price <span class="required">*</span></label>
										<div class="col-lg-6">
											<div class="input-group">
												<span class="input-group-text">$</span> <input type="text"
													class="form-control" name="cost_price"
													value="<fmt:formatNumber value="${view.cost_price}" pattern="#,##0.00"/>"
													required />
											</div>
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Unit Price <span class="required">*</span></label>
										<div class="col-lg-6">
											<div class="input-group">
												<span class="input-group-text">$</span> <input type="text"
													class="form-control" name="unit_price"
													value="<fmt:formatNumber value="${view.unit_price}" pattern="#,##0.00"/>"
													required />
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>

					<c:if test="${_prd_mng_num ne '0'}">
						<div class="row">
							<div class="col">
								<section class="card card-dark">
									<header class="card-header">
										<div class="card-actions">
											<a href="#" class="card-action card-action-toggle"
												data-card-toggle></a>
										</div>

										<h2 class="card-title">
											<i class="card-icon bx bx-user-circle mx-2"></i>Commission
											Info
										</h2>
										<p class="card-subtitle">Add here the user commission info
											with all details and necessary information.</p>
									</header>
									<div class="card-body">
										<div class="row justify-content-md-center">
											<div class="col-lg-10">
												<div class="datatables-header-footer-wrapper">
													<div class="datatable-header">
														<div class="row align-items-center mb-0">
															<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
																<c:choose>
																	<c:when test="${umvo.write_yn eq 'y'}">
																		<a
																			class="col-12 modal-with-form btn btn-primary btn-md btn-py-1 px-lg-5"
																			href="#modalForm">Add <i class="fas fa-plus"></i></a>
																	</c:when>
																	<c:otherwise>
																		<a
																			onclick="alert('You do not have permission to write.');return false;"
																			class="col-12 btn btn-primary btn-md btn-py-1 px-lg-5">Add
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
																	</select>
																</div>
															</div>
															<div
																class="col-8 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
																<div
																	class="d-flex align-items-lg-center flex-column flex-lg-row">
																	<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
																		class="form-control filter-by" name="filter-by">
																		<option value="all" selected>All</option>
																		<option value="1">User ID</option>
																		<option value="2">First Name</option>
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
															</div>
														</div>
													</div>
													<table class="table table-ecommerce-simple mb-0"
														id="datatable-ecommerce-list" style="min-width: 550px;">
														<thead>
															<tr>
																<th width="3%"><input type="checkbox"
																	name="select-all"
																	class="select-all checkbox-style-1 p-relative top-2"
																	value="" /></th>
																<th>User ID</th>
																<th>First Name</th>
																<th width="40px" style="min-width: 30px">%</th>
																<th>Modify</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${pcList}" var="pcList"
																varStatus="status">
																<tr>
																	<form name="prdcomms${status.count}"
																		action="product-comms-modify">
																		<td width="30"><input type="checkbox"
																			name="checkboxRow1"
																			class="checkbox-style-1 p-relative top-2" value="" /></td>
																		<td>${pcList.user_id }</td>
																		<td>${pcList.user_nm_f }</td>
																		<td><input type="hidden" name="prd_mng_num_c"
																			value="${pcList.prd_mng_num}"> <input
																			type="hidden" name="user_num"
																			value="${pcList.user_num}"> <input
																			type="text" class="form-control input-block"
																			name="comms_rate"
																			value="<fmt:formatNumber value="${pcList.comms_rate}" pattern="#,##0.00"/>"></td>
																		<td class="actions">
																			<button type="submit"
																				formaction="product-comms-modify"
																				class="btn btn-light btn-px-4 py-2 border font-weight-semibold text-color-dark 	text-3 fas fa-pencil-alt">
																				Modify</button>
																		</td>
																	</form>
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
															<div
																class="col-lg-auto order-2 order-lg-3 mb-3 mb-lg-0 justify-content-center">
																<div class="pagination-wrapper"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>

							</div>
						</div>
					</c:if>
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
									<button type="button"
										onclick="alert('You do not have permission to write.');return false;"
										class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading...">
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
							<a href="product-list.html"
								class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Cancel</a>
						</div>
						<div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
							<c:choose>
								<c:when test="${umvo.delete_yn eq 'y'}">
									<a href="product-del?prd_mng_num=${view.prd_mng_num}"
										class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1">
										<i class="bx bx-trash text-4 me-2"></i> Delete
									</a>
								</c:when>
								<c:otherwise>
									<a
										onclick="alert('You do not have permission to delete.');return false;"
										class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1">
										<i class="bx bx-trash text-4 me-2"></i> Delete
									</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</form>
				<!-- modelForm start -->
				<div id="modalForm" class="modal-block modal-block-md mfp-hide">
					<section class="card">
						<header class="card-header">
							<h2 class="card-title">User List</h2>
						</header>
						<div class="card-body">
							<div class="datatables-header-footer-wrapper">
								<div class="datatable-header">
									<div class="row align-items-center mb-0">
										<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
											<div
												class="d-flex align-items-lg-center flex-column flex-lg-row">
												<label class="ws-nowrap me-3 mb-0">Show:</label> <select
													class="form-control results-per-page"
													name="results-per-page">
													<option value="10" selected>5</option>
													<option value="25">10</option>
												</select>
											</div>
										</div>
										<div
											class="col-8 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
											<div
												class="d-flex align-items-lg-center flex-column flex-lg-row">
												<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
													class="form-control filter-by" name="filter-by">
													<option value="all" selected>All</option>
													<option value="1">User ID</option>
													<option value="2">First Name</option>
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
										</div>
									</div>
								</div>
								<form commandName="ProductCommsVO" action="product-comms"
									method="post" id="productcommsfrom">
									<table class="table table-ecommerce-simple mb-0"
										id="adduser-ecommerce-list">
										<thead>
											<tr>
												<th width="3%"><input type="checkbox" name="select-all"
													class="select-all checkbox-style-1 p-relative top-2"
													value="" /></th>
												<th>User ID</th>
												<th>First Name</th>
												<th width="40px" style="min-width: 30px">%</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${usList}" var="usList" varStatus="status">
												<tr>
													<td width="30"><input type="hidden"
														name="productCommsList[${status.count-1}].prd_mng_num"
														value="${view.prd_mng_num}"> <input type="hidden"
														name="productCommsList[${status.count-1}].user_num"
														value="${usList.user_num}"> <input type="checkbox"
														name="productCommsList[${status.count-1}].chb"
														class="checkbox-style-1 p-relative top-2" value="1" /></td>
													<td>${usList.user_id}</td>
													<td>${usList.user_nm_f}</td>
													<td class="center"><input type="text"
														class="form-control input-block"
														name="productCommsList[${status.count-1}].comms_rate"
														value="10"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<footer class="card-footer">
										<div class="row">
											<div class="col-md-12 center">
												<button type="submit" form="productcommsfrom"
													class="btn btn-primary px-4">Add</button>
												<button class="btn btn-default modal-dismiss">Cancel</button>
											</div>
										</div>
									</footer>
								</form>
							</div>
						</div>

					</section>
				</div>

				<!-- modelForm end -->

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
	<script src="../resources/js/examples/product.datatables.list.js"></script>
	<script
		src="../resources/js/examples/product.adduser.datatables.list.js"></script>
	<script src="../resources/js/examples/examples.modals.js"></script>
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