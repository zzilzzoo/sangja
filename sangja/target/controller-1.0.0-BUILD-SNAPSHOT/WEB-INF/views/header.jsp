<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="true"%>

<header class="header">
	<div class="logo-container">
		<a href="/" class="logo"> <img src="../resources/img/logo.png"
			width="75" height="35" alt="SangJa Admin" />
		</a>

		<div class="d-md-none toggle-sidebar-left"
			data-toggle-class="sidebar-left-opened" data-target="html"
			data-fire-event="sidebar-left-opened">
			<i class="fas fa-bars" aria-label="Toggle sidebar"></i>
		</div>

	</div>

	<!-- start: search & user box -->
	<div class="header-right">

		<span class="separator"></span>

		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="nowdate">
			<fmt:formatDate value="${today}"  timeZone="CST" pattern="MM/dd/yyyy" />
		</c:set>
		<div class="notifications">
			<div class="text-3">
				<i class="fas fa-store"></i> Today : <span class=""><strong>${nowdate}</strong></span>
			</div>

		</div>

		<span class="separator"></span>

		<div id="userbox" class="userbox">
			<a href="#" data-bs-toggle="dropdown">
				<div class="profile-info">
					<span class="name">${sess_user.user_nm_f}
						${sess_user.user_nm_l}</span> <span class="role">${sess_user.job}</span>
				</div> <i class="fa custom-caret"></i>
			</a>

			<div class="dropdown-menu">
				<ul class="list-unstyled mb-2">
					<li class="divider"></li>
					<li><a role="menuitem" tabindex="-1" href="customer-list?search_user=${sess_user.user_num}"><i
							class="bx bx-user"></i> My Customer</a></li>
					<a role="menuitem" tabindex="-1" href="/signout"><i
						class="bx bx-power-off"></i> Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- end: search & user box -->
</header>
