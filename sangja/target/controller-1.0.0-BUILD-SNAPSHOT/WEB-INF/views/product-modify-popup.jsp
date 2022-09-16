<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Product | SangJa Admin</title>
		<meta name="keywords" content="SangJa Admin" />
		<meta name="description" content="SangJa Admin">
		<meta name="author" content="Sangja">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,300,400,600,700,800,900" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="vendor/animate/animate.compat.css">
		<link rel="stylesheet" href="vendor/font-awesome/css/all.min.css" />
		<link rel="stylesheet" href="vendor/boxicons/css/boxicons.min.css" />
		<link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="vendor/datatables/media/css/dataTables.bootstrap5.css" />

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
		<section class="body background-color-light">
			<div id="modalForm">
				<section class="card">
					<header class="card-header">
						<h2 class="card-title">User List</h2>
					</header>
					<div class="card-body">
						<div class="datatables-header-footer-wrapper">
							<div class="datatable-header">
								<div class="row align-items-center mb-0">
									<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
										<div class="d-flex align-items-lg-center flex-column flex-lg-row">
											<label class="ws-nowrap me-3 mb-0">Show:</label>
											<select class="form-control results-per-page" name="results-per-page">
												<option value="10" selected>5</option>
												<option value="25">10</option>
											</select>
										</div>
									</div>
									<div class="col-8 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
										<div class="d-flex align-items-lg-center flex-column flex-lg-row">
											<label class="ws-nowrap me-3 mb-0">Filter By:</label>
											<select class="form-control filter-by" name="filter-by">
												<option value="all" selected>All</option>
												<option value="1">User ID</option>
												<option value="2">First Name</option>
											</select>
										</div>
									</div>
									<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
										<div class="search search-style-1-lg mx-lg-auto">
											<div class="input-group">
												<input type="text" class="search-term form-control" name="search-term" id="search-term" placeholder="Search Product">
												<button class="btn btn-default" type="submit"><i class="bx bx-search"></i></button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<table class="table table-ecommerce-simple mb-0" id="adduser-ecommerce-list">
								<thead>
									<tr>
										<th width="3%"><input type="checkbox" name="select-all" class="select-all checkbox-style-1 p-relative top-2" value="" /></th>
										<th>User ID</th>
										<th>First Name</th>
										<th width="40px" style="min-width: 30px">%</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td width="30"><input type="checkbox" name="checkboxRow1" class="checkbox-style-1 p-relative top-2" value="" /></td>
										<td>10001</td>
										<td>CangHo</td>
										<td class="center"><input type="text" class="form-control input-block" value=""></td>
									</tr>
									<tr>
										<td><input type="checkbox" name="checkboxRow1" class="checkbox-style-1 p-relative top-2" value="" /></td>
										<td>10002</td>
										<td>Danielra</td>
										<td class="center"><input type="text" class="form-control input-block" value="10"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<footer class="card-footer fixed-bottom">
						<div class="row">
							<div class="col-md-12 center">
								<button class="btn btn-primary px-4">Add</button>
								<button class="btn btn-default " onclick="self.close();">Cancel</button>
							</div>
						</div>
					</footer>
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
		<script src="js/examples/product.adduser.datatables.list.js"></script>


	</body>
</html>