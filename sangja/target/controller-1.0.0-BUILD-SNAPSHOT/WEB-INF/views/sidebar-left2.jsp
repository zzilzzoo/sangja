
<aside id="sidebar-left" class="sidebar-left">

	<div class="sidebar-header">
		<div class="sidebar-title">Navigation</div>
		<div class="sidebar-toggle d-none d-md-block"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fas fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>

	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				<ul class="nav nav-main">
					<c:choose>
						<c:when test="${firstmenu_code==1}">
							<li class="nav-parent nav-expanded nav-active"><a
								class="nav-link" href="#"> <i
									class="bx bxs-message-alt-edit" aria-hidden="true"></i> <span>Basic</span>
							</a>
								<ul class="nav nav-children">
									<c:choose>
										<c:when test="${secondmenu_code==1}">
											<li class="nav-parent nav-expanded nav-active"><a>
													Product Management <span
													class="mega-sub-nav-toggle toggled float-end"
													data-toggle="collapse"
													data-target=".mega-sub-nav-sub-menu-1"></span>
											</a>
												<ul class="nav nav-children">
													<c:choose>
														<c:when test="${third_code==1}">
															<li class="nav-active"><a class="nav-link"
																href="category-list"> Category </a></li>
														</c:when>
														<c:otherwise>
															<li><a class="nav-link" href="category-list">
																	Category </a></li>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${third_code==2}">
															<li class="nav-active"><a class="nav-link"
																href="product-list"> Product </a></li>
														</c:when>
														<c:otherwise>
															<li><a class="nav-link" href="product-list">
																	Product </a></li>
														</c:otherwise>
													</c:choose>
												</ul></li>
										</c:when>
										<c:otherwise>
											<li class="nav-parent"><a> Product Management </a>
												<ul class="nav nav-children">
													<li><a class="nav-link" href="category-list">
															Category </a></li>
													<li><a class="nav-link" href="product-list">
															Product </a></li>
												</ul></li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${secondmenu_code==2}">
											<li class="nav-active"><a class="nav-link"
												href="customer-list"> Customer Management </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="customer-list">
													Customer Management </a></li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${secondmenu_code==3}">
											<li class="nav-active"><a class="nav-link"
												href="user-list"> User Management </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="user-list"> User
													Management </a></li>
										</c:otherwise>
									</c:choose>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-parent"><a class="nav-link" href="#"> <i
									class="bx bxs-message-alt-edit" aria-hidden="true"></i> <span>Basic</span>
							</a>
								<ul class="nav nav-children">
									<li class="nav-parent"><a> Product Management </a>
										<ul class="nav nav-children">
											<li><a class="nav-link" href="category-list.html">
													Category </a></li>
											<li><a class="nav-link" href="product-list.html">
													Product </a></li>
										</ul></li>
									<li><a class="nav-link" href="customer-list.html">
											Customer Management </a></li>
									<li><a class="nav-link" href="user-list.html"> User
											Management </a></li>

								</ul></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${firstmenu_code==2}">
							<li class="nav-parent nav-expanded nav-active"><a
								class="nav-link" href="#"> <i class="bx bx-cart-alt"
									aria-hidden="true"></i> <span>Sales</span>
							</a>
								<ul class="nav nav-children">
									<c:choose>
										<c:when test="${secondmenu_code==1}">
											<li class="nav-parent nav-expanded nav-active"><a>
													Sales Management </a>
												<ul class="nav nav-children">
													<c:choose>
														<c:when test="${third_code==1}">
															<li class="nav-active"><a class="nav-link"
																href="today-visit.html"> Today Visit </a></li>
														</c:when>
														<c:otherwise>
															<li><a class="nav-link" href="today-visit.html">
																	Today Visit </a></li>
														</c:otherwise>
													</c:choose>

													<c:choose>
														<c:when test="${third_code==2}">
															<li class="nav-active"><a class="nav-link"
																href="on-site-sales.html"> On-Site Sales </a></li>
														</c:when>
														<c:otherwise>
															<li><a class="nav-link" href="on-site-sales.html">
																	On-Site Sales </a></li>
														</c:otherwise>
													</c:choose>

													<c:choose>
														<c:when test="${third_code==3}">
															<li class="nav-active"><a class="nav-link"
																href="other-sales.html"> Other Sales </a></li>
														</c:when>
														<c:otherwise>
															<li><a class="nav-link" href="other-sales.html">
																	Other Sales </a></li>
														</c:otherwise>
													</c:choose>

													<c:choose>
														<c:when test="${third_code==4}">
															<li class="nav-active"><a class="nav-link"
																href="order-list.html"> Order Report </a></li>
														</c:when>
														<c:otherwise>
															<li><a class="nav-link" href="order-list.html">
																	Order Report </a></li>
														</c:otherwise>
													</c:choose>

												</ul></li>
										</c:when>
										<c:otherwise>
											<li class="nav-parent"><a> Sales Management </a>
												<ul class="nav nav-children">
													<li><a class="nav-link" href="today-visit.html">
															Today Visit </a></li>
													<li><a class="nav-link" href="on-site-sales.html">
															On-Site Sales </a></li>
													<li><a class="nav-link" href="other-sales.html">
															Other Sales </a></li>
													<li><a class="nav-link" href="order-list.html">
															Order Report </a></li>
												</ul></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${secondmenu_code==2}">
											<li class="nav-active"><a class="nav-link"
												href="ar-managment.html"> AR Management </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="ar-managment.html"> AR
													Management </a></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${secondmenu_code==3}">
											<li class="nav-active"><a class="nav-link"
												href="sales-close.html"> Sales Close </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="sales-close.html">
													Sales Close </a></li>
										</c:otherwise>
									</c:choose>

								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-parent"><a class="nav-link" href="#"> <i
									class="bx bx-cart-alt" aria-hidden="true"></i> <span>Sales</span>
							</a>
								<ul class="nav nav-children">
									<li class="nav-parent"><a> Sales Management </a>
										<ul class="nav nav-children">
											<li><a class="nav-link" href="today-visit.html">
													Today Visit </a></li>
											<li><a class="nav-link" href="on-site-sales.html">
													On-Site Sales </a></li>
											<li><a class="nav-link" href="other-sales.html">
													Other Sales </a></li>
											<li><a class="nav-link" href="order-list.html">
													Order Report </a></li>

										</ul></li>
									<li><a class="nav-link" href="ar-managment.html"> AR
											Management </a></li>
									<li><a class="nav-link" href="sales-close.html"> Sales
											Close </a></li>
								</ul></li>

						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${firstmenu_code==3}">
							<li class="nav-active"><a class="nav-link"
								href="inventory-list.html"> <i class="bx bx-cube"
									aria-hidden="true"></i> <span>Inventory</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="nav-link" href="inventory-list.html"> <i
									class="bx bx-cube" aria-hidden="true"></i> <span>Inventory</span>
							</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${firstmenu_code==4}">
							<li class="nav-parent"><a class="nav-link" href="#"> <i
									class="bx bx-file" aria-hidden="true"></i> <span>Report</span>
							</a>
								<ul class="nav nav-children">
									<c:choose>
										<c:when test="${secondmenu_code==1}">
											<li class="nav-active"><a class="nav-link"
												href="sales-report.html"> Sales Report </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="sales-report.html">
													Sales Report </a></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${secondmenu_code==2}">
											<li class="nav-active"><a class="nav-link"
												href="inventory-report.html"> Inventory Report </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="inventory-report.html">
													Inventory Report </a></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${secondmenu_code==3}">
											<li class="nav-active"><a class="nav-link"
												href="p-l-report.html"> P&amp;L Report </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="p-l-report.html">
													P&amp;L Report </a></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${secondmenu_code==4}">
											<li class="nav-active"><a class="nav-link"
												href="usage-report.html"> Usage Report </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="usage-report.html">
													Usage Report </a></li>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${secondmenu_code==5}">
											<li class="nav-active"><a class="nav-link"
												href="ar-report.html"> AR Report </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="ar-report.html"> AR
													Report </a></li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${secondmenu_code==6}">
											<li class="nav-active"><a class="nav-link"
												href="commission-report.html"> Commission Report </a></li>
										</c:when>
										<c:otherwise>
											<li><a class="nav-link" href="commission-report.html">
													Commission Report </a></li>
										</c:otherwise>
									</c:choose>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-parent"><a class="nav-link" href="#"> <i
									class="bx bx-file" aria-hidden="true"></i> <span>Report</span>
							</a>
								<ul class="nav nav-children">
									<li><a class="nav-link" href="sales-report.html">
											Sales Report </a></li>
									<li><a class="nav-link" href="inventory-report.html">
											Inventory Report </a></li>
									<li><a class="nav-link" href="p-l-report.html">
											P&amp;L Report </a></li>
									<li><a class="nav-link" href="usage-report.html">
											Usage Report </a></li>
									<li><a class="nav-link" href="ar-report.html"> AR
											Report </a></li>
									<li><a class="nav-link" href="commission-report.html">
											Commission Report </a></li>
								</ul></li>

						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

		</div>

	</div>

</aside>
<!-- end: sidebar -->
