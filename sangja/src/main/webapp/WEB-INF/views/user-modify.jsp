<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>

<html class="fixed sidebar-left-collapsed">
<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=user-modify"></jsp:forward>
</c:if>
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
		<c:set var="secondmenu_code" value='3' />
		<c:set var="third_code" value='0' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">User</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Basic</span></li>

							<li><span>User Management </span></li>

							<li><span>User</span></li>

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
											<input type="text" class="form-control" name="user_id"
												value="${view.user_id}" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Password <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="password" class="form-control" name="user_pwd"
												value="${view.user_pwd}" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Category <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="category" required>
												<option value="employee"
													${view.category == 'employee' ? 'selected="selected"' : '' }>Employee</option>
												<option value="commissioner"
													${view.category == 'commissioner' ? 'selected="selected"' : '' }>Commissioner</option>
												<option value="seller"
													${view.category == 'seller' ? 'selected="selected"' : '' }>Individual
													Seller</option>
											</select>
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">First Name <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="user_nm_f"
												value="${view.user_nm_f}" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Last Name <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="user_nm_l"
												value="${view.user_nm_l}" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Phone# <span class="required">*</span></label>
										<div class="col-lg-6">
											<input type="tel" class="form-control" name="phone_no"
												value="${view.phone_no}" required />
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Job</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" name="job"
												value="${view.job}">
										</div>
									</div>
									<div class="form-group row pb-4">
										<label class="col-lg-3 control-label text-lg-end pt-2"
											for="inputDefault">Status <span class="required">*</span></label>
										<div class="col-lg-6">
											<select class="form-control" name="user_status" required>
												<c:choose>
													<c:when test="${view.user_status eq 'active'}">
														<option value="active" selected>Active</option>
													</c:when>
													<c:otherwise>
														<option value="active">Active</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${view.user_status eq 'inactive'}">
														<option value="inactive" selected>Inactive</option>
													</c:when>
													<c:otherwise>
														<option value="inactive">Inactive</option>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${view.user_status eq 'delete'}">
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
									<input type="hidden" class="form-control" name="editor"
										value="tester"> <input type="hidden"
										class="form-control" name="user_num" value="${view.user_num}">

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
																value="" onchange="check1(this)" /></th>
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

														<c:forEach items="${cuList}" var="cuList"
															varStatus="status">
															<tr>
																<td width="30"><input type="checkbox"
																	name="UserCustVOList[${status.count-1}].chb"
																	class="checkbox-style-1 p-relative top-2"
																	value="${cuList.cust_num}" onclick="check(this)" /> <input
																	type="hidden"
																	name="UserCustVOList[${status.count-1}].mng_user_num"
																	value="${view.user_num}"> <input type="hidden"
																	name="UserCustVOList[${status.count-1}].cust_num"
																	value="${cuList.cust_num}"></td>
																<td>${cuList.cust_nm}</td>
																<td>${cuList.addr}</td>
																<td>${cuList.city}</td>
																<td>${cuList.state}</td>
																<td>${cuList.zip_code}</td>
																<td>${cuList.visit_term}</td>
																<td><span class="ecommerce-status active">${cuList.cust_status}</span></td>
															</tr>

														</c:forEach>

													</tbody>
												</table>

												<div class="datatable-footer">
													<div
														class="row align-items-center justify-content-between mt-3">
														<div class="col-lg-auto order-1 order-lg-1 mb-3 mb-lg-0">
															<button id="del"
																class="col-12 btn btn-danger btn-md btn-py-1 px-lg-5"
																type="submit" form="usercustdelform">
																Delete <i class="fas fa-minus"></i>
															</button>
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
																<c:choose>
																	<c:when test="${umList[0].read_yn eq 'y'}">
																		<input type="checkbox" id="basicProductCategory1"
																			name="mn111_1" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicProductCategory1"
																			name="mn111_1" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="basicProductCategory1"> View </label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[0].write_yn eq 'y'}">
																		<input type="checkbox" id="basicProductCategory2"
																			name="mn111_2" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicProductCategory2"
																			name="mn111_2" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="basicProductCategory2">Register </label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[0].delete_yn eq 'y'}">
																		<input type="checkbox" id="basicProductCategory3"
																			name="mn111_3" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicProductCategory3"
																			name="mn111_3" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="basicProductCategory3">Modify&amp;Delete
																</label>
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
																<c:choose>
																	<c:when test="${umList[1].read_yn eq 'y'}">
																		<input type="checkbox" id="basicProductProduct1"
																			name="mn112_1" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicProductProduct1"
																			name="mn112_1" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="basicProductProduct1">View</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[1].write_yn eq 'y'}">
																		<input type="checkbox" id="basicProductProduct2"
																			name="mn112_2" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicProductProduct2"
																			name="mn112_2" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="basicProductProduct2">Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[1].delete_yn eq 'y'}">
																		<input type="checkbox" id="basicProductProduct3"
																			name="mn112_3" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicProductProduct3"
																			name="mn112_3" value="y">
																	</c:otherwise>
																</c:choose>
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
																<c:choose>
																	<c:when test="${umList[2].read_yn eq 'None'}">
																		<input type="radio" id="basicCustomerCustomer1"
																			checked="checked" name="mn121_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="basicCustomerCustomer1"
																			name="mn121_1" value="None">
																	</c:otherwise>
																</c:choose>
																<label for="basicCustomerCustomer1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[2].read_yn eq 'All'}">
																		<input type="radio" id="basicCustomerCustomer2"
																			checked="checked" name="mn121_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="basicCustomerCustomer2"
																			name="mn121_1" value="All">
																	</c:otherwise>
																</c:choose>
																<label for="basicCustomerCustomer2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[2].read_yn eq 'Territory Only'}">
																		<input type="radio" id="basicCustomerCustomer3"
																			checked="checked" name="mn121_1"
																			value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="basicCustomerCustomer3"
																			name="mn121_1" value="Territory Only">
																	</c:otherwise>
																</c:choose>
																<label for="basicCustomerCustomer3"> Territory
																	Only</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[2].write_yn eq 'y'}">
																		<input type="checkbox" id="basicCustomerCustomer4"
																			name="mn121_2" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="basicCustomerCustomer4"
																			name="mn121_2" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="basicCustomerCustomer4"> Register</label>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[2].delete_yn eq 'y'}">
																			<input type="checkbox" id="basicCustomerCustomer5"
																				name="mn121_3" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="basicCustomerCustomer5"
																				name="mn121_3" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicCustomerCustomer4">
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
																	<c:choose>
																		<c:when test="${umList[3].read_yn eq 'y'}">
																			<input type="checkbox" id="basicUserManagment1"
																				name="mn131_1" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="basicUserManagment1"
																				name="mn131_1" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicUserManagment1"> View</label>
																</div>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[3].write_yn eq 'y'}">
																			<input type="checkbox" id="basicUserManagment2"
																				name="mn131_2" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="basicUserManagment2"
																				name="mn131_2" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicUserManagment2"> Register</label>
																</div>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[3].delete_yn eq 'y'}">
																			<input type="checkbox" id="basicUserManagment3"
																				name="mn131_3" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="basicUserManagment3"
																				name="mn131_3" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicUserManagment3">
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
																	<c:choose>
																		<c:when test="${umList[4].read_yn eq 'None'}">
																			<input type="radio" id="basicCustomerVisi1"
																				checked="checked" name="mn211_1" value="None">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="basicCustomerVisi1"
																				name="mn211_1" value="None">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicCustomerVisi1"> None</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when test="${umList[4].read_yn eq 'All'}">
																			<input type="radio" id="basicCustomerVisi2"
																				checked="checked" name="mn211_1" value="All">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="basicCustomerVisi2"
																				name="mn211_1" value="All">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicCustomerVisi2"> All</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when
																			test="${umList[4].read_yn eq 'Territory Only'}">
																			<input type="radio" id="basicCustomerVisi3"
																				checked="checked" name="mn211_1" value="Territory Only">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="basicCustomerVisi3"
																				name="mn211_1" value="Territory Only">
																		</c:otherwise>
																	</c:choose>
																	<label for="basicCustomerVisi3"> Territory Only</label>
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
																	<c:choose>
																		<c:when test="${umList[5].read_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOnSite1"
																				name="mn212_1" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOnSite1"
																				name="mn212_1" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesSalesOnSite1"> View</label>
																</div>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[5].write_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOnSite2"
																				name="mn212_2" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOnSite2"
																				name="mn212_2" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesSalesOnSite2"> Register</label>
																</div>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[5].delete_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOnSite3"
																				name="mn212_3" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOnSite3"
																				name="mn212_3" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesSalesOnSite3">
																		Modify&amp;Delete</label>
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
																	<c:choose>
																		<c:when test="${umList[6].read_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOther1"
																				name="mn213_1" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOther1"
																				name="mn213_1" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesSalesOther1"> View</label>
																</div>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[6].write_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOther2"
																				name="mn213_2" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOther2"
																				name="mn213_2" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesSalesOther2"> Register</label>
																</div>
																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[6].delete_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOther3"
																				name="mn213_3" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOther3"
																				name="mn213_3" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesSalesOther3">
																		Modify&amp;Delete</label>
																</div>
															</div>
														</div>
														<div class="row pb-3">
															<div class="col-lg-2">
																<span>Order Report</span>
															</div>
															<div class="col-lg-auto">
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when test="${umList[7].read_yn eq 'None'}">
																			<input type="radio" id="salesOtherReport1"
																				checked="checked" name="mn214_1" value="None">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesOtherReport1"
																				name="mn214_1" value="None">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesOtherReport1"> None</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when test="${umList[7].read_yn eq 'All'}">
																			<input type="radio" id="salesOtherReport2"
																				checked="checked" name="mn214_1" value="All">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesOtherReport2"
																				name="mn214_1" value="All">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesOtherReport2"> All</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when
																			test="${umList[7].read_yn eq 'Territory Only'}">
																			<input type="radio" id="salesOtherReport3"
																				checked="checked" name="mn214_1"
																				value="Territory Only">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesOtherReport3"
																				name="mn214_1" value="Territory Only">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesOtherReport3"> Territory Only</label>
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
																	<c:choose>
																		<c:when test="${umList[8].read_yn eq 'None'}">
																			<input type="radio" id="salesAr1" checked="checked"
																				name="mn221_1" value="None">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesAr1" name="mn221_1"
																				value="None">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesAr1"> None</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when test="${umList[8].read_yn eq 'All'}">
																			<input type="radio" id="salesAr2" checked="checked"
																				name="mn221_1" value="All">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesAr2" name="mn221_1"
																				value="All">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesAr2"> All</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when
																			test="${umList[8].read_yn eq 'Territory Only'}">
																			<input type="radio" id="salesAr3" checked="checked"
																				name="mn221_1" value="Territory Only">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesAr3" name="mn221_1"
																				value="Territory Only">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesAr3"> Territory Only</label>
																</div>

																<div
																	class="checkbox-custom chekbox-default form-check-inline">
																	<c:choose>
																		<c:when test="${umList[8].write_yn eq 'y'}">
																			<input type="checkbox" id="salesSalesOther2"
																				name="mn221_2" value="y" checked>
																		</c:when>
																		<c:otherwise>
																			<input type="checkbox" id="salesSalesOther2"
																				name="mn221_2" value="y">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesAr4"> AR Register</label>
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
																	<c:choose>
																		<c:when test="${umList[9].read_yn eq 'None'}">
																			<input type="radio" id="salesClose1"
																				checked="checked" name="mn231_1" value="None">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesClose1" name="mn231_1"
																				value="None">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesClose1"> None</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when test="${umList[9].read_yn eq 'All'}">
																			<input type="radio" id="salesClose2"
																				checked="checked" name="mn231_1" value="All">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesClose2" name="mn231_1"
																				value="All">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesClose2"> All</label>
																</div>
																<div class="radio-custom form-check-inline">
																	<c:choose>
																		<c:when
																			test="${umList[9].read_yn eq 'Territory Only'}">
																			<input type="radio" id="salesClose3"
																				checked="checked" name="mn231_1"
																				value="Territory Only">
																		</c:when>
																		<c:otherwise>
																			<input type="radio" id="salesClose3" name="mn231_1"
																				value="Territory Only">
																		</c:otherwise>
																	</c:choose>
																	<label for="salesClose3"> Territory Only</label>
																</div>

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
																<c:choose>
																	<c:when test="${umList[10].read_yn eq 'None'}">
																		<input type="radio" id="inventoryInventory1"
																			checked="checked" name="mn311_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="inventoryInventory1"
																			name="mn311_1" value="None">
																	</c:otherwise>
																</c:choose>
																<label for="inventoryInventory1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[10].read_yn eq 'All'}">
																		<input type="radio" id="inventoryInventory2"
																			checked="checked" name="mn311_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="inventoryInventory2"
																			name="mn311_1" value="All">
																	</c:otherwise>
																</c:choose>
																<label for="inventoryInventory2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[10].read_yn eq 'Territory Only'}">
																		<input type="radio" id="inventoryInventory3"
																			checked="checked" name="mn311_1"
																			value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="inventoryInventory3"
																			name="mn311_1" value="Territory Only">
																	</c:otherwise>
																</c:choose>
																<label for="inventoryInventory3"> Territory Only</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[10].write_yn eq 'y'}">
																		<input type="checkbox" id="inventoryInventory4"
																			name="mn311_2" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="inventoryInventory4"
																			name="mn311_2" value="y">
																	</c:otherwise>
																</c:choose>
																<label for="inventoryInventory4"> Register</label>
															</div>
															<div
																class="checkbox-custom chekbox-default form-check-inline">
																<c:choose>
																	<c:when test="${umList[10].delete_yn eq 'y'}">
																		<input type="checkbox" id="inventoryInventory5"
																			name="mn311_3" value="y" checked>
																	</c:when>
																	<c:otherwise>
																		<input type="checkbox" id="inventoryInventory5"
																			name="mn311_3" value="y">
																	</c:otherwise>
																</c:choose>
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
																<c:choose>
																	<c:when test="${umList[11].read_yn eq 'None'}">
																		<input type="radio" id="reportSales1"
																			checked="checked" name="mn411_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportSales1" name="mn411_1"
																			value="None">
																	</c:otherwise>
																</c:choose>
																<label for="reportSales1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[11].read_yn eq 'All'}">
																		<input type="radio" id="reportSales2"
																			checked="checked" name="mn411_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportSales2" name="mn411_1"
																			value="All">
																	</c:otherwise>
																</c:choose>
																<label for="reportSales2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[11].read_yn eq 'Territory Only'}">
																		<input type="radio" id="reportSales3"
																			checked="checked" name="mn411_1"
																			value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportSales3" name="mn411_1"
																			value="Territory Only">
																	</c:otherwise>
																</c:choose>
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
																<c:choose>
																	<c:when test="${umList[12].read_yn eq 'None'}">
																		<input type="radio" id="reportInventory1"
																			checked="checked" name="mn421_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportInventory1"
																			name="mn421_1" value="None">
																	</c:otherwise>
																</c:choose>
																<label for="reportInventory1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[12].read_yn eq 'All'}">
																		<input type="radio" id="reportInventory2"
																			checked="checked" name="mn421_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportInventory2"
																			name="mn421_1" value="All">
																	</c:otherwise>
																</c:choose>
																<label for="reportInventory2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[12].read_yn eq 'Territory Only'}">
																		<input type="radio" id="reportInventory3"
																			checked="checked" name="mn421_1"
																			value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportInventory3"
																			name="mn421_1" value="Territory Only">
																	</c:otherwise>
																</c:choose>
																<label for="reportInventory3"> Territory Only</label>
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
																<c:choose>
																	<c:when test="${umList[13].read_yn eq 'None'}">
																		<input type="radio" id="reportPL1" checked="checked"
																			name="mn431_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportPL1" name="mn431_1"
																			value="None">
																	</c:otherwise>
																</c:choose>
																<label for="reportPL1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[13].read_yn eq 'All'}">
																		<input type="radio" id="reportPL2" checked="checked"
																			name="mn431_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportPL2" name="mn431_1"
																			value="All">
																	</c:otherwise>
																</c:choose>
																<label for="reportPL2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[13].read_yn eq 'Territory Only'}">
																		<input type="radio" id="reportPL3" checked="checked"
																			name="mn431_1" value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportPL3" name="mn431_1"
																			value="Territory Only">
																	</c:otherwise>
																</c:choose>
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
																<c:choose>
																	<c:when test="${umList[14].read_yn eq 'None'}">
																		<input type="radio" id="reportUsage1"
																			checked="checked" name="mn441_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportUsage1" name="mn441_1"
																			value="None">
																	</c:otherwise>
																</c:choose>
																<label for="reportUsage1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[14].read_yn eq 'All'}">
																		<input type="radio" id="reportUsage2"
																			checked="checked" name="mn441_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportUsage2" name="mn441_1"
																			value="All">
																	</c:otherwise>
																</c:choose>
																<label for="reportUsage2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[14].read_yn eq 'Territory Only'}">
																		<input type="radio" id="reportUsage3"
																			checked="checked" name="mn441_1"
																			value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportUsage3" name="mn441_1"
																			value="Territory Only">
																	</c:otherwise>
																</c:choose>
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
																<c:choose>
																	<c:when test="${umList[15].read_yn eq 'None'}">
																		<input type="radio" id="reportAR1" checked="checked"
																			name="mn451_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportAR1" name="mn451_1"
																			value="None">
																	</c:otherwise>
																</c:choose>
																<label for="reportAR1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[15].read_yn eq 'All'}">
																		<input type="radio" id="reportAR2" checked="checked"
																			name="mn451_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportAR2" name="mn451_1"
																			value="All">
																	</c:otherwise>
																</c:choose>
																<label for="reportAR2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[15].read_yn eq 'Territory Only'}">
																		<input type="radio" id="reportAR3" checked="checked"
																			name="mn451_1" value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportAR3" name="mn451_1"
																			value="Territory Only">
																	</c:otherwise>
																</c:choose>
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
																<c:choose>
																	<c:when test="${umList[16].read_yn eq 'None'}">
																		<input type="radio" id="reportCommission1"
																			checked="checked" name="mn461_1" value="None">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportCommission1"
																			name="mn461_1" value="None">
																	</c:otherwise>
																</c:choose>
																<label for="reportCommission1"> None</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when test="${umList[16].read_yn eq 'All'}">
																		<input type="radio" id="reportCommission2"
																			checked="checked" name="mn461_1" value="All">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportCommission2"
																			name="mn461_1" value="All">
																	</c:otherwise>
																</c:choose>
																<label for="reportCommission2"> All</label>
															</div>
															<div class="radio-custom form-check-inline">
																<c:choose>
																	<c:when
																		test="${umList[16].read_yn eq 'Territory Only'}">
																		<input type="radio" id="reportCommission3"
																			checked="checked" name="mn461_1"
																			value="Territory Only">
																	</c:when>
																	<c:otherwise>
																		<input type="radio" id="reportCommission3"
																			name="mn461_1" value="Territory Only">
																	</c:otherwise>
																</c:choose>
																<label for="reportCommission3"> Territory Only</label>
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
							<c:choose>
								<c:when test="${umvo.delete_yn eq 'y'}">
									<button type="submit"
										class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading...">
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:when>
								<c:otherwise>
									<button type="button"
										onclick="alert('You do not have permission to modify.');return false;"
										class="btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
										data-loading-text="Loading..." id="submit" disabled>
										<i class="bx bx-save text-4 me-2"></i> Save
									</button>
								</c:otherwise>
							</c:choose>

						</div>
						<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
							<a href="user-list.html"
								class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Cancel</a>
						</div>
						<div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
							<c:choose>
								<c:when test="${umvo.delete_yn eq 'y'}">
									<a href="user-delete?user_num=${view.user_num}"
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
				<div id="modalForm" class="modal-block modal-block-lg mfp-hide">
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
								<form commandName="UserCustVO" action="user-cust" method="post"
									id="usercustfrom">
									<table class="table table-ecommerce-simple mb-0"
										id="addcustomer-ecommerce-list">
										<thead>
											<tr>
												<th width="3%"><input type="checkbox" name="select-all"
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
											<c:forEach items="${cuNotList}" var="cuNotList"
												varStatus="status">
												<tr>
													<td width="30"><input type="checkbox"
														name="UserCustVOList[${status.count-1}].chb"
														class="checkbox-style-1 p-relative top-2" value="1" /> <input
														type="hidden"
														name="UserCustVOList[${status.count-1}].mng_user_num"
														value="${view.user_num}"> <input type="hidden"
														name="UserCustVOList[${status.count-1}].cust_num"
														value="${cuNotList.cust_num}"></td>
													<td>${cuNotList.cust_nm}</td>
													<td>${cuNotList.addr}</td>
													<td>${cuNotList.city}</td>
													<td>${cuNotList.state}</td>
													<td>${cuNotList.zip_code}</td>
													<td>${cuNotList.visit_term}</td>
													<td><span class="ecommerce-status active">${cuNotList.cust_status}</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
							</div>
						</div>
						<footer class="card-footer">
							<div class="row">
								<div class="col-md-12 center">
									<button type="submit" form="usercustfrom"
										class="btn btn-primary px-4">Add</button>
									<button class="btn btn-default modal-dismiss">Cancel</button>
								</div>
							</div>
						</footer>
						</form>
					</section>
				</div>

				<!-- modelForm end -->

				<!-- end: page -->
			</section>
		</div>

	</section>
	<!-- form commandName="UserCustVO" action="user-cust-del"
													method="post" id="usercustdelform" name="usercustdelform"-->
	<form commandName="UserCustVO" action="user-cust-del" method="post"
		id="usercustdelform" name="usercustdelform">
		<c:forEach items="${cuList}" var="cuList" varStatus="status">
			<input type="hidden" name="UserCustVOList[${status.count-1}].chb"
				id="UserCustVOList[${status.count-1}].chb" value="0">
			<input type="hidden"
				name="UserCustVOList[${status.count-1}].mng_user_num"
				value="${view.user_num}">
			<input type="hidden"
				name="UserCustVOList[${status.count-1}].cust_num"
				value="${cuList.cust_num}">
			<c:set var="cnt" value="${status.count}" />
		</c:forEach>

	</form>
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
	<script src="../resources/js/examples/user.datatables.list.js"></script>
	<script
		src="../resources/js/examples/user.addcustomer.datatables.list.js"></script>
	<script src="../resources/js/examples/examples.modals.js"></script>
	<script>
		//기본정보 수정버튼 클릭시 전송
		$("#del").on("click", function() {
			//alert("aa");
			$("#usercustdelform").submit();

		});
		
		function check(box) {
			//alert(box.name);
			if (box.checked == true) {
				document.getElementById(box.name).value = 1;
			}else{
				document.getElementById(box.name).value = 0;
			}
			//alert(document.getElementById(box.name).vaue);
		}
		
		function check1(box) {
			//alert(${cnt});
			if (box.checked == true) {
				for(i=0;i<${cnt};i++)
				{
					document.getElementById("UserCustVOList["+i+"].chb").value=1;
				}
			}
			else
			{
				for(i=0;i<${cnt};i++)
				{
					document.getElementById("UserCustVOList["+i+"].chb").value=0;
				}
			}
			
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