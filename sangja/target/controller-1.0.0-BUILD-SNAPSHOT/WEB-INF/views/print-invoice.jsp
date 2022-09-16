<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>SangJa - Invoice Print</title>
<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="../resources/vendor/bootstrap/css/bootstrap.css" />

<!-- Invoice Print Style -->
<link rel="stylesheet" href="../resources/css/invoice-print.css" />
</head>
<body>
	<div class="invoice">
		<header class="clearfix">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="mt-0 mb-0 text-dark">Invoice</h1>
				</div>
			</div>
			<div class="row mx-1">
				<div class="col-6">
					<h6>
						<strong>TX EAGLE SUPPLY</strong>
					</h6>
					<div class="address">
						2051 W Walnut Hill Ln <br /> Irving, TX 75038 <br /> 972 )
						600-8443
					</div>
				</div>
				<div class="col-6">
					<div class="row">
						<div class="row justify-content-end pt-1">
							<div class="col-auto text-end text-dark">
								<strong>Date:</strong>
							</div>
							<div class="col-4 value"><fmt:parseDate var="inv_date" value="${ivvo.inv_date }" pattern="yyyy-MM-dd" /><fmt:formatDate value="${inv_date }" pattern="MM/dd/yyyy" /></div>
						</div>
						<div class="row justify-content-end pt-1">
							<div class="col-auto text-end text-dark">
								<strong>Invoice #:</strong>
							</div>
							<div class="col-4 value">${ivvo.invoice_no }</div>
						</div>
						<div class="row justify-content-end pt-1">
							<div class="col-auto text-end text-dark">
								<strong>Customer Order #:</strong>
							</div>
							<div class="col-4 value">${ivvo.cust_order_no }</div>
						</div>
						<div class="row justify-content-end pt-1">
							<div class="col-auto text-end text-dark">
								<strong>Customer Invoice #:</strong>
							</div>
							<div class="col-4 value">${ivvo.cust_invoice_no }</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<hr>
		<div class="col-12">
			<div class="row justify-content-end">
				<div class="col-5">
					<div class="bill-info">
						<h6 class="text-dark">Bill to:</h6>
						<div class="address">
							<strong>${ivvo.bill_title }</strong> <br /> ${ivvo.bill_addr1 } <br />
							${ivvo.bill_addr2 } <br /> ${ivvo.bill_to_remark }
						</div>
					</div>
				</div>
				<div class="col-5">
					<div class="ship-info">
						<h6 class="text-dark">Ship to:</h6>
						<div class="address">
							<strong>${ivvo.ship_title }</strong> <br /> ${ivvo.ship_addr1 } <br />
							${ivvo.ship_addr2 } <br /> ${ivvo.ship_to_remark }
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
					<td>${ivvo.ship_method }</td>
					<td>${ivvo.tracking_no }</td>
					<td>${ivvo.payment }</td>
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
						<td class="border-1" align="right"><fmt:formatNumber value="${spList.sale_price}" pattern="#,##0.00"/></td>
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
					<td colspan="3" align="right" class="border-0">Shipping Cost</td>
					<td align="right" class="shippingcost"><fmt:formatNumber value="${svo.tot_tax_amt}" pattern="#,##0.00"/></td>
				</tr>
				<tr>
					<td colspan="3" align="right" class="border-0 total">Total</td>
					<td align="right" class="totalprice"><fmt:formatNumber value="${svo.tot_ord_amt}" pattern="#,##0.00"/></td>
				</tr>
			</tfoot>
		</table>

		<div class="col-12">
			<div class="row">
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
				<div class="col-4">
					<div class="mb-4">
						<strong>TX EAGLE SUPPLY</strong>
					</div>
					<div>
						<strong>2051 W Walnut Hill Ln <br> Irving, TX 75038<br>
							972 ) 600-8443
						</strong>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		window.print();
	</script>
</body>
</html>