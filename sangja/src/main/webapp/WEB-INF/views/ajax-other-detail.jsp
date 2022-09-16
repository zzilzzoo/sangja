<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="white-popup-block white-popup-block-lg">
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
								<li><label>Sales Type</label> <span>${salevo.sale_type}</span> <span>${salevo.sale_note}</span></li>
								<li><label>Sales Date</label>
								<c:set var="sale_ymd" value="${salevo.sale_ymd}" /> <fmt:parseDate var="sale_ymd"
										value="${sale_ymd}" pattern="yyyy-MM-dd"
									/> <c:set var="sale_ymd">
										<fmt:formatDate value="${sale_ymd}" pattern="dd/MM/yyyy" />
									</c:set> <span>${sale_ymd} ${fn:substring(salevo.sale_time,0,5) }</span></li>
								<li><label>Sales Person</label> <span>${salevo.sale_user_nm}</span></li>
								<li><label>Sales Status</label> <c:if
										test="${salevo.tot_ord_amt >= salevo.tot_pay_amt }"
									>
										<span>Completed</span>
									</c:if> <c:if test="${salevo.tot_ord_amt < salevo.tot_pay_amt }">
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
						<div class="col-lg-12 pb-3">
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
					<div class="row justify-content-md-center">
						<div class="col-lg-12">
							<div class="table-responsive pb-4">
								<table class="table table-responsive-md table-hover mb-0" style="min-width: 780px;">
									<thead>
										<tr>
											<th>#</th>
											<th>UPC Code</th>
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
												<td>${spvoList.upc_code}</td>
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
											<td colspan="5" class="border-0"></td>
											<td align="center" class="font-weight-bold">Subtotal</td>
											<td align="center">${tot_qty }</td>
											<td colspan="2"><fmt:formatNumber value="${salevo.tot_sale_amt}" pattern="#,##0.00" /></td>
										</tr>
										<tr>
											<td colspan="5" class="border-0"></td>
											<td align="center" class="font-weight-bold">Sales Tax</td>
											<td align="center"></td>
											<td colspan="2"><fmt:formatNumber value="${salevo.tot_tax_amt}" pattern="#,##0.00" /></td>
										</tr>
										<tr>
											<td colspan="5" class="border-0"></td>
											<td align="center" class="font-weight-bold">Shopping Cost</td>
											<td align="center"></td>
											<td colspan="2"><fmt:formatNumber value="${salevo.shopping_cost}" pattern="#,##0.00" /></td>
										</tr>
										<tr>
											<td colspan="5" class="border-0"></td>
											<td align="center" class="font-weight-bold">Order Total</td>
											<td align="center" class="font-weight-bold">${tot_qty }</td>
											<td colspan="2" class="font-weight-bold"><fmt:formatNumber
													value="${salevo.tot_ord_amt}" pattern="#,##0.00"
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
											</tr>
										</thead>
										<tbody>
											<c:set var="tot_pay_amt" value="0" />
											<c:forEach items="${payList}" var="payList">
												<tr>
													<td>${fn:substring(payList.pay_ymdt,0,10) }</td>
													<td>$ <fmt:formatNumber value="${payList.pay_amt}" pattern="#,##0.00" /></td>
													<td>${payList.pay_type}</td>
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
									<span class="d-flex align-items-center"> Total <i
										class="fas fa-chevron-right text-color-primary px-3"
									></i> <span class="d-flex align-items-center justify-content-lg-end"> <strong
											class="text-color-danger text-6"
										>$ <fmt:formatNumber value="${tot_amt - tot_pay_amt}" pattern="#,##0.00" /></strong>
									</span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
