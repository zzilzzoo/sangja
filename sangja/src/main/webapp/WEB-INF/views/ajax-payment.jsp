<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="white-popup-block white-popup-block-lg">
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

							<c:forEach items="${payList}" var="payList">
								<tr>
									<td>${fn:substring(payList.pay_ymdt,0,10) }</td>
									<td>$ ${payList.pay_amt}</td>
									<td>${payList.pay_type}</td>
								</tr>
								<c:set var="tot_pay_amt" value="${tot_pay_amt+payList.pay_amt }" />
							</c:forEach>
						</tbody>
						<tfoot>
							<td class="font-weight-bold">Total</td>
							<td class="font-weight-bold">${tot_pay_amt }</td>
							<td></td>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</section>
</div>