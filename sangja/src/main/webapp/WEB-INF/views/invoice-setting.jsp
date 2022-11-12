<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@	include file="sideba-fixed.jsp"%>

<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=other-sales"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>Other Sales | SangJa Admin</title>
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
	href="../resources/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
<link rel="stylesheet"
	href="../resources/vendor/datatables/media/css/dataTables.bootstrap5.css" />
<link rel="stylesheet"
	href="../resources/vendor/select2/css/select2.css" />
<link rel="stylesheet"
	href="../resources/vendor/select2-bootstrap-theme/select2-bootstrap.min.css" />


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
	<!-- start: header -->
	<c:set var="firstmenu_code" value='2' />
	<c:set var="secondmenu_code" value='1' />
	<c:set var="third_code" value='3' />

	<%@ include file="header.jsp"%>
	<!-- end: header -->



	<div class="inner-wrapper">
		<!-- start: sidebar -->
		<%@ include file="sidebar-left.jsp"%>
		<!-- end: sidebar -->

		<section role="main" class="content-body content-body-modern mt-0">
			<header class="page-header page-header-left-inline-breadcrumb">
				<h2 class="font-weight-bold text-6">Other</h2>
				<div class="right-wrapper">
					<ol class="breadcrumbs">
						<li><a href="index.html"> <i class="bx bx-home-alt"></i>
						</a></li>

						<li><span>Sales</span></li>

						<li><span>Sales Management </span></li>

						<li><span>Other Sales</span></li>

					</ol>

				</div>
			</header>

			<!-- start: page -->
			<form name="saveInv" class="ecommerce-form action-buttons-fixed"
				method="post" action="#">
				<input type="hidden" name="sale_num1" value="${ivvo.sale_num}">
				<input type="hidden" name="cust_num" value="${ivvo.cust_num}">
				<div class="row">
					<div class="col">
						<div class="card card-modern">
							<div class="card-header">
								<h2 class="card-title">Invoice Setting</h2>
							</div>
							<div class="card-body">
								<div class="col-lg-12 text-center">
									<h1 class="mt-0 mb-0 text-dark">Invoice</h1>
								</div>
								<div class="row mx-1">
									<div class="col-lg-6">
										<h3>
											<strong>TX EAGLE SUPPLY</strong>
										</h3>
										<div class="address">
											2051 W Walnut Hill Ln <br /> Irving, TX 75038 <br /> 972 )
											600-8443
										</div>
									</div>
									<div class="col-lg-6">
										<div class="row">
											<div class="row justify-content-end pt-1">
												<div class="col-lg-auto text-end text-dark">
													<strong>Date:</strong>
												</div>
												<div class="col-lg-4 value">
													<div class="input-group">
														<span class="input-group-text"> <i
															class="fas fa-calendar-alt"></i>
														</span> <input type="text" data-plugin-datepicker
															class="form-control" name="inv_date"
															value="${ivvo.inv_date }">
													</div>
												</div>
											</div>
											<div class="row justify-content-end pt-1">
												<div class="col-lg-auto text-end text-dark">
													<strong>Invoice #:</strong>
												</div>
												<div class="col-lg-4">
													<input type="text" class="form-control" name="invoice_no"
														value="${ivvo.invoice_no }">
												</div>
											</div>
											<div class="row justify-content-end pt-1">
												<div class="col-lg-auto text-end text-dark">
													<strong>Customer Order #:</strong>
												</div>
												<div class="col-lg-4">
													<input type="text" class="form-control"
														name="cust_order_no" value="${ivvo.cust_order_no }">
												</div>
											</div>
											<div class="row justify-content-end pt-1">
												<div class="col-lg-auto text-end text-dark">
													<strong>Customer Invoice #:</strong>
												</div>
												<div class="col-lg-4">
													<input type="text" class="form-control"
														name="cust_invoice_no" value="${ivvo.cust_invoice_no }">
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="col-lg-12">
									<div class="row justify-content-end">
										<div class="col-lg-6">
											<div class="row">
												<h4 class="col-lg-2 text-dark">Bill to:</h4>
												<div class="col-lg-10">
													<section class="form-group-vertical">
														<input type="text" class="form-control font-weight-bold"
															name="bill_title" value="${ivvo.bill_title }"> <input
															type="text" class="form-control" name="bill_addr1"
															value="${ivvo.bill_addr1 }"> <input type="text"
															class="form-control" name="bill_addr2"
															value="${ivvo.bill_addr2 }"> <input type="text"
															class="form-control" name="bill_to_remark"
															value="${ivvo.bill_to_remark }">
													</section>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="row">
												<h4 class="col-lg-2 text-dark">Ship to:</h4>
												<div class="col-lg-10">
													<section class="form-group-vertical">
														<input type="text" class="form-control font-weight-bold"
															name="ship_title" value="${ivvo.ship_title }"> <input
															type="text" class="form-control" name="ship_addr1"
															value="${ivvo.ship_addr1 }"> <input type="text"
															class="form-control" name="ship_addr2"
															value="${ivvo.ship_addr2 }"> <input type="text"
															class="form-control" name="ship_to_remark"
															value="${ivvo.ship_to_remark }">
													</section>
												</div>
											</div>
										</div>
									</div>
								</div>

								<table
									class="table table-responsive table-bordered invoice-items mt-3">
									<thead>
										<tr class="text-dark">
											<th class="text-center" id="cell-method">SHIPPING METHOD</th>
											<th class="text-center" id="cell-tracking">TRACKING #</th>
											<th class="text-center" id="cell-payment">PAYMENT</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" class="form-control"
												name="ship_method" value="${ivvo.ship_method }"></td>
											<td><input type="text" class="form-control"
												name="tracking_no" value="${ivvo.tracking_no }"></td>
											<td><input type="text" class="form-control"
												name="payment" value="${ivvo.payment }"></td>
										</tr>
									</tbody>
								</table>

								<table class="table table-responsive invoice-items">


									<thead>
										<tr class="text-dark">
											<th class="text-center" id="cell-item">ITEM</th>
											<th class="text-center" id="cell-qty">QTY</th>
											<th class="text-center" id="cell-price">PRICE($)</th>
											<th class="text-center" id="cell-amount">AMOUNT</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="tot_qty" value="0" />

										<c:forEach items="${spList}" var="spList" varStatus="status">
											<tr>
												<td class="border-1">${spList.prd_nm}</td>
												<td class="border-1" align="right">${spList.sale_qty}</td>
												<td class="border-1" align="right"><fmt:formatNumber value="${spList.sale_price}" pattern="#,##0.00"/> </td>
												<td class="border-1" align="right"><fmt:formatNumber value="${spList.tot_sale_price}" pattern="#,##0.00"/></td>
											</tr>

											<c:set var="tot_qty" value="${tot_qty+spList.sale_qty}" />
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td align="right" class="border-0 total">Total Quantity</td>
											<td align="right" class="totalprice">${tot_qty}</td>
											<td align="right" class="border-0 total">Subtotal</td>
											<td align="right" class="totalprice"><fmt:formatNumber value="${svo.tot_sale_amt}" pattern="#,##0.00"/></td>
										</tr>
										<tr>
											<td colspan="3" align="right" class="border-0">Sales Tax</td>
											<td align="right" class="totalprice"><fmt:formatNumber value="${svo.tot_tax_amt}" pattern="#,##0.00"/></td>
										</tr>
										<tr>
											<td colspan="3" align="right" class="border-0">Shipping
												Cost</td>
											<td align="right" class="shippingcost"><fmt:formatNumber value="${svo.shopping_cost}" pattern="#,##0.00"/></td>
										</tr>
										<tr>
											<td colspan="3" align="right" class="border-0 total">Total</td>
											<td align="right" class="totalprice"><fmt:formatNumber value="${svo.tot_ord_amt}" pattern="#,##0.00"/></td>
										</tr>
									</tfoot>
								</table>

								<div class="col-lg-12">
									<!-- div class="row">
										<div class="col-4 mx-2">
											<div class="mb-2">
												<strong>Payment Term :<br> Wire transfer
													instruction:
												</strong>
											</div>
											<div>
												<strong>SHINHAN BANK <br> Acct: 700000643601<br>
													W/T Routing #: 111 026 038
												</strong>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="mb-4">
												<strong>TX EAGLE SUPPLY</strong>
											</div>
											<div>
												<strong>2051 W Walnut Hill Ln <br> Irving, TX
													75038<br> 972 ) 600-8443
												</strong>
											</div>
										</div>
									</div-->
								</div>
								<div class="row justify-content-center mt-3">
									<button onclick="invSave();return false;"
										class="mt-2 m-lg-2 mt-sm-2 mt-xl-2 col-lg-3 btn btn-dark btn-px-4 py-3 font-weight-semibold line-height-1">
										<i class="bx bx-printer text-4 me-2"></i> Print Invoice
									</button>
								</div>
							</div>

						</div>
					</div>

				</div>


				<div class="row action-buttons">
					<div class="col-12 col-md-auto">
						<button type="submit"
							class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1"
							data-loading-text="Loading...">
							<i class="bx bx-save text-4 me-2"></i> Save Invoice
						</button>
					</div>
					<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
						<a href="order-list.html"
							class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Cancel</a>
					</div>
					<div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
						<a href="#"
							class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1">
							<i class="bx bx-trash text-4 me-2"></i> Delete Invoice
						</a>
					</div>
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
<!-- 폼 전송 print 하기전-->
	<script>
		function invSave() {
	
			var fdata = $('form[name="saveInv"]').serialize();
			
			$.ajax({
				type : "POST",				
				url : "/invoice-setting2",
				data : fdata,				
				success : function(data) {
					//alert(data);
					window.open('/print-invoice?sale_num='+data,'_blank');
					//location.href="print-packing-list?sale_num=data";
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
	</script>
</body>
</html>