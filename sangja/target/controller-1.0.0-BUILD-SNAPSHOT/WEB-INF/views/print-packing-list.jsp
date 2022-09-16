<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>SangJa - packing List Print</title>
<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="../resources/vendor/bootstrap/css/bootstrap.css" />

<!-- Invoice Print Style -->
<link rel="stylesheet" href="../resources/css/packing-list-print.css" />
</head>
<body>
	<div class="invoice">
		<header class="clearfix">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="mt-0 mb-0 text-dark">Packing List</h1>
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
						<div class="row justify-content-end pt-2">
							<div class="col-auto text-end text-dark">
								<strong>Date:</strong>
							</div>
							<div class="col-4 value">${pkvo.pack_date }</div>
						</div>
						<div class="row justify-content-end pt-2">
							<div class="col-auto text-end text-dark">
								<strong>Invoice #:</strong>
							</div>
							<div class="col-4 value">${pkvo.invoice_no }</div>
						</div>
						<div class="row justify-content-end pt-2">
							<div class="col-auto text-end text-dark">
								<strong>Customer P.O #:</strong>
							</div>
							<div class="col-4 value">${pkvo.cust_po_num }</div>
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
						<h6 class="text-dark">BILL TO:</h6>
						<div class="address">
							<strong>SAS WHOLE SALE</strong> <br /> ${pkvo.bill_addr1 } <br />
							${pkvo.bill_addr2 } <br /> ${pkvo.bill_to_remark }
						</div>
					</div>
				</div>
				<div class="col-5">
					<div class="ship-info">
						<h6 class="text-dark">SHIP TO:</h6>
						<div class="address">
							<strong>SAS WHOLE SALE</strong> <br /> ${pkvo.ship_addr1 } <br />
							${pkvo.ship_addr2 } <br /> ${pkvo.ship_to_remark }
						</div>
					</div>
				</div>
			</div>
		</div>

		<table
			class="table table-responsive-md table-bordered invoice-items mt-3">
			<thead>
				<tr class="text-dark">
					<th class="text-center" id="cell-ponumber">P.O NUMBER</th>
					<th class="text-center" id="cell-terms">TERMS</th>
					<th class="text-center" id="cell-shipdate">SHIP DATE</th>
					<th class="text-center" id="cell-shipmethod">SHIP METHOD</th>
					<th class="text-center" id="cell-payment">PAYMENT</th>
					<th class="text-center" id="cell-remark">REMARK</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${pkvo.po_number }</td>
					<td>${pkvo.terms }</td>
					<td>${pkvo.ship_date }</td>
					<td>${pkvo.ship_method }</td>
					<td>${pkvo.payment }</td>
					<td>${pkvo.remark }</td>
				</tr>
			</tbody>
		</table>

		<table class="table invoice-items">


			<thead>
				<tr class="text-dark">
					<th class="text-center" id="cell-item">ITEM</th>
					<th class="text-center" id="cell-qty">QTY/BOX</th>
					<th class="text-center" id="cell-price">BOX</th>
					<th class="text-center" id="cell-amount">QTY</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pkpvoList}" var="pkpvoList">
					<tr>
						<td class="border-1">${pkpvoList.prd_nm }</td>
						<td class="border-1" align="right">${pkpvoList.qty_per_box }</td>
						<td class="border-1" align="right">${pkpvoList.box_qty }</td>
						<td class="border-1" align="right">${pkpvoList.sale_qty }</td>						
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<td align="right" class="border-0 total">Total</td>
					<td align="right" class="border-0 total"></td>
					<td align="right" class="totalprice">${pkvo.tot_box_qty }</td>
					<td align="right" class="totalprice">${pkvo.tot_sale_qty }</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<script>
		window.print();
	</script>
</body>
</html>