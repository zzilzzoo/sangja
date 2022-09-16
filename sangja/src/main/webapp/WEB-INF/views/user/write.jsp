<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@	include file="../sideba-fixed.jsp"%>

<html class="fixed sidebar-left-collapsed">
<head>

<!-- Basic -->
<meta charset="UTF-8">

<title>User | SangJa Admin</title>
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
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="vendor/animate/animate.compat.css">
<link rel="stylesheet" href="vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet" href="vendor/boxicons/css/boxicons.min.css" />
<link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet"
	href="vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
<link rel="stylesheet"
	href="vendor/datatables/media/css/dataTables.bootstrap5.css" />

<!-- Theme CSS -->
<link rel="stylesheet" href="css/theme.css" />

<!-- Theme Layout -->
<link rel="stylesheet" href="css/layouts/modern.css" />

<!-- Skin CSS -->
<link rel="stylesheet" href="css/skins/default.css" />

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Head Libs -->
<script src="vendor/modernizr/modernizr.js"></script>

</head>
<body>
	<section class="body">

		<!-- start: header -->
		<c:set var="firstmenu_code" value='1' />
		<c:set var="secondmenu_code" value='3' />
		<c:set var="third_code" value='0' />

		<%@ include file="../header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="../sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">User</h2>
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
					method="post">
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
									<p class="card-subtitle">Add here the user description with
										all details and necessary information.</p>
								</header>
								<div class="card-body">
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">ID <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="user_id" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Password <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="password" class="form-control" name="user_pwd" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Category <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="category" required>
												<option value="employee">Employee</option>
												<option value="commissioner">Commissioner</option>
												<option value="seller">Individual Seller</option>
											</select>
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">First Name <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="user_nm_f" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Last Name <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="user_nm_l" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Phone# <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="tel" class="form-control" name="phone_no" value=""
												required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Job</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="job" value="">
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Status <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="user_status" required>
												<option value="active">Active</option>
												<option value="inactive">Inactive</option>
												<option value="delete">Delete</option>
											</select>
										</div>
									</div>
									<div class="form-group row pb-4">
										<div class="row justify-content-md-center">
											<div class="col-lg-5 col-xl-3 mb-0">Date of
												registration : 2021-11-17</div>
											<div class="col-lg-5 col-xl-3 mb-0">Date of
												modification : 2021-11-17</div>
										</div>
									</div>
									<input type="hidden" class="form-control" name="editor" value="tester">									

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
										<i class="card-icon bx bx-user-circle mx-2"></i>Customer Info
									</h2>
									<p class="card-subtitle">Add here the Customer info with
										all details and necessary information.</p>
								</header>
								<div class="card-body">
									<div class="row justify-content-md-center">
										<div class="col-lg-12">
											<div class="datatables-header-footer-wrapper">
												<div class="datatable-header">
													<div class="row align-items-center mb-0">
														<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
															<a
																class="col-12 modal-with-form btn btn-primary btn-md btn-py-1 px-lg-5"
																href="#modalForm">Add <i class="fas fa-plus"></i></a>
															<!-- modelForm start -->
															<div id="modalForm"
																class="modal-block modal-block-lg mfp-hide">
																<section class="card">
																	<header class="card-header">
																		<h2 class="card-title">Customer List</h2>
																	</header>
																	<div class="card-body">
																		<div class="datatables-header-footer-wrapper">
																			<div class="datatable-header">
																				<div class="row align-items-center mb-0">
																					<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
																						<div
																							class="d-flex align-items-lg-center flex-column flex-lg-row">
																							<label class="ws-nowrap me-3 mb-0">Show:</label>
																							<select class="form-control results-per-page"
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
																							<label class="ws-nowrap me-3 mb-0">Filter
																								By:</label> <select class="form-control filter-by"
																								name="filter-by">
																								<option value="all" selected>All</option>
																								<option value="1">Name</option>
																								<option value="2">address</option>
																								<option value="3">City</option>
																								<option value="4">State</option>
																								<option value="5">Zip Code</option>
																								<option value="7">Status</option>
																							</select>
																						</div>
																					</div>
																					<div
																						class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
																						<div class="search search-style-1-lg mx-lg-auto">
																							<div class="input-group">
																								<input type="text"
																									class="search-term form-control"
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
																				id="addcustomer-ecommerce-list">
																				<thead>
																					<tr>
																						<th width="3%"><input type="checkbox"
																							name="select-all"
																							class="select-all checkbox-style-1 p-relative top-2"
																							value="" /></th>
																						<th>Name</th>
																						<th>address</th>
																						<th>City</th>
																						<th>State</th>
																						<th>Zip Code</th>
																						<th>Visit Term(Week)</th>
																						<th>Status</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td width="30"><input type="checkbox"
																							name="checkboxRow1"
																							class="checkbox-style-1 p-relative top-2"
																							value="" /></td>
																						<td>Fuller's Hill</td>
																						<td>17123 Midway Rd</td>
																						<td>Madison</td>
																						<td>MS</td>
																						<td>39110</td>
																						<td>1</td>
																						<td><span class="ecommerce-status active">Active</span></td>
																					</tr>
																					<tr>
																						<td width="30"><input type="checkbox"
																							name="checkboxRow1"
																							class="checkbox-style-1 p-relative top-2"
																							value="" /></td>
																						<td></td>
																						<td>974 US-51 Madison, MS 39110</td>
																						<td>Madison</td>
																						<td>MS</td>
																						<td>39110</td>
																						<td>1</td>
																						<td><span class="ecommerce-status active">Active</span></td>
																					</tr>
																					<tr>
																						<td width="30"><input type="checkbox"
																							name="checkboxRow1"
																							class="checkbox-style-1 p-relative top-2"
																							value="" /></td>
																						<td>Fuller's Hill</td>
																						<td>974 US-51 Madison, MS 39110</td>
																						<td>Madison</td>
																						<td>MS</td>
																						<td>39110</td>
																						<td>1</td>
																						<td><span class="ecommerce-status active">Active</span></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<footer class="card-footer">
																		<div class="row">
																			<div class="col-md-12 center">
																				<button class="btn btn-primary modal-confirm px-4">Add
																				</button>
																				<button class="btn btn-default modal-dismiss">Cancel</button>
																			</div>
																		</div>
																	</footer>
																</section>
															</div>
															<!-- modelForm end -->
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
																	<option value="1">Name</option>
																	<option value="2">address</option>
																	<option value="3">City</option>
																	<option value="4">State</option>
																	<option value="5">Zip Code</option>
																	<option value="7">Status</option>
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
															<th>Name</th>
															<th>address</th>
															<th>City</th>
															<th>State</th>
															<th>Zip Code</th>
															<th>Visit Term(Week)</th>
															<th>Status</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td width="30"><input type="checkbox"
																name="checkboxRow1"
																class="checkbox-style-1 p-relative top-2" value="" /></td>
															<td>Fuller's Hill</td>
															<td>17123 Midway Rd</td>
															<td>Madison</td>
															<td>MS</td>
															<td>39110</td>
															<td>1</td>
															<td><span class="ecommerce-status active">Active</span></td>
														</tr>
														<tr>
															<td width="30"><input type="checkbox"
																name="checkboxRow1"
																class="checkbox-style-1 p-relative top-2" value="" /></td>
															<td></td>
															<td>974 US-51 Madison, MS 39110</td>
															<td>Madison</td>
															<td>MS</td>
															<td>39110</td>
															<td>1</td>
															<td><span class="ecommerce-status active">Active</span></td>
														</tr>
														<tr>
															<td width="30"><input type="checkbox"
																name="checkboxRow1"
																class="checkbox-style-1 p-relative top-2" value="" /></td>
															<td>Fuller's Hill</td>
															<td>974 US-51 Madison, MS 39110</td>
															<td>Madison</td>
															<td>MS</td>
															<td>39110</td>
															<td>1</td>
															<td><span class="ecommerce-status active">Active</span></td>
														</tr>
													</tbody>
												</table>

												<div class="datatable-footer">
													<div
														class="row align-items-center justify-content-between mt-3">
														<div class="col-lg-auto order-1 order-lg-1 mb-3 mb-lg-0">
															<a class="col-12 btn btn-danger btn-md btn-py-1 px-lg-5"
																href="#">Delete <i class="fas fa-minus"></i></a>
														</div>
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
										<i class="card-icon bx bx-food-menu mx-2"></i>Accessible Menu
									</h2>
									<p class="card-subtitle">Add here the user level with all
										details and necessary information.</p>
								</header>
								<div class="card-body">
									<div class="form-group row pb-4">
										<div class="col-lg-1">
											<span class="text-color-dark text-4">Basic</span>
										</div>
										<div class="col-lg-11">
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Product Managment</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span>Category</span>
														</div>
														<div class="col-lg-auto">
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicProductCategory1">
																<label for="basicProductCategory1">View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicProductCategory2">
																<label for="basicProductCategory2">Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicProductCategory3">
																<label for="basicProductCategory3">Modify&amp;Delete</label>
															</div>
														</div>
													</div>
													<div class="row pb-3">
														<div class="col-lg-2">
															<span>Product</span>
														</div>
														<div class="col-lg-auto">
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicProductProduct1">
																<label for="basicProductProduct1">View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicProductProduct2">
																<label for="basicProductProduct2">Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicProductProduct3">
																<label for="basicProductProduct3">Modify&amp;Delete</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Customer Managment</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input type="radio" name="basicCustomerCustomer"
																	id="basicCustomerCustomer1" checked="checked">
																<label for="basicCustomerCustomer1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="basicCustomerCustomer"
																	id="basicCustomerCustomer2"> <label
																	for="basicCustomerCustomer2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="basicCustomerCustomer"
																	id="basicCustomerCustomer3"> <label
																	for="basicCustomerCustomer3"> Territory Only</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicCustomerCustomer4">
																<label for="basicCustomerCustomer4"> Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicCustomerCustomer5">
																<label for="basicCustomerCustomer5">
																	Modify&amp;Delete</label>
															</div>
														</div>
													</div>

												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">User Managment</span>
												</div>
												<div class="col-lg-10">
													<div class="row">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicUserManagment1">
																<label for="basicUserManagment1"> View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicUserManagment2">
																<label for="basicUserManagment2"> View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="basicUserManagment3">
																<label for="basicUserManagment3"> View</label>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group row pb-4">
										<div class="col-lg-1">
											<span class="text-color-dark text-4">Sales</span>
										</div>
										<div class="col-lg-11">
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Sales Managment</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span>Today Visit</span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="basicCustomerVisit" type="radio"
																	id="basicCustomerVisi1" checked="checked"> <label
																	for="basicCustomerVisi1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="basicCustomerVisit"
																	id="basicCustomerVisi2"> <label
																	for="basicCustomerVisi2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="basicCustomerVisit"
																	id="basicCustomerVisi3"> <label
																	for="basicCustomerVisi3"> Territory Only</label>
															</div>
														</div>
													</div>
													<div class="row pb-3">
														<div class="col-lg-2">
															<span>On-Site Sales</span>
														</div>
														<div class="col-lg-auto">
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesSalesOnSite1"> <label
																	for="salesSalesOnSite1"> View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesSalesOnSite2"> <label
																	for="salesSalesOnSite2"> Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesSalesOnSite3"> <label
																	for="salesSalesOnSite3"> Modify&amp;Delete</label>
															</div>
														</div>
													</div>
													<div class="row pb-3">
														<div class="col-lg-2">
															<span>Other Sales</span>
														</div>
														<div class="col-lg-auto">
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesSalesOther1"> <label
																	for="salesSalesOther1"> View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesSalesOther2"> <label
																	for="salesSalesOther2"> Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesSalesOther3"> <label
																	for="salesSalesOther3"> Modify&amp;Delete</label>
															</div>
														</div>
													</div>
													<div class="row pb-3">
														<div class="col-lg-2">
															<span>Order Report</span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="salesOtherReport" type="radio"
																	id="salesOtherReport1" checked="checked"> <label
																	for="salesOtherReport1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="salesOtherReport"
																	id="salesOtherReport2"> <label
																	for="salesOtherReport2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="salesOtherReport"
																	id="salesOtherReport3"> <label
																	for="salesOtherReport3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">AR Managment</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="salesAr" type="radio" id="salesAr1"
																	checked="checked"> <label for="salesAr1">
																	None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="salesAr" id="salesAr2">
																<label for="salesAr2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="salesAr" id="salesAr3">
																<label for="salesAr3"> Territory Only</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="salesAr4"> <label
																	for="salesAr4"> AR Register</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Sales Close</span>
												</div>
												<div class="col-lg-10">
													<div class="row">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="salesClose" type="radio" id="salesClose1"
																	checked="checked"> <label for="salesClose1">
																	None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="salesClose" id="salesClose2">
																<label for="salesClose2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="salesClose" id="salesClose3">
																<label for="salesClose3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group row pb-4">
										<div class="col-lg-1">
											<span class="text-color-dark text-4">Inventory</span>
										</div>
										<div class="col-lg-11">
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Inventory Managment</span>
												</div>
												<div class="col-lg-10">
													<div class="row">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="inventoryInventory" type="radio"
																	id="inventoryInventory1" checked="checked"> <label
																	for="inventoryInventory1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="inventoryInventory"
																	id="inventoryInventory2"> <label
																	for="inventoryInventory2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="inventoryInventory"
																	id="inventoryInventory3"> <label
																	for="inventoryInventory3"> Territory Only</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="inventoryInventory4">
																<label for="inventoryInventory4"> Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<input type="checkbox" id="inventoryInventory5">
																<label for="inventoryInventory5">
																	Modify&amp;Delete</label>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group row pb-4">
										<div class="col-lg-1">
											<span class="text-color-dark text-4">Report</span>
										</div>
										<div class="col-lg-11">
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Sales Report</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="reportSales" type="radio" id="reportSales1"
																	checked="checked"> <label for="reportSales1">
																	None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportSales" id="reportSales2">
																<label for="reportSales2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportSales" id="reportSales3">
																<label for="reportSales3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Inventory Report</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="reportInventory" type="radio"
																	id="reportInventory1" checked="checked"> <label
																	for="reportInventory1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportInventory"
																	id="reportInventory2"> <label
																	for="reportInventory2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportInventory"
																	id="reportInventory3"> <label
																	for="reportInventory3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">P&amp;L Report</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="reportPL" type="radio" id="reportPL1"
																	checked="checked"> <label for="reportPL1">
																	None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportPL" id="reportPL2">
																<label for="reportPL2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportPL" id="reportPL3">
																<label for="reportPL3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Usage Report</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="reportUsage" type="radio" id="reportUsage1"
																	checked="checked"> <label for="reportUsage1">
																	None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportUsage" id="reportUsage2">
																<label for="reportUsage2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportUsage" id="reportUsage3">
																<label for="reportUsage3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">AR Report</span>
												</div>
												<div class="col-lg-10">
													<div class="row pb-3">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="reportAR" type="radio" id="reportAR1"
																	checked="checked"> <label for="reportAR1">
																	None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportAR" id="reportAR2">
																<label for="reportAR2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportAR" id="reportAR3">
																<label for="reportAR3"> Territory Only</label>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-2">
													<span class="text-color-dark">Commission Report</span>
												</div>
												<div class="col-lg-10">
													<div class="row">
														<div class="col-lg-2">
															<span></span>
														</div>
														<div class="col-lg-auto">
															<div class="radio-custom form-check-inline">
																<input name="reportCommission" type="radio"
																	id="reportCommission1" checked="checked"> <label
																	for="reportCommission1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportCommission"
																	id="reportCommission2"> <label
																	for="reportCommission2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<input type="radio" name="reportCommission"
																	id="reportCommission3"> <label
																	for="reportCommission3"> Territory Only</label>
															</div>
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

					<div class="row action-buttons">
						<div class="col-12 col-md-auto">
							<button type="submit"
								class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
								data-loading-text="Loading...">
								<i class="bx bx-save text-4 me-2"></i> Save
							</button>
						</div>
						<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
							<a href="user-list.html"
								class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Cancel</a>
						</div>
						<div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
							<a href="#"
								class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1">
								<i class="bx bx-trash text-4 me-2"></i> Delete
							</a>
						</div>
					</div>
				</form>

				<!-- end: page -->
			</section>
		</div>

	</section>

	<!-- Vendor -->
	<script src="vendor/jquery/jquery.js"></script>
	<script src="vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="vendor/popper/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="vendor/common/common.js"></script>
	<script src="vendor/nanoscroller/nanoscroller.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.js"></script>
	<script src="vendor/jquery-placeholder/jquery.placeholder.js"></script>

	<!-- Specific Page Vendor -->
	<script src="vendor/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/media/js/dataTables.bootstrap5.min.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="js/theme.init.js"></script>

	<!-- Examples -->
	<script src="js/examples/user.datatables.list.js"></script>
	<script src="js/examples/user.addcustomer.datatables.list.js"></script>
	<script src="js/examples/examples.modals.js"></script>


</body>
</html>