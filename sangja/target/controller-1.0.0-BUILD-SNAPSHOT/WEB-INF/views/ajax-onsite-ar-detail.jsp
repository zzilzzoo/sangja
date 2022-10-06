<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form class="order-details action-buttons-fixed" method="post">
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
							<input type="hidden" name="sale_num" id="sale_num" value="${salevo.sale_num}"/>
							
								<li><label>Order #</label> <span class="px-2">${salevo.sale_num}</span>
								</li>
								<li><label>Sales Type</label> <span class="px-2">${salevo.sale_type}</span>
								</li>
								<li><label>Sales Date</label> <span class="px-2">${salevo.sale_ymd}
										${salevo.sale_time}</span></li>
								<li><label>Sales Person</label> <span class="px-2">${user_nm}</span>
								</li>
								<li><label>Sales Status</label> <span class="px-2">pending
										payment</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 mb-4 mb-lg-0">
			<div class="card card-modern">
				<div class="card-header">
					<h2 class="card-title">Customer's info</h2>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-12">
							<ul class="c-info list list-unstyled list-item-bottom-space-0">
								<li><label>Name</label> <span>${salevo.cust_nm}</span></li>
								<li><label>Address</label> <span>${salevo.addr}</span></li>
								<li><label>City</label> <span>${salevo.city}</span></li>
								<li><label>State</label> <span>${salevo.state}</span></li>
								<li><label>Zip Code</label> <span>${salevo.zip_code}</span>
								</li>
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
								<table class="table table-responsive-md mb-0"
									style="min-width: 500px;">
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
										<c:forEach items="${spvoList}" var="spvoList"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${spvoList.prd_nm}</td>
												<td>${spvoList.sale_opt}</td>
												<td><fmt:formatNumber value="${spvoList.unit_price}" pattern="#,##0.00"/></td>
												<td><fmt:formatNumber value="${spvoList.sale_price}" pattern="#,##0.00"/></td>
												<td>${spvoList.sale_qty}</td>
												<td><fmt:formatNumber value="${spvoList.tot_sale_price}" pattern="#,##0.00"/></td>
											</tr>
											<c:set var="tot_qty" value="${tot_qty+spvoList.sale_qty}" />
											<c:set var="tot_amt"
												value="${tot_amt+spvoList.tot_sale_price}" />
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="4" class="border-0">Order Total</td>
											<td class="font-weight-bold" align="right">Order Total</td>
											<td class="font-weight-bold">${tot_qty}</td>
											<td class="font-weight-bold"><fmt:formatNumber value="${tot_amt}" pattern="#,##0.00"/></td>
										</tr>
									</tfoot>
								</table>
							</div>
							<div class="row justify-content-end">
								<div class="table-responsive col-auto">
									<table class="table table-responsive mb-0"
										style="min-width: 350px;">
										<thead>
											<tr>
												<th>Date</th>
												<th>Payment</th>
												<th>PayBy</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="tot_pay_amt" value="0" />
											<c:forEach items="${payList}" var="payList">
												<tr>
													<td>${fn:substring(payList.pay_ymdt,0,10) }</td>
													<td>$ <fmt:formatNumber value="${payList.pay_amt}" pattern="#,##0.00"/></td>
													<td>${payList.pay_type}</td>
												</tr>
												<c:set
													var="tot_pay_amt" value="${tot_pay_amt+payList.pay_amt }" />
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
							<div class="row justify-content-end">
								<div class="col-auto">
									<h3 class="font-weight-bold text-color-dark text-5 mb-3">Account
										Receivable</h3>
									<span class="d-flex align-items-center"> Total <i
										class="fas fa-chevron-right text-color-primary px-3"></i> <span
										class="d-flex align-items-center justify-content-lg-end">
											<strong class="text-color-danger text-6">$ <fmt:formatNumber value="${tot_amt - tot_pay_amt}" pattern="#,##0.00"/></strong>
									</span>
									</span>
								</div>
							</div>
							<div class="row justify-content-end mt-3">
								<a
									class="image-popup-vertical-fit mt-2 m-lg-2 mt-sm-2 mt-xl-2 col-lg-5 btn btn-dark btn-px-4 py-3 font-weight-semibold line-height-1"
									href="../resources/img/${sfvo.save_file_nm}"
									title="사진찍은 인보이스 이미지"> <i
									class="bx bx-photo-album text-4 me-2"></i> View the saved invoice
								</a> <a href="invoice-mobile-print.html" target="_blank"
									class="mt-2 m-lg-2 mt-sm-2 mt-xl-2 col-lg-5 btn btn-dark btn-px-4 py-3 font-weight-semibold line-height-1">
									<i class="bx bx-printer text-4 me-2"></i> Reprint invoice
								</a>
							</div>
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
					<h2 class="card-title">Pay By</h2>
				</div>
				<div class="card-body">
					<div class="row justify-content-center mb-4">
						<div class="col-lg-3">
							<div class="radio-custom radio-primary">
								<input name="pay_type" type="radio" id="arcash" checked="checked"
									value="arcash" onchange="arsetDisplay()"> <label
									for="arcash" class="text-4">Cash</label>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="radio-custom radio-primary">
								<input id="armoneyorder" name="pay_type" type="radio"
									value="armoneyorder" onchange="arsetDisplay()"> <label
									for="armoneyorder" class="text-4">Money Order</label>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="radio-custom radio-primary form-check-inline">
								<input id="archeck" name="pay_type" type="radio" value="archeck"
									onchange="arsetDisplay()"> <label for="archeck"
									class="text-4">Check</label>
							</div>
						</div>
					</div>

					<!-- cash Money Order -->
					<div id="arpayment" class="row justify-content-center">
						<div class="col-lg-12 alert alert-default">
							<h4 class="font-weight-bold text-dark">Payment Amount</h4>
							<div class="row">
								<div class="col-lg-3">
									<div class="input-group my-2">
										<span class="input-group-text">$</span> <input type="text"
											class="form-control" name="pay_amt1" id="pay_amt1" value="<fmt:formatNumber value="${tot_amt-tot_pay_amt}" pattern="#,##0.00"/>">
									</div>
								</div>
								<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
							</div>
						</div>
					</div>

					<!-- check -->
					<div id="archeckpayment" class="row justify-content-center"
						style="display: none">
						<div class="col-lg-12 alert alert-default">
							<h4 class="font-weight-bold text-dark">Payment Amount</h4>
							<div class="row">
								<div class="col-lg-auto">
									<div class="input-group my-2">
										<span class="input-group-text text-2">Check #</span> <input
											type="text" name="check_no" id="check_no" class="form-control" maxlength="4"
											style="width: 80px">
									</div>
								</div>
								<div class="col-lg-3">
									<div class="input-group my-2">
										<span class="input-group-text">$</span> <input type="text"
											class="form-control" name="pay_amt2" id="pay_amt2" value="<fmt:formatNumber value="${tot_amt-tot_pay_amt}" pattern="#,##0.00"/>">
									</div>
								</div>
								<button class="col-lg-3 btn btn-success my-2" onclick="payPost();return false;">Pay</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</form>
<script src="../resources/js/examples/examples.lightbox.js"></script>
<script>
	function arsetDisplay() {
		if ($('input:radio[id=arcash]').is(':checked')) {
			$('#arpayment').show();
			$('#archeckpayment').hide();
		} else if ($('input:radio[id=armoneyorder]').is(':checked')) {
			$('#arpayment').show();
			$('#archeckpayment').hide();
		} else if ($('input:radio[id=archeck]').is(':checked')) {
			$('#arpayment').hide();
			$('#archeckpayment').show();
		}
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
			sale_num = document.getElementById("sale_num").value;
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
			hiddenField1.setAttribute("value", "on-site-sales");
			form.appendChild(hiddenField1);

			document.body.appendChild(form);

			form.submit();

		}
	</script>