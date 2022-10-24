<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<%@ include file="sideba-fixed.jsp"%>
<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=on-site-sales-detail?sale_num=${salevo.sale_num}"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>On-Site Sales Detail | SangJa Admin</title>
<meta name="keywords" content="SangJa Admin" />
<meta name="description" content="SangJa Admin">
<meta name="author" content="Sangja">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
/>

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light"
	rel="stylesheet" type="text/css"
>

<!-- Vendor CSS -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,300,400,600,700,800,900"
	rel="stylesheet" type="text/css"
>

<!-- Vendor CSS -->
<link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.css" />

<link rel="stylesheet" href="../resources/vendor/animate/animate.compat.css">
<link rel="stylesheet" href="../resources/vendor/font-awesome/css/all.min.css" />
<link rel="stylesheet" href="../resources/vendor/boxicons/css/boxicons.min.css" />
<link rel="stylesheet" href="../resources/vendor/magnific-popup/magnific-popup.css" />
<link rel="stylesheet" href="../resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../resources/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="../resources/vendor/datatables/media/css/dataTables.bootstrap5.css" />
<link rel="stylesheet" href="../resources/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />


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
		<c:set var="third_code" value='4' />

		<%@ include file="header.jsp"%>
		<!-- end: header -->

		<div class="inner-wrapper">
			<!-- start: sidebar -->
			<%@ include file="sidebar-left.jsp"%>
			<!-- end: sidebar -->

			<section role="main" class="content-body content-body-modern mt-0">
				<header class="page-header page-header-left-inline-breadcrumb">
					<h2 class="font-weight-bold text-6">On-Site</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Sales</span></li>

							<li><span>Sales Management </span></li>

							<li><span>On-Site Sales</span></li>

						</ol>

					</div>
				</header>

				<!-- start: page -->

				<div class="row">
					<div class="col-lg-6 mb-4 mb-lg-0">

						<div class="card card-modern">
							<div class="card-header">
								<h2 class="card-title">General Info</h2>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<ul class="g-info list list-unstyled list-item-bottom-space-0">
											<li><label>Order #</label> <span>${salevo.sale_num}</span></li>
											<li><label>Sales Type</label> <span>${salevo.sale_type}</span></li>
											<fmt:parseDate var="dateString" value="${salevo.sale_ymd}" pattern="yyyy-MM-dd" />
											<c:set var="sale_ymd">
												<fmt:formatDate value="${dateString}" pattern="MM/dd/yyyy" />
											</c:set>
											<li><label>Sales Date</label> <span>${sale_ymd}
													${fn:substring(salevo.sale_time,0,5) }</span></li>
											<li><label>Sales Person</label> <span>${user_nm}</span></li>
											<li><label>Sales Status</label> <c:if
													test="${salevo.tot_ord_amt <= salevo.tot_pay_amt }"
												>
													<span>Completed</span>
												</c:if> <c:if test="${salevo.tot_ord_amt > salevo.tot_pay_amt }">
													<span>Pending payment</span>
												</c:if></li>
										</ul>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-lg-6 mb-4 mb-lg-0">
						<div class="card card-modern">
							<div class="card-header">
								<h2 class="card-title">Customer Info</h2>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<ul class="c-info list list-unstyled list-item-bottom-space-0">
											<li><label>Name</label> <span>${salevo.cust_nm}</span></li>
											<li><label>Address</label> <span>${salevo.addr}</span></li>
											<li><label>City</label> <span>${salevo.city}</span></li>
											<li><label>State</label> <span>${salevo.state}</span></li>
											<li><label>Zip Code</label> <span>${salevo.zip_code}</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col">

						<div class="card card-modern">
							<div class="card-header">
								<h2 class="card-title">Products</h2>
							</div>
							<div class="card-body">
								<div class="row justify-content-center">
									<div class="col-lg-12">
										<div class="table-responsive pb-4">
											<table class="table table-responsive-md mb-0" style="min-width: 750px;">
												<thead>
													<tr>
														<th>#</th>
														<th>Item</th>
														<th>Option</th>
														<th>Unit Price($)</th>
														<th>Sales Price($)</th>
														<th>Qty</th>
														<th>Amount($)</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="tot_qty" value="0" />
													<c:set var="tot_amt" value="0" />
													<c:forEach items="${spvoList}" var="spvoList" varStatus="status">
														<tr>
															<td>${status.count}</td>
															<td>${spvoList.prd_nm}</td>
															<td>${spvoList.sale_opt}</td>
															<td><fmt:formatNumber value="${spvoList.unit_price}" pattern="#,##0.00" /></td>
															<td><fmt:formatNumber value="${spvoList.sale_price}" pattern="#,##0.00" /></td>
															<td>${spvoList.sale_qty}</td>
															<td><fmt:formatNumber value="${spvoList.tot_sale_price}" pattern="#,##0.00" /></td>
														</tr>
														<c:set var="tot_qty" value="${tot_qty+spvoList.sale_qty}" />
														<c:set var="tot_amt" value="${tot_amt+spvoList.tot_sale_price}" />
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="4" class="border-0"></td>
														<td align="center">Discount</td>
														<td class="font-weight-bold"></td>
														<td class="font-weight-bold"><fmt:formatNumber value="${salevo.discount_amt}"
																pattern="#,##0.00"
															/></td>
													</tr>
													<tr>
														<td colspan="4" class="border-0"></td>
														<td class="font-weight-bold" align="center">Order Total</td>
														<td class="font-weight-bold">${tot_qty}</td>
														<td class="font-weight-bold"><fmt:formatNumber value="${tot_amt }"
																pattern="#,##0.00"
															/></td>
													</tr>
												</tfoot>
											</table>
										</div>

										<div class="row justify-content-end">
											<div class="table-responsive col-auto">
												<table class="table table-responsive mb-0" style="min-width: 450px;">
													<thead>
														<tr>
															<th>Date</th>
															<th>Payment($)</th>
															<th>PayBy</th>
															<th>Delete</th>
														</tr>
													</thead>
													<tbody>
														<c:set var="tot_pay_amt" value="0" />
														<c:forEach items="${payList}" var="payList">
															<tr>
																<fmt:parseDate var="dateString" value="${payList.pay_ymdt}"
																	pattern="yyyy-MM-dd HH:mm:ss"
																/>
																<c:set var="pay_ymd">
																	<fmt:formatDate value="${dateString}" pattern="MM/dd/yyyy" />
																</c:set>

																<td>${pay_ymd}</td>
																<td>$ <fmt:formatNumber value=" ${payList.pay_amt}" pattern="#,##0.00" /></td>
																<td>${payList.pay_type}</td>
																<td><a href="#" onclick="del_pay('${payList.pay_num}')"
																	class="delete-button btn btn-danger btn-px-1 py-1 line-height-1"
																><i class="bx bx-trash text-2 me-1"></i></a></td>
															</tr>
															<c:set var="tot_pay_amt" value="${tot_pay_amt+payList.pay_amt }" />
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

										<div class="row justify-content-end">
											<div class="col-auto">
												<h3 class="font-weight-bold text-color-dark text-5 mb-3">Account Receivable</h3>
												<span class="d-flex align-items-center">
													Total <i class="fas fa-chevron-right text-color-primary px-3"></i>
													<span class="d-flex align-items-center justify-content-lg-end">
														<strong class="text-color-danger text-6">$ <fmt:formatNumber
																value="${salevo.tot_ord_amt - tot_pay_amt }" pattern="#,##0.00"
															/></strong>
													</span>
												</span>
											</div>
										</div>

										<div class="row justify-content-end mt-3">
											<a
												class="image-popup-vertical-fit mt-2 m-lg-2 mt-sm-2 mt-xl-2 col-lg-3 btn btn-dark btn-px-4 py-3 font-weight-semibold line-height-1"
												href="../resources/upimg/${sfvo.save_file_nm}" title="사진찍은 인보이스 이미지"
											> <i class="bx bx-photo-album text-4 me-2"></i> View Saved Invoice
											</a>
											<!--  href="invoice-mobile-print-write?sale_num=${salevo.sale_num}"-->
											<button type="button"
												class="mt-2 m-lg-2 mt-sm-2 mt-xl-2 col-lg-3 btn btn-dark btn-px-4 py-3 font-weight-semibold line-height-1"
												onclick="mkPrnFile('${salevo.sale_num}');return false"
											>
												<i class="bx bx-printer text-4 me-2"></i> Reprint Invoice
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="row action-buttons">
					<div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
						<a href="order-list.html"
							class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3"
						>Cancel</a>
					</div>
				</div>


				<!-- end: page -->
			</section>
		</div>

	</section>

	<!-- Vendor -->
	<script src="../resources/vendor/jquery/jquery.js"></script>
	<script src="../resources/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
	<script src="../resources/vendor/popper/umd/popper.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="../resources/vendor/common/common.js"></script>
	<script src="../resources/vendor/nanoscroller/nanoscroller.js"></script>
	<script src="../resources/vendor/magnific-popup/jquery.magnific-popup.js"></script>
	<script src="../resources/vendor/jquery-placeholder/jquery.placeholder.js"></script>

	<!-- Specific Page Vendor -->
	<script src="../resources/vendor/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="../resources/vendor/datatables/media/js/dataTables.bootstrap5.min.js"></script>
	<script src="../resources/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="../resources/vendor/fuelux/js/spinner.js"></script>
	<script src="../resources/vendor/autosize/autosize.js"></script>
	<script src="../resources/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<!-- Examples -->
	<script src="../resources/js/examples/onsite.datatables.default.js"></script>
	<script src="../resources/js/examples/examples.lightbox.js"></script>

	<script>
		function mkPrnFile(sale_num) {

			var file_name = "0";
			var formData = new FormData();
			formData.append('sale_num', sale_num);
			$.ajax({
				type : "POST",
				url : "invoice-mobile-print-write",
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				cache : false,
				async : false,
				success : function(data) {
					//alert(data);
					location.href = "/invoice-download?fname=" + data;
					//file_name = data;
				},
				error : function(request, status, error) {
					//alert("code:" + request.status + "\n" + "message:"
					//		+ request.responseText + "\n" + "error:" + error);
					file_name = "";
				}
			});

		}
	</script>

	<script>
		function del_pay(payNum) {
			var pay_num=payNum;
			//alert(pay_num);
			if (pay_num = "") {
				alert("There is no information to delete.");
				return;
			}
			if (!confirm("You sure you want to delete it?")) {
				return;
			} else {

				//alert(payNum);
				//var formData = new FormData();
				//formData.append('pay_num', pay_num);
				$.ajax({					
					url : "sale-pay-del",					
					type : "POST",
					data : {
						"pay_num" : payNum
					},
					dataType : "text",
					success : function(data) {
						//alert(data);
						location.reload();
						//file_name = data;
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
						//file_name = "";
					}
				});
			}

		}
	</script>
</body>
</html>