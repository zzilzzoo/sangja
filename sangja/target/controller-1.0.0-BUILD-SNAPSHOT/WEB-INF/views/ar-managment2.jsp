<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<%@ include file="sideba-fixed.jsp"%>
<head>
<c:if test="${sess_user==null }">
	<jsp:forward page="/signin?return_path=ar-managment2"></jsp:forward>
</c:if>
<!-- Basic -->
<meta charset="UTF-8">

<title>AR Management | SangJa Admin</title>
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
<link rel="stylesheet" href="../resources/vendor/datatables/media/css/dataTables.bootstrap5.css" />
<link rel="stylesheet" href="../resources/vendor/select2/css/select2.css" />
<link rel="stylesheet" href="../resources/vendor/select2-bootstrap-theme/select2-bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/vendor/bootstrap-multiselect/css/bootstrap-multiselect.css"
/>

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
					<h2 class="font-weight-bold text-6">AR</h2>
					<div class="right-wrapper">
						<ol class="breadcrumbs">
							<li><a href="index.html"> <i class="bx bx-home-alt"></i>
							</a></li>

							<li><span>Sales</span></li>

							<li><span>AR Management </span></li>

						</ol>

					</div>
				</header>

				<input type="hidden" id="g_sale_ymd_s" name="g_sale_ymd_s" value="${sale_ymd_s }">
				<input type="hidden" id="g_sale_ymd_e" name="g_sale_ymd_e" value="${sale_ymd_e }">
				<input type="hidden" id="g_search_user" name="g_search_user" value="${search_user }">
				<input type="hidden" id="g_filter_by" name="g_filter_by" value="${filter_by }">
				<input type="hidden" id="g_search_term" name="g_search_term" value="${search_term }">
				<!-- start: page -->
				<div class="row">
					<div class="col">
						<div class="card card-modern">
							<div class="card-body">
								<div class="datatables-header-footer-wrapper">
									<form name="search" action="ar-managment2" method="post">
										<div class="datatable-header">
											<div class="row align-items-end mb-0">
												<div class="col-8 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<a
														href="/excel/ar-managment?sale_ymd_s=${sale_ymd_s}&sale_ymd_e=${sale_ymd_e}&search_user=${search_user}&filter_by=${filter_by}&search_term=${search_term}"
														class="btn btn-success btn-md font-weight-semibold"
													>Excel <i class="far fa-file-excel"></i>
													</a>
												</div>
												<!--
												<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Show:</label> <select
															class="form-control results-per-page" id="p_size" name="p_size" onchange="chg_page_size()"	>
															<option value="10" ${'10' == p_size ? 'selected' : ''}>10</option>
															<option value="25" ${'23' == p_size ? 'selected' : ''}>25</option>
															<option value="50" ${'50' == p_size ? 'selected' : ''}>50</option>
															<option value="100" ${'100' == p_size ? 'selected' : ''}>100</option>
														</select>
													</div>
												</div>
												 -->
												<div class="col-12 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="input-daterange input-group" data-plugin-datepicker>
														<span class="input-group-text"> <i class="fas fa-calendar-alt"></i>
														</span>
														<input name="sale_ymd_s" type="text" class="form-control">
														<span class="input-group-text border-start-0 border-end-0 rounded-0">
															to </span>
														<input type="text" class="form-control" name="sale_ymd_e">
													</div>
												</div>
												<div class="col-6 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Sales Person:</label> <select class="form-control"
															multiple="multiple" data-plugin-multiselect
															data-plugin-options='{ "maxHeight": 200, "includeSelectAllOption": true}'
															id="ms_example5" name="search_user"
														>
															<optgroup label="Employee">
																<c:forEach items="${uListE}" var="uListE">
																	<option value="${uListE.user_num}" selected>${uListE.user_nm_f}
																		${uListE.user_nm_l}</option>
																</c:forEach>
															</optgroup>
															<optgroup label="Commissioner">
																<c:forEach items="${uListC}" var="uListC">
																	<option value="${uListC.user_num}" selected>${uListC.user_nm_f}
																		${uListC.user_nm_f}</option>
																</c:forEach>
															</optgroup>
															<optgroup label="Individual Saller">
																<c:forEach items="${uListS}" var="uListS">
																	<option value="${uListS.user_num}" selected>${uListS.user_nm_f}
																		${uListS.user_nm_f}</option>
																</c:forEach>
															</optgroup>
														</select>
													</div>
												</div>
												<div class="col-6 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="d-flex align-items-lg-center flex-column flex-lg-row">
														<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
															class="form-control filter-by" name="filter_by"
														>
															<option value="all" selected>All</option>
															<option value="cust_nm">Name</option>
															<option value="addr">Address</option>
															<option value="city">City</option>
															<option value="state">State</option>
															<option value="zip_code">Zip Code</option>
															<option value="sale_type">Sale Type</option>

														</select>
													</div>
												</div>
												<div class="col-12 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
													<div class="search search-style-1-lg mx-lg-auto">
														<div class="input-group">
															<input type="text" class="form-control" name="search_term" id="search-term"
																placeholder="Search AR"
															>
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
										id="datatable-ecommerce-list1" style="min-width: 900px;"	>
										<thead>
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>Sales Person</th>
												<th>Name</th>
												<th>Address</th>
												<th>City</th>
												<th>State</th>
												<th>Zip Code</th>
												<th>Total Cost($)</th>
												<th>Payment($)</th>
												<th>Balance($)</th>
												<th>Over Due(Days)</th>
												<th class="text-center" style="min-width: 65px;">View the inv</th>
												<th class="text-center" style="min-width: 80px;">Reprint the Invoice</th>
												<th>Sales Type</th>
												<th class="text-center" style="min-width: 80px;" width="85px">Pay Off</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${salelist}" var="salelist" varStatus="status">
												<tr>
													<fmt:parseDate var="sale_ymd" value="${salelist.sale_ymd}" pattern="yyyy-MM-dd" />
													<td><input type="hidden" id="sale_num" value="${salelist.sale_num}" />${status.count }</td>
													<td><c:if test="${salelist.sale_type eq 'onsite' }">
															<a class="simple-ajax-popup" href="ajax-onsite-detail?sale_num=${salelist.sale_num}"><strong><fmt:formatDate
																		value="${sale_ymd}" pattern="MM/dd/yyyy"
																	/></strong></a>
														</c:if> <c:if test="${salelist.sale_type ne 'onsite' }">
															<a class="simple-ajax-popup" href="ajax-other-detail?sale_num=${salelist.sale_num}"><strong><fmt:formatDate
																		value="${sale_ymd}" pattern="MM/dd/yyyy"
																	/></strong></a>
														</c:if></td>
													<td>${salelist.sale_user_nm}</td>
													<td>${salelist.cust_nm}</td>
													<td>${salelist.addr}</td>
													<td>${salelist.city}</td>
													<td>${salelist.state}</td>
													<td>${salelist.zip_code}</td>
													<td><fmt:formatNumber value="${salelist.tot_ord_amt}" pattern="#,##0.00" /></td>
													<td><c:if test="${salelist.tot_pay_amt > 0 }">
															<a class="simple-ajax-popup" href="ajax-payment?sale_num=${salelist.sale_num}"><strong><fmt:formatNumber
																		value="${salelist.tot_pay_amt}" pattern="#,##0.00"
																	/></strong></a>
														</c:if> <c:if test="${salelist.tot_pay_amt eq 0 }">
															<fmt:formatNumber value="${salelist.tot_pay_amt}" pattern="#,##0.00" />
															</strong>
														</c:if></td>

													<!-- 잔액 계산 -->
													<c:set var="balance" value="${salelist.tot_ord_amt-salelist.tot_pay_amt}" />
													<td><fmt:formatNumber value="${balance}" pattern="#,##0.00" /></td>

													<!-- 연체일자 -->
													<fmt:parseDate value="${fn:substring(salelist.sale_ymd,0,10)}" var="strPlanDate"
														pattern="yyyy-MM-dd"
													/>
													<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true"
														var="strDate"
													></fmt:parseNumber>

													<jsp:useBean id="now" class="java.util.Date" />
													<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
													<c:set var="overdue" value="${endDate-strDate}" />
													<c:if test="${balance eq 0}">
														<c:set var="overdue" value="0" />
													</c:if>
													<td>${overdue}</td>
													<td class="text-center"><a class="image-popup-vertical-fit btn btn-dark "
														href="../resources/upimg/${sfvo.save_file_nm}" title="사진찍은 인보이스 이미지"
													> View </a></td>
													<td class="text-center"><button class="btn btn-dark"
															onclick="mkPrnFile('${salelist.sale_num}');return false"
														>Reprint</button></td>
													<td>On-Site</td>
													<td class="text-center"><a href="#payoffForm" target="_blank"
														class="btn btn-success popup-with-form" onclick="setBalance(this);return false;"
													> PayOff </a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div>
										<br>
									</div>
									<div id="page" class="col-lg-auto text-center order-3 order-lg-2">
										<c:if test="${page.prev}">
											<span> <a href="ar-managment2?c_page=${page.startPageNum - 1}"><</a>

											</span>
										</c:if>

										<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="c_page">
											<span> <c:if test="${select != c_page}">
													<a href="ar-managment2?c_page=${c_page}">${c_page}</a>&nbsp;
												</c:if> <c:if test="${select == c_page}">
													<b>${c_page}</b>&nbsp;
												</c:if>
											</span>
										</c:forEach>

										<c:if test="${page.next}">
											<span> <a href="ar-managment2?c_page=${page.endPageNum + 1}">></a>
											</span>
										</c:if>
									</div>

									<!-- payment lightbox start -->
									<div id="lbpayment" class="modal-block modal-block-md mfp-hide">
										<section class="card">
											<header class="card-header">
												<h2 class="card-title">Payment</h2>
											</header>
											<div class="card-body">
												<div class="row justify-content-center">
													<div class="col-lg-12">
														<table class="table table-responsive mb-0">
															<thead>
																<tr>
																	<th>Date</th>
																	<th>Payment($)</th>
																	<th>PayBy</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>2021-11-17</td>
																	<td>3.00</td>
																	<td>Cash</td>
																</tr>
																<tr>
																	<td>2021-11-19</td>
																	<td>22.00</td>
																	<td>Cash</td>
																</tr>
															</tbody>
															<tfoot>
																<td class="font-weight-bold">Total</td>
																<td class="font-weight-bold">25.00</td>
																<td></td>
															</tfoot>
														</table>
													</div>
												</div>
											</div>
										</section>
									</div>
									<!-- lightbox end -->

									<!-- payoff lightbox start -->
									<div id="payoffForm" class="modal-block modal-block-md mfp-hide">
										<section class="card">
											<header class="card-header">
												<h2 class="card-title">Pay Off</h2>
											</header>
											<div class="card-body">
												<h3 class="text-center font-weight-bold text-dark">
													남은잔액 : <span class="text-color-danger" id="pay_amt"> </span>
												</h3>
												<div class="row justify-content-center my-4">
													<div class="col-lg-3">
														<div class="radio-custom radio-primary">
															<input name="pay_type" type="radio" id="cash" checked="checked" value="cash"
																onchange="setDisplay()"
															>
															<label for="cash" class="text-4">Cash</label>
														</div>
													</div>
													<div class="col-lg-4">
														<div class="radio-custom radio-primary">
															<input id="moneyorder" name="pay_type" type="radio" value="moneyorder"
																onchange="setDisplay()"
															>
															<label for="moneyorder" class="text-4">Money Order</label>
														</div>
													</div>
													<div class="col-lg-3">
														<div class="radio-custom radio-primary form-check-inline">
															<input id="check" name="pay_type" type="radio" value="check" onchange="setDisplay()">
															<label for="check" class="text-4">Check</label>
														</div>
													</div>
												</div>

												<!-- cash Money Order -->
												<div id="payment" class="row justify-content-center">
													<div class="col-lg-10 alert alert-default">
														<h4 class="font-weight-bold text-dark">Payment Amount</h4>
														<div class="row justify-content-center">
															<div class="col-lg-6">
																<div class="input-group my-2">
																	<span class="input-group-text">$</span>
																	<input type="text" name="pay_amt1" id="pay_amt1" class="form-control" value="18.50">
																	<input type="hidden" name="pay_sale_num" id="pay_sale_num">
																</div>
															</div>
															<button class="col-lg-4 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
														</div>
													</div>
												</div>

												<!-- check -->
												<div id="checkpayment" class="row justify-content-center" style="display: none">
													<div class="col-lg-10 alert alert-default">
														<h4 class="font-weight-bold text-dark">Payment Amount</h4>
														<div class="row justify-content-center">
															<div class="col-lg-auto">
																<div class="input-group my-2">
																	<span class="input-group-text text-2">Check #</span>
																	<input type="text" class="form-control" name="check_no" id="check_no" maxlength="4"
																		style="width: 80px"
																	>
																</div>
															</div>
															<div class="col-lg-4">
																<div class="input-group my-2">
																	<span class="input-group-text">$</span>
																	<input type="text" class="form-control" name="pay_amt2" id="pay_amt2" value="18.50">
																</div>
															</div>
															<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
														</div>
													</div>
												</div>

											</div>
										</section>
									</div>
									<!-- lightbox end -->

									<div class="datatable-footer">
										<div class="row align-items-center justify-content-between mt-3">
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
	<script src="../resources/vendor/select2/js/select2.js"></script>
	<script src="../resources/vendor/bootstrapv5-multiselect/js/bootstrap-multiselect.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="../resources/js/theme.js"></script>

	<!-- Theme Custom -->
	<script src="../resources/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../resources/js/theme.init.js"></script>

	<!-- Examples -->
	<script src="../resources/js/examples/sangja.datatables.list.js"></script>
	<script src="../resources/js/examples/examples.advanced.form.js"></script>
	<script src="../resources/js/examples/examples.lightbox.js"></script>
	<script src="../resources/js/examples/examples.modals.js"></script>

	<script>
		function setDisplay() {
			if ($('input:radio[id=cash]').is(':checked')) {
				$('#payment').show();
				$('#checkpayment').hide();
			} else if ($('input:radio[id=moneyorder]').is(':checked')) {
				$('#payment').show();
				$('#checkpayment').hide();
			} else if ($('input:radio[id=check]').is(':checked')) {
				$('#payment').hide();
				$('#checkpayment').show();
			}
		}
	</script>
	<script>
		function setBalance(obj) {

			var tr = $(obj).parent().parent();
			var td = tr.children();
			var sale_num = td.eq(0).children().val();
			var val1 = td.eq(10).text();

			//alert(sale_num);
			document.getElementById("pay_amt").innerHTML = "$ " + val1;
			document.getElementById("pay_sale_num").value = sale_num;
			document.getElementById("pay_amt1").value = val1;
			document.getElementById("pay_amt2").value = val1;

		}
	</script>
	<!-- pay -->
	<script>
		function payPost() {

			var sale_num;
			var pay_type;
			var check_no;
			var pay_amt;
			var obj_length = document.getElementsByName("pay_type").length;

			for (var i = 0; i < obj_length; i++) {
				if (document.getElementsByName("pay_type")[i].checked == true) {
					pay_type = document.getElementsByName("pay_type")[i].value;
				}
			}
			sale_num = document.getElementById("pay_sale_num").value;
			check_no = document.getElementById("check_no").value;
			if (pay_type == "check") {
				pay_amt = document.getElementById("pay_amt2").value;
			} else {
				pay_amt = document.getElementById("pay_amt1").value;
			}
			//alert(sale_num + ":" + pay_type + ":" + check_no + ":" + pay_amt);

			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post"); //Post 방식
			form.setAttribute("action", "sale-pay"); //요청 보낼 주소

			var hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "pay_sale_num");
			hiddenField1.setAttribute("value", sale_num);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "pay_type");
			hiddenField1.setAttribute("value", pay_type);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "check_no");
			hiddenField1.setAttribute("value", check_no);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "pay_amt");
			hiddenField1.setAttribute("value", pay_amt);
			form.appendChild(hiddenField1);

			hiddenField1 = document.createElement("input");
			hiddenField1.setAttribute("type", "hidden");
			hiddenField1.setAttribute("name", "posturl");
			hiddenField1.setAttribute("value", "ar-managment");
			form.appendChild(hiddenField1);

			document.body.appendChild(form);

			form.submit();

		}
	</script>
	<script>
		function chg_page_size() {

			var formData = new FormData();
			
			var selectOption = document.getElementById("p_size");
			//alert(selectOption.selectedIndex);
			selectOption = selectOption.options[selectOption.selectedIndex].value;
		
			
			location.href="ar-managment2?p_size="+selectOption
					+"&c_page=1&sale_ymd_s="+document.getElementById("g_sale_ymd_s").value
					+"&sale_ymd_e="+document.getElementById("g_sale_ymd_e").value	
					+"&search_user="+document.getElementById("g_search_user").value
					+"&filter_by="+document.getElementById("g_filter_by").value
					+"&search_term="+document.getElementById("g_search_term").value
			
		}
	</script>
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
</body>
</html>