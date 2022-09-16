<html>
	<head>
		<title>SangJa Admin - Invoice Mobile Print</title>
		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,300,400,600,700,800,900" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.css" />

		<!-- Invoice Print Style -->
	  	<link rel="stylesheet" href="../resources/css/barcode_gen_upc_a.css">
  		<link rel="stylesheet" href="../resources/css/mobile-bacode.css">
  		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
  		<script type="text/javascript" src="../resources/js/barcode_gen_upc_a.js"></script>
		

	</head>
	<body>
										
		<div class="invoice">
			<header class="clearfix">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2 class="mt-0 mb-1 text-dark"><strong>INVOICE</strong></h2>
					</div>
					<div class="col-sm-12 text-end">
						<h6 class="m-0 text-dark"><strong>DATE 11-05-21</strong></h6>
					</div>
					<div class="col-sm-12 text-end">
						<h6 class="m-0 text-dark"><strong>INVOICE #100001</strong></h6>
					</div>
					<div class="col-sm-12 text-center mt-3 mb-3">
						<address class="ib me-5">
							TX EAGLE SUPPLY
							<br/>
							2051 W WALNUT HILL LN
							<br/>
							IRVING, TX 75038
							<br/>
							972-600-8443
						</address>
					</div>
				</div>
			</header>

		   <div class="row">
			   <div class="row">
					<div class="col-4">
						CUSTOMER
					</div>
					<div class="col-8">
						SHELL
					</div>
			   </div>						
			   <div class="row">
					<div class="col-4">
						ADDRESS
					</div>
					<div class="col-8">
						<address class="ib">
							8390 N Stemmons Pkwy
							<br/>
							Dallas, TX 75247
						</address>
					</div>
			   </div>						
			</div>

			<table class="table table-responsive-md invoice-items">
				<thead>
					<tr class="text-dark">
						<th id="salesoption"   class="text-center font-weight-semibold">Sales Option</th>
						<th id="item"   class="text-center font-weight-semibold">Item</th>
						<th id="qty"    class="text-center font-weight-semibold">QTY</th>
						<th id="price"  class="text-center font-weight-semibold">PRICE</th>
						<th id="amount"  class="text-center font-weight-semibold">AMOUNT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5"><div id="upc-container1"></div></td>
					</tr>
					<tr>
						<td>DEFECTIVE RETURN</td>
						<td>USB CABLE LIGHTNING 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">15.00</span></td>
						<td><span>$</span><span class="text-end">15.00</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container2"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container3"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
<!--					
					<tr>
						<td colspan="5"><div id="upc-container4"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container5"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container6"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container7"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container8"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container9"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container10"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container11"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container12"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container13"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container14"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container15"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container16"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container17"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container18"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container19"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
					<tr>
						<td colspan="5"><div id="upc-container20"></div></td>
					</tr>
					<tr>
						<td>Sales</td>
						<td>USB CABLE ANDRCID 3Ft</td>
						<td class="text-end">1</td>
						<td><span>$</span><span class="text-end">3.50</span></td>
						<td><span>$</span><span class="text-end">3.50</span></td>
					</tr>
-->
					<tr class="h4">
						<td colspan="4">Total</td>
						<td>$18.50</td>
					</tr>
					
				</tbody>
			</table>
		<div class="border-bottom mt-5 h4"><strong>Signature</strong></div>
		</div>
<!--
		<script>
			window.print();
		</script>
-->
		<script>
			$(document).ready(function() {
				new BarcodeGenUPCA('#upc-container1', '461052217653');
				new BarcodeGenUPCA('#upc-container2', '461052217653');
				new BarcodeGenUPCA('#upc-container3', '461052217653');
				new BarcodeGenUPCA('#upc-container4', '461052217653');
				new BarcodeGenUPCA('#upc-container5', '461052217653');
				new BarcodeGenUPCA('#upc-container6', '461052217653');
				new BarcodeGenUPCA('#upc-container7', '461052217653');
				new BarcodeGenUPCA('#upc-container8', '461052217653');
				new BarcodeGenUPCA('#upc-container9', '461052217653');
				new BarcodeGenUPCA('#upc-container10', '461052217653');
				new BarcodeGenUPCA('#upc-container11', '461052217653');
				new BarcodeGenUPCA('#upc-container12', '461052217653');
				new BarcodeGenUPCA('#upc-container13', '461052217653');
				new BarcodeGenUPCA('#upc-container14', '461052217653');
				new BarcodeGenUPCA('#upc-container15', '461052217653');
				new BarcodeGenUPCA('#upc-container16', '461052217653');
				new BarcodeGenUPCA('#upc-container17', '461052217653');
				new BarcodeGenUPCA('#upc-container18', '461052217653');
				new BarcodeGenUPCA('#upc-container19', '461052217653');
				new BarcodeGenUPCA('#upc-container20', '461052217653');
				  });
		</script>
	</body>
</html>