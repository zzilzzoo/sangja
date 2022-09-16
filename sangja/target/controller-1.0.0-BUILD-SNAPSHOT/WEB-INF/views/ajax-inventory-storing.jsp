<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form class="order-details action-buttons-fixed" method="post"
	id="storing" action="ajax-inventory-storing">
	<div class="row">
		<section class="card card-modern">
			<header class="card-header">
				<h2 class="card-title">Storing</h2>
			</header>
			<div class="card-body">
				<div class="row">
					<div class="col-6 form-row">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:set var="inout_ymdt">
							<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
						</c:set>

						<label>입고일자</label>
						<div class="input-group">
							<span class="input-group-text"> <i
								class="fas fa-calendar-alt"></i>
							</span> <input type="text" data-plugin-datepicker
								data-plugin-options='{"orientation": "bottom", "format": "yyyy-mm-dd"}'
								class="form-control" name="inout_ymdt" value="${inout_ymdt }"
								required>
						</div>
					</div>
					<div class="col-6 form-row">
						<label>옵션</label> <select class="form-control" id="select"
							name="event_opt" onchange="setDisplay();">
							<option value="제품입고">제품입고</option>
							<!-- 회사재고(+) -->
							<option value="회사입고">회사입고</option>
							<!-- 해당직원재고(-),회사재고(+) -->
							<option value="+ 재고조정">+ 재고조정</option>
							<!-- 회사재고(+) -->
							<option value="Seller반품입고">Seller반품입고</option>
							<!-- 해당직원재고(+) 금액(-) -->
						</select>
					</div>
				</div>
				<div id="data1" class="row mb-3">
					<div class="col-6 form-row">
						<label>User</label> <input type="text" value="회사" name="user_num1"
							id="user_num1" class="form-control" readonly="readonly">
					</div>
					<div class="col-6 form-row">
						<label>메모</label> <input type="text" class="form-control"
							name="event_note1">
					</div>
				</div>

				<div id="data2" class="row mb-3" style="display: none">
					<div class="col-6 form-row">
						<label>User</label> <select class="form-control" name="user_num2"
							id="user_num2">
							<optgroup label="Employee">
								<c:forEach items="${uListE}" var="uListE">
									<option value="${uListE.user_num}" selected>${uListE.user_nm_f}
										${uListE.user_nm_l}</option>
								</c:forEach>
							</optgroup>
							<optgroup label="Commissioner">
								<c:forEach items="${uListC}" var="uListC">
									<option value="${uListC.user_num}" selected>${uListC.user_nm_f}
										${uListC.user_nm_l}</option>
								</c:forEach>
							</optgroup>
						</select>
					</div>
					<div class="col-6 form-row">
						<label>메모</label> <input type="text" class="form-control"
							name="event_note2">
					</div>
				</div>

				<div id="data3" class="row mb-3" style="display: none">
					<div class="col-6 form-row">
						<label>User</label> <input type="text" value="회사" name="user_num3"
							id="user_num3" class="form-control" readonly="readonly">
					</div>
					<div class="col-6 form-row">
						<label>메모</label> <input type="text" class="form-control"
							name="event_note3">
					</div>
				</div>

				<div id="data4" class="row mb-3" style="display: none">
					<div class="col-6 form-row">
						<label>User</label> <select class="form-control" name="user_num4"
							id="user_num4">
							<optgroup label="Individual Saller">
								<c:forEach items="${uListS}" var="uListS">
									<option value="${uListS.user_num}" selected>${uListS.user_nm_f}
										${uListS.user_nm_l}</option>
								</c:forEach>
							</optgroup>
						</select>
					</div>
					<div class="col-6 form-row">
						<label>메모</label> <input type="text" class="form-control"
							name="event_note4">
					</div>
				</div>

				<div class="datatables-header-footer-wrapper">
					<div class="form-group row pb-4">
						<a
							class="col-lg-3 modal-with-form btn btn-primary btn-md btn-py-1 px-6 "
							href="#modalForm">Add Product <i class="fas fa-plus"></i></a>
					</div>

					<div id="data_table1" class="row justify-content-md-center">
						<div class="table-responsive pb-4">
							<table class="table table-responsive-md table-hover mb-0"
								style="min-width: 900px;" id="storprodTbl1">
								<thead>
									<tr>
										<th>#</th>
										<th>Product</th>
										<th>Product#</th>
										<th>회사재고</th>
										<th>Cost Price</th>
										<th>입고단가</th>
										<th>Qty</th>
										<th>Amount</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>

					<div id="data_table2" class="row justify-content-md-center"
						style="display: none">
						<div class="table-responsive pb-4">
							<table class="table table-responsive-md table-hover mb-0"
								style="min-width: 900px;" id="storprodTbl2">
								<thead>
									<tr>
										<th>#</th>
										<th>Product</th>
										<th>Product#</th>
										<th>회사재고</th>
										<th>User 재고</th>
										<th>Qty</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>

					<div id="data_table3" class="row justify-content-md-center"
						style="display: none">
						<div class="table-responsive pb-4">
							<table class="table table-responsive-md table-hover mb-0"
								style="min-width: 900px;" id="storprodTbl3">
								<thead>
									<tr>
										<th>#</th>
										<th>Product</th>
										<th>Product#</th>
										<th>회사재고</th>
										<th>User 재고</th>
										<th>Qty</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>

					<div id="data_table4" class="row justify-content-md-center"
						style="display: none">
						<div class="table-responsive pb-4">
							<table class="table table-responsive-md table-hover mb-0"
								style="min-width: 900px;" id="storprodTbl4">
								<thead>
									<tr>
										<th>#</th>
										<th>Product</th>
										<th>Product#</th>
										<th>회사재고</th>
										<th>Cost Price</th>
										<th>입고단가</th>
										<th>Qty</th>
										<th>Amount</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<footer class="card-footer">
				<div class="row">
					<div class="col-md-12 center">
						<button type="submit" form="storing" class="btn btn-primary">입고</button>
					</div>
				</div>
			</footer>
		</section>
	</div>
</form>
<!-- Product select modelForm start -->
<div id="modalForm" class="modal-block modal-block-md mfp-hide">
	<section class="card">
		<header class="card-header">
			<h2 class="card-title">Product List</h2>
		</header>

		<div class="card-body">
			<div class="datatables-header-footer-wrapper">
				<div class="datatable-header">
					<div class="row align-items-center mb-0">
						<div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-3">
							<div class="d-flex align-items-lg-center flex-column flex-lg-row">
								<label class="ws-nowrap me-3 mb-0">Show:</label> <select
									class="form-control results-per-page" name="results-per-page">
									<option value="10" selected>5</option>
									<option value="25">10</option>
								</select>
							</div>
						</div>
						<div
							class="col-8 col-lg-auto ms-auto ml-auto ps-lg-1 mb-3 mb-lg-3">
							<div class="d-flex align-items-lg-center flex-column flex-lg-row">
								<label class="ws-nowrap me-3 mb-0">Filter By:</label> <select
									class="form-control filter-by" name="filter-by">
									<option value="all" selected>All</option>
									<option value="1">Category</option>
									<option value="2">Product</option>
									<option value="3">Product#</option>
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
					id="addproduct-ecommerce-list">
					<thead>
						<tr>
							<th width="3%"><input type="checkbox" name="select-all"
								class="select-all checkbox-style-1 p-relative top-2" value="" /></th>
							<th width="10%">Category</th>
							<th width="67%">Product</th>
							<th width="10%">Product#</th>
							<th width="5%">Cost Price($)</th>
							<th width="5%">Unit Price($)</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${pdList}" var="pdList" varStatus="status">
							<tr>
								<td><input type="checkbox" name="checkboxRow1"
									class="checkbox-style-1 p-relative top-2"
									value="${pdList.prd_mng_num}" /></td>
								<td>${pdList.ctgry_nm}</td>
								<td>${pdList.prd_nm}</td>
								<td>${pdList.prd_code}</td>
								<td><fmt:formatNumber value="${pdList.cost_price}" pattern="#,##0.00"/></td>
								<td><fmt:formatNumber value="${pdList.unit_price}" pattern="#,##0.00"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<footer class="card-footer">
			<div class="row">
				<div class="col-md-12 center">
					<button class="btn btn-primary modal-confirm" id="addBtn">Add
						Product</button>
					<button class="btn btn-default modal-dismiss">Cancel</button>
				</div>
			</div>
		</footer>
	</section>
</div>

<!-- modelForm end -->

<!-- Theme Base, Components and Settings -->
<script src="../resources/js/theme.js"></script>

<!-- Theme Initialization Files -->
<script src="../resources/js/theme.init.js"></script>
<script
	src="../resources/js/examples/inventory.addproduct.datatables.list.js"></script>
<script src="../resources/js/examples/examples.modals.js"></script>

<script>
	function setDisplay() {
		var property = document.getElementById('select').value;

		if (property == "제품입고") {
			$('#data1').show();
			$('#data2').hide();
			$('#data3').hide();
			$('#data4').hide();

			$('#data_table1').show();
			$('#data_table2').hide();
			$('#data_table3').hide();
			$('#data_table4').hide();

			$('#storprodTbl2 > tbody').empty();
			$('#storprodTbl3 > tbody').empty();
			$('#storprodTbl4 > tbody').empty();

		} else if (property == "회사입고") {
			$('#data1').hide();
			$('#data2').show();
			$('#data3').hide();
			$('#data4').hide();

			$('#data_table1').hide();
			$('#data_table2').show();
			$('#data_table3').hide();
			$('#data_table4').hide();

			$('#storprodTbl1 > tbody').empty();
			$('#storprodTbl3 > tbody').empty();
			$('#storprodTbl4 > tbody').empty();

		} else if (property == "+ 재고조정") {
			$('#data1').hide();
			$('#data2').hide();
			$('#data3').show();
			$('#data4').hide();

			$('#data_table1').hide();
			$('#data_table2').hide();
			$('#data_table3').show();
			$('#data_table4').hide();

			$('#storprodTbl1 > tbody').empty();
			$('#storprodTbl2 > tbody').empty();
			$('#storprodTbl4 > tbody').empty();

		} else if (property == "Seller반품입고") {
			$('#data1').hide();
			$('#data2').hide();
			$('#data3').hide();
			$('#data4').show();

			$('#data_table1').hide();
			$('#data_table2').hide();
			$('#data_table3').hide();
			$('#data_table4').show();

			$('#storprodTbl1 > tbody').empty();
			$('#storprodTbl2 > tbody').empty();
			$('#storprodTbl3 > tbody').empty();
		}

	}
</script>

<script>
	$("#addBtn")
			.click(
					function() {

						var property = document.getElementById('select').value;

						var user_num1 = document.getElementById('user_num1').value;
						var user_num2 = document.getElementById('user_num2').value;
						var user_num3 = document.getElementById('user_num3').value;
						var user_num4 = document.getElementById('user_num4').value;

						var user_num = "0";
						//alert(user_num2);

						if (property == "제품입고") {
							user_num = "0";
						} else if (property == "회사입고") {
							user_num = user_num2;
						} else if (property == "+ 재고조정") {
							user_num = "0";
						} else if (property == "Seller반품입고") {
							user_num = user_num4;
						}
						//alert(user_num);

						var rowData = new Array();
						var tdArr = new Array();
						var checkbox = $("input[name=checkboxRow1]:checked");

						// 체크된 체크박스 값을 가져온다
						checkbox
								.each(function(i) {

									// checkbox.parent() : checkbox의 부모는 <td>이다.
									// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.									
									var tr = checkbox.parent().parent().eq(i);
									var td = tr.children();

									// 체크된 row의 모든 값을 배열에 담는다.
									rowData.push(tr.text());

									// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
									var prd_mng_num = td.eq(0).children().val();

									var ctgry_nm = td.eq(1).text();
									var prd_nm = td.eq(2).text();
									var prd_code = td.eq(3).text();
									var cost_price = td.eq(4).text();
									var unit_price = td.eq(5).text();
									//var comp_qty = td.eq(6).text();
									//var user_qty = td.eq(7).text();
									//회사재고
									var comp_qty = getInvPrd(prd_mng_num, 0);									
									//사용자재고
									var user_qty = getInvPrd(prd_mng_num,user_num);
									//alert(prd_nm);
									// 가져온 값을 배열에 담는다.
									tdArr.push(prd_mng_num);
									tdArr.push(ctgry_nm);
									tdArr.push(prd_nm);
									tdArr.push(cost_price);
									tdArr.push(unit_price);

									var tbl = "#storprodTbl1 > tbody tr";
									var tblb = "#storprodTbl1 > tbody:last";
									//alert(property);
									if (property == "제품입고") {
										tbl = "#storprodTbl1 > tbody tr";
										tblb = "#storprodTbl1 > tbody:last";
									} else if (property == "회사입고") {
										tbl = "#storprodTbl2 > tbody tr";
										tblb = "#storprodTbl2 > tbody:last";
									} else if (property == "+ 재고조정") {
										tbl = "#storprodTbl3 > tbody tr";
										tblb = "#storprodTbl3 > tbody:last";
									} else if (property == "Seller반품입고") {
										tbl = "#storprodTbl4 > tbody tr";
										tblb = "#storprodTbl4 > tbody:last";
									}

									var trLen = $(tbl).length;
									var rownum = trLen + 1;
									var trText = '';
									if (property == "제품입고") {
										trText = '<tr>' + '<td>'
												+ rownum
												+ '</td>'
												//상품묭
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].prd_mng_num" value="'+prd_mng_num+'">'
												+ prd_nm
												+ '</td>'
												//상품코드
												+ '<td>'
												+ prd_code
												+ '</td>'
												//회사제고
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_comp_qty" value="'+comp_qty+'">'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_user_qty" value="'+user_qty+'">'
												+ comp_qty
												+ '</td>'
												//cost price
												+ '<td>'
												+ '<div class="input-group">'
												+ '<span class="input-group-text">$</span> <input type="text" class="form-control" readonly="readonly"  name="InventoryInOutVOList['+trLen+'].cost_price" value="'+cost_price+'">'
												+ '</div>'
												+ '</td>'
												//unit price
												+ '<td>'
												+ '<div class="input-group">'
												+ '<span class="input-group-text">$</span> <input type="text" class="form-control" name="InventoryInOutVOList['
												+ trLen
												+ '].unit_price"  value="'
												+ unit_price
												+ '" onchange="getVal(this);">'
												+ '</div>'
												+ '</td>'
												//qty
												+ '<td>'
												+ '<div data-plugin-spinner data-plugin-options="{ \'value\':1, \'step\': 1, \'min\': 1}">'
												+ '<div class="input-group">'
												+ '<button type="button" class="btn btn-default spinner-up" onclick="qtyupdown(\'plus\',\'s_qty'
												+ trLen
												+ '\'); getVal2(this);"><i class="fas fa-plus"></i></button>'
												+ '<input type="text" id="s_qty'
												+ trLen
												+ '" class="spinner-input form-control" maxlength="3"  name="InventoryInOutVOList['
												+ trLen
												+ '].event_qty" value="1" onchange="getVal2(this);">'
												+ '<button type="button" class="btn btn-default spinner-down" onclick="qtyupdown(\'minus\',\'s_qty'
												+ trLen
												+ '\'); getVal2(this);"><i class="fas fa-minus"></i></button>'
												+ '</div>'
												+ '</div>'
												+ '</td>'
												//총계	
												+ '<td>'
												+ '<div class="input-group">'
												+ '<span class="input-group-text">$</span> <input type="text" class="form-control"  name="InventoryInOutVOList['+trLen+'].event_amt" value="'+unit_price+'">'
												+ '</div>'
												+ '</td>'
												+ '<td>'
												+ '<button class="btn btn-danger btn-px-2 py-2" onclick="deleterow(this); return false;"><i class="fas fa-times"></i></button>'
												+ '</td>' + '</tr>';

									} else if (property == "회사입고") {
										trText = '<tr>' + '<td>'
												+ rownum
												+ '</td>'
												//상품묭
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].prd_mng_num" value="'+prd_mng_num+'">'
												+ prd_nm
												+ '</td>'
												//상품코드
												+ '<td>'
												+ prd_code
												+ '</td>'
												//회사제고
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_comp_qty" value="'+comp_qty+'">'
												+ comp_qty
												+ '</td>'
												//사용자재고
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_user_qty" value="'+user_qty+'">'
												+ user_qty
												+ '</td>'
												//qty
												+ '<td>'
												+ '<div data-plugin-spinner data-plugin-options="{ \'value\':1, \'step\': 1, \'min\': 1}">'
												+ '<div class="input-group">'
												+ '<button type="button" class="btn btn-default spinner-up" onclick="qtyupdown(\'plus\',\'s_qty'
												+ trLen
												+ '\');"><i class="fas fa-plus"></i></button>'
												+ '<input type="text" id="s_qty'
												+ trLen
												+ '" class="spinner-input form-control" maxlength="3"  name="InventoryInOutVOList['
												+ trLen
												+ '].event_qty" value="1">'
												+ '<button type="button" class="btn btn-default spinner-down" onclick="qtyupdown(\'minus\',\'s_qty'
												+ trLen
												+ '\');"><i class="fas fa-minus"></i></button>'
												+ '</div>'
												+ '</div>'
												+ '</td>'
												+ '<td>'
												+ '<input type="hidden" class="form-control"  name="InventoryInOutVOList['+trLen+'].event_amt" value="0">'
												+ '<button class="btn btn-danger btn-px-2 py-2" onclick="deleterow(this); return false;"><i class="fas fa-times"></i></button>'
												+ '</td>' + '</tr>';
									} else if (property == "+ 재고조정") {
										trText = '<tr>' + '<td>'
												+ rownum
												+ '</td>'
												//상품묭
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].prd_mng_num" value="'+prd_mng_num+'">'
												+ prd_nm
												+ '</td>'
												//상품코드
												+ '<td>'
												+ prd_code
												+ '</td>'
												//회사제고
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_comp_qty" value="'+comp_qty+'">'
												+ comp_qty
												+ '</td>'
												//사용자재고
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_user_qty" value="'+user_qty+'">'
												+ user_qty
												+ '</td>'
												//qty
												+ '<td>'
												+ '<div data-plugin-spinner data-plugin-options="{ \'value\':1, \'step\': 1, \'min\': 1}">'
												+ '<div class="input-group">'
												+ '<button type="button" class="btn btn-default spinner-up" onclick="qtyupdown(\'plus\',\'s_qty'
												+ trLen
												+ '\');"><i class="fas fa-plus"></i></button>'
												+ '<input type="text" id="s_qty'
										+ trLen
										+ '" class="spinner-input form-control" maxlength="3"  name="InventoryInOutVOList['
										+ trLen
										+ '].event_qty" value="1">'
												+ '<button type="button" class="btn btn-default spinner-down" onclick="qtyupdown(\'minus\',\'s_qty'
												+ trLen
												+ '\');"><i class="fas fa-minus"></i></button>'
												+ '</div>'
												+ '</div>'
												+ '</td>'
												+ '<td>'
												+ '<input type="hidden" class="form-control"  name="InventoryInOutVOList['+trLen+'].event_amt" value="0">'
												+ '<button class="btn btn-danger btn-px-2 py-2" onclick="deleterow(this); return false;"><i class="fas fa-times"></i></button>'
												+ '</td>' + '</tr>';
									} else if (property == "Seller반품입고") {
										trText = '<tr>' + '<td>'
												+ rownum
												+ '</td>'
												//상품묭
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].prd_mng_num" value="'+prd_mng_num+'">'
												+ prd_nm
												+ '</td>'
												//상품코드
												+ '<td>'
												+ prd_code
												+ '</td>'
												//회사제고
												+ '<td>'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_comp_qty" value="'+comp_qty+'">'
												+ '<input type="hidden" name="InventoryInOutVOList['+trLen+'].bf_user_qty" value="'+user_qty+'">'
												+ comp_qty
												+ '</td>'
												//cost price
												+ '<td>'
												+ '<div class="input-group">'
												+ '<span class="input-group-text">$</span> <input type="text" class="form-control" readonly="readonly"  name="InventoryInOutVOList['+trLen+'].cost_price" value="'+cost_price+'">'
												+ '</div>'
												+ '</td>'
												//unit price
												+ '<td>'
												+ '<div class="input-group">'
												+ '<span class="input-group-text">$</span> <input type="text" class="form-control" name="InventoryInOutVOList['
												+ trLen
												+ '].unit_price"  value="'
												+ unit_price
												+ '" onchange="getVal(this);">'
												+ '</div>'
												+ '</td>'
												//qty
												+ '<td>'
												+ '<div data-plugin-spinner data-plugin-options="{ \'value\':1, \'step\': 1, \'min\': 1}">'
												+ '<div class="input-group">'
												+ '<button type="button" class="btn btn-default spinner-up" onclick="qtyupdown(\'plus\',\'s_qty'
												+ trLen
												+ '\'); getVal2(this);"><i class="fas fa-plus"></i></button>'
												+ '<input type="text" id="s_qty'
												+ trLen
												+ '" class="spinner-input form-control" maxlength="3"  name="InventoryInOutVOList['
												+ trLen
												+ '].event_qty" value="1" onchange="getVal2(this);">'
												+ '<button type="button" class="btn btn-default spinner-down" onclick="qtyupdown(\'minus\',\'s_qty'
												+ trLen
												+ '\'); getVal2(this);"><i class="fas fa-minus"></i></button>'
												+ '</div>'
												+ '</div>'
												+ '</td>'
												//총계	
												+ '<td>'
												+ '<div class="input-group">'
												+ '<span class="input-group-text">$</span> <input type="text" class="form-control"  name="InventoryInOutVOList['+trLen+'].event_amt" value="'+unit_price+'">'
												+ '</div>'
												+ '</td>'
												+ '<td>'
												+ '<button class="btn btn-danger btn-px-2 py-2" onclick="deleterow(this); return false;"><i class="fas fa-times"></i></button>'
												+ '</td>' + '</tr>';
									}

									$(tblb).append(trText);
								});
					});

	function deleterow(obj) {
		var tr = $(obj).parent().parent();
		tr.remove();
		calcTotal();

	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			//숫자와 소수점만 입력가능
			event.target.value = event.target.value.replace(/[^-\.0-9]/g, "");
	}
	//콤마 찍기
	function comma(obj) {
		var regx = new RegExp(/(-?\d+)(\d{3})/);
		var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
		var strArr = obj.split('.');
		while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
			//정수 부분에만 콤마 달기 
			strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
		}
		if (bExists > -1) {
			//. 소수점 문자열이 발견되지 않을 경우 -1 반환
			obj = strArr[0] + "." + strArr[1];
		} else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환 
			obj = strArr[0];
		}
		return obj;//문자열 반환
	}
	//콤마 풀기
	function uncomma(str) {
		str = "" + str.replace(/,/gi, ''); // 콤마 제거 
		str = str.replace(/(^\s*)|(\s*$)/g, ""); // trim()공백,문자열 제거 
		return (new Number(str));//문자열을 숫자로 반환
	}
	//input box 콤마달기
	function inputNumberFormat(obj) {
		obj.value = comma(obj.value);
	}
	//input box 콤마풀기 호출
	function uncomma_call() {
		var input_value = document.getElementById('input1');
		input_value.value = uncomma(input_value.value);
	}
	function commaStr(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function getVal(obj) {

		var tr = $(obj).parent().parent().parent();
		var td = tr.children();
		var val1 = td.eq(5).children().children().eq(1).val();
		var val2 = td.eq(6).children().children().children().eq(1).val();
		//alert(val2);

		var temp = uncomma(val1) * uncomma(val2)
		temp = commaStr(temp);
		td.eq(7).children().children().eq(1).val(temp);

		//calcTotal();
	}
	function getVal2(obj) {

		var tr = $(obj).parent().parent().parent().parent();
		var td = tr.children();
		var val1 = td.eq(5).children().children().eq(1).val();
		var val2 = td.eq(6).children().children().children().eq(1).val();
		//alert(val2);

		var temp = uncomma(val1) * uncomma(val2)
		temp = commaStr(temp);
		td.eq(7).children().children().eq(1).val(temp);

		//calcTotal();
	}
	function loadHtml() {
		document.getElementById('h').value = document.documentElement.innerHTML;
	}
	function divReload() {
		$("#modalForm").load(location.href + ' #modalForm');
	}
</script>
<script>
	function qtyupdown(type, obj) {
		// 결과를 표시할 element
		const resultElement = document.getElementById(obj);

		// 현재 화면에 표시된 값
		let number = resultElement.value;
		//alert(number);
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}
		if (number == 0)
			number = 1;
		// 결과 출력
		resultElement.value = number;
	}
</script>
<script>
	function getInvPrd(prd_mng_num, user_num) {

		var qty = "0";
		var formData = new FormData();

		formData.append('prd_mng_num', prd_mng_num);
		formData.append('user_num', user_num);
		$.ajax({
			type : "POST",
			url : "find-inventory-product",
			data : formData,
			processData : false,
			contentType : false,
			dataType : 'JSON',
			cache : false,
			async : false,
			success : function(data) {
				//alert(data.qty);
				qty = String(data.qty);
			},
			error : function(request, status, error) {
				//alert("code:" + request.status + "\n" + "message:"
				//		+ request.responseText + "\n" + "error:" + error);
				qty = "0";
			}
		});
		return qty;
	}
</script>
