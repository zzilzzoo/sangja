
<aside id="sidebar-left" class="sidebar-left">

	<div class="sidebar-header">
		<div class="sidebar-title">Navigation</div>
		<div class="sidebar-toggle d-none d-md-block" data-toggle-class="sidebar-left-collapsed"
			data-target="html" data-fire-event="sidebar-left-toggle"
		>
			<i class="fas fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>

	<div class="nano">
		<div class="nano-content">
			<nav id="menu" class="nav-main" role="navigation">
				<ul class="nav nav-main">
					<c:choose>
						<c:when test="${firstmenu_code==1}">
							<li class="nav-parent nav-expanded nav-active"><a class="nav-link" href="#"> <i
									class="bx bxs-message-alt-edit" aria-hidden="true"
								></i> <span>Basic</span>
							</a>
								<ul class="nav nav-children">
									<c:choose>
										<c:when test="${secondmenu_code==1}">
											<li class="nav-parent nav-expanded nav-active"><a> Product Management <span
													class="mega-sub-nav-toggle toggled float-end" data-toggle="collapse"
													data-target=".mega-sub-nav-sub-menu-1"
												></span>
											</a>
												<ul class="nav nav-children">
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '111' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<c:choose>
															<c:when test="${third_code==1}">
																<li class="nav-active"><a class="nav-link" href="category-list">Category</a></li>
															</c:when>
															<c:otherwise>
																<li><a class="nav-link" href="category-list"> Category </a></li>
															</c:otherwise>
														</c:choose>
													</div>
													<c:set var="shown" value="show" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '112' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}"">
														<c:choose>
															<c:when test="${third_code==2}">
																<li class="nav-active"><a class="nav-link" href="product-list"> Product </a></li>
															</c:when>
															<c:otherwise>
																<li><a class="nav-link" href="product-list"> Product </a></li>
															</c:otherwise>
														</c:choose>
													</div>
												</ul></li>
										</c:when>
										<c:otherwise>
											<li class="nav-parent"><a> Product Management </a>
												<ul class="nav nav-children">
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '111' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown}${height}">
														<li><a class="nav-link" href="category-list"> Category </a></li>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '112' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown}${height}">
														<li><a class="nav-link" href="product-list"> Product </a></li>
													</div>
												</ul></li>
										</c:otherwise>
									</c:choose>

									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '121' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==2}">
												<li class="nav-active"><a class="nav-link" href="customer-list"> Customer
														Management </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="customer-list"> Customer Management </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '131' and umList.read_yn eq 'n'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==3}">
												<li class="nav-active"><a class="nav-link" href="user-list"> User Management </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="user-list"> User Management </a></li>
											</c:otherwise>
										</c:choose>
									</div>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-parent"><a class="nav-link" href="#"> <i
									class="bx bxs-message-alt-edit" aria-hidden="true"
								></i> <span>Basic</span>
							</a>
								<ul class="nav nav-children">
									<li class="nav-parent"><a> Product Management </a>
										<ul class="nav nav-children">
											<c:forEach items="${umList}" var="umList">
												<c:if test="${umList.menu_num eq '111' and umList.read_yn eq 'n'}">
													<c:set var="shown" value="hidden" />
													<c:set var="height" value=";height:0px" />
												</c:if>
											</c:forEach>
											<div style="visibility:${shown};${height}">
												<li><a class="nav-link" href="category-list"> Category </a></li>
											</div>
											<c:forEach items="${umList}" var="umList">
												<c:if test="${umList.menu_num eq '112' and umList.read_yn eq 'n'}">
													<c:set var="shown" value="hidden" />
													<c:set var="height" value=";height:0px" />
												</c:if>
											</c:forEach>
											<div style="visibility:${shown};${height}">
												<li><a class="nav-link" href="product-list"> Product </a></li>
											</div>
										</ul></li>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '121' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="customer-list"> Customer Management </a></li>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '131' and umList.read_yn eq 'n'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="user-list"> User Management </a></li>
									</div>
								</ul></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${firstmenu_code==2}">
							<li class="nav-parent nav-expanded nav-active"><a class="nav-link" href="#"> <i
									class="bx bx-cart-alt" aria-hidden="true"
								></i> <span>Sales</span>
							</a>
								<ul class="nav nav-children">
									<c:choose>
										<c:when test="${secondmenu_code==1}">
											<li class="nav-parent nav-expanded nav-active"><a> Sales Management </a>
												<ul class="nav nav-children">
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '211' and umList.read_yn eq 'None'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<c:choose>
															<c:when test="${third_code==1}">
																<li class="nav-active"><a class="nav-link" href="today-visit"> Today Visit
																</a></li>
															</c:when>
															<c:otherwise>
																<li><a class="nav-link" href="today-visit"> Today Visit </a></li>
															</c:otherwise>
														</c:choose>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '212' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<c:choose>
															<c:when test="${third_code==2}">
																<li class="nav-active"><a class="nav-link" href="on-site-sales"> On-Site
																		Sales </a></li>
															</c:when>
															<c:otherwise>
																<li><a class="nav-link" href="on-site-sales"> On-Site Sales </a></li>
															</c:otherwise>
														</c:choose>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '213' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<c:choose>
															<c:when test="${third_code==3}">
																<li class="nav-active"><a class="nav-link" href="other-sales"> Other Sales
																</a></li>
															</c:when>
															<c:otherwise>
																<li><a class="nav-link" href="other-sales"> Other Sales </a></li>
															</c:otherwise>
														</c:choose>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '214' and umList.read_yn eq 'None'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<c:choose>
															<c:when test="${third_code==4}">
																<li class="nav-active"><a class="nav-link" href="order-list"> Order Report
																</a></li>
															</c:when>
															<c:otherwise>
																<li><a class="nav-link" href="order-list"> Order Report </a></li>
															</c:otherwise>
														</c:choose>
													</div>
												</ul></li>
										</c:when>
										<c:otherwise>
											<li class="nav-parent"><a> Sales Management </a>
												<ul class="nav nav-children">
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '211' and umList.read_yn eq 'None'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<li><a class="nav-link" href="today-visit"> Today Visit </a></li>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '212' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<li><a class="nav-link" href="on-site-sales"> On-Site Sales </a></li>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '213' and umList.read_yn eq 'n'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<li><a class="nav-link" href="other-sales"> Other Sales </a></li>
													</div>
													<c:set var="shown" value="show" />
													<c:set var="height" value="" />
													<c:forEach items="${umList}" var="umList">
														<c:if test="${umList.menu_num eq '214' and umList.read_yn eq 'None'}">
															<c:set var="shown" value="hidden" />
															<c:set var="height" value=";height:0px" />
														</c:if>
													</c:forEach>
													<div style="visibility:${shown};${height}">
														<li><a class="nav-link" href="order-list"> Order Report </a></li>
													</div>
												</ul></li>
										</c:otherwise>
									</c:choose>

									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '221' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==2}">
												<li class="nav-active"><a class="nav-link" href="ar-managment">AR Management</a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="ar-managment"> AR Management </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '231' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==3}">
												<li class="nav-active"><a class="nav-link" href="sales-close"> Sales Close </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="sales-close"> Sales Close </a></li>
											</c:otherwise>
										</c:choose>
									</div>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-parent"><a class="nav-link" href="#"> <i class="bx bx-cart-alt"
									aria-hidden="true"
								></i> <span>Sales</span>
							</a>
								<ul class="nav nav-children">
									<li class="nav-parent"><a> Sales Management </a>
										<ul class="nav nav-children">
											<c:set var="shown" value="show" />
											<c:set var="height" value="" />
											<c:forEach items="${umList}" var="umList">
												<c:if test="${umList.menu_num eq '211' and umList.read_yn eq 'None'}">
													<c:set var="shown" value="hidden" />
													<c:set var="height" value=";height:0px" />
												</c:if>
											</c:forEach>
											<div style="visibility:${shown};${height}">
												<li><a class="nav-link" href="today-visit"> Today Visit </a></li>
											</div>
											<c:set var="shown" value="show" />
											<c:set var="height" value="" />
											<c:forEach items="${umList}" var="umList">
												<c:if test="${umList.menu_num eq '212' and umList.read_yn eq 'n'}">
													<c:set var="shown" value="hidden" />
													<c:set var="height" value=";height:0px" />
												</c:if>
											</c:forEach>
											<div style="visibility:${shown};${height}">
												<li><a class="nav-link" href="on-site-sales"> On-Site Sales </a></li>
											</div>
											<c:forEach items="${umList}" var="umList">
												<c:if test="${umList.menu_num eq '213' and umList.read_yn eq 'n'}">
													<c:set var="shown" value="hidden" />
													<c:set var="height" value=";height:0px" />
												</c:if>
											</c:forEach>
											<div style="visibility:${shown};${height}">
												<li><a class="nav-link" href="other-sales"> Other Sales </a></li>
											</div>
											<c:set var="shown" value="show" />
											<c:set var="height" value="" />
											<c:forEach items="${umList}" var="umList">
												<c:if test="${umList.menu_num eq '214' and umList.read_yn eq 'None'}">
													<c:set var="shown" value="hidden" />
													<c:set var="height" value=";height:0px" />
												</c:if>
											</c:forEach>
											<div style="visibility:${shown};${height}">
												<li><a class="nav-link" href="order-list"> Order Report </a></li>
											</div>

										</ul></li>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '221' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="ar-managment"> </a></li>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '231' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="sales-close"> Sales Close </a></li>
									</div>
								</ul></li>

						</c:otherwise>
					</c:choose>

					<c:set var="shown" value="show" />
					<c:set var="height" value="" />
					<c:forEach items="${umList}" var="umList">
						<c:if test="${umList.menu_num eq '311' and umList.read_yn eq 'None'}">
							<c:set var="shown" value="hidden" />
							<c:set var="height" value=";height:0px" />
						</c:if>
					</c:forEach>

					<c:choose>
						<c:when test="${firstmenu_code==3}">
							<li style="visibility:${shown};" class="nav-active"><a class="nav-link" href="inventory-list"> <i
									class="bx bx-cube" aria-hidden="true"
								></i> <span>Inventory</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li style="visibility:${shown};"><a class="nav-link" href="inventory-list"> <i class="bx bx-cube"
									aria-hidden="true"
								></i> <span>Inventory</span>
							</a></li>
						</c:otherwise>
					</c:choose>


					<c:choose>
						<c:when test="${firstmenu_code==4}">
							<li class="nav-parent"><a class="nav-link" href="#"> <i class="bx bx-file"
									aria-hidden="true"
								></i> <span>Report</span>
							</a>
								<ul class="nav nav-children">
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '411' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==1}">
												<li class="nav-active"><a class="nav-link" href="sales-report"> Sales Report </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="sales-report"> Sales Report </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '421' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==2}">
												<li class="nav-active"><a class="nav-link" href="inventory-report"> Inventory
														Report </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="inventory-report"> Inventory Report </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '431' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==3}">
												<li class="nav-active"><a class="nav-link" href="p-l-report"> P&amp;L Report </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="p-l-report"> P&amp;L Report </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '441' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==4}">
												<li class="nav-active"><a class="nav-link" href="usage-report"> Usage Report </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="usage-report"> Usage Report </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '451' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==5}">
												<li class="nav-active"><a class="nav-link" href="ar-report"> AR Report </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="ar-report"> AR Report </a></li>
											</c:otherwise>
										</c:choose>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '461' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<c:choose>
											<c:when test="${secondmenu_code==6}">
												<li class="nav-active"><a class="nav-link" href="commission-report"> Commission
														Report </a></li>
											</c:when>
											<c:otherwise>
												<li><a class="nav-link" href="commission-report"> Commission Report </a></li>
											</c:otherwise>
										</c:choose>
									</div>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-parent"><a class="nav-link" href="#"> <i class="bx bx-file"
									aria-hidden="true"
								></i> <span>Report</span>
							</a>
								<ul class="nav nav-children">
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '411' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="sales-report"> Sales Report </a></li>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '421' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>

									<li><div style="visibility:${shown};${height}">
											<a class="nav-link" href="inventory-report"> Inventory Report </a>
										</div></li>

									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '431' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="p-l-report"> P&amp;L Report </a></li>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '441' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="usage-report"> Usage Report </a></li>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '451' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="ar-report"> AR Report </a></li>
									</div>
									<c:set var="shown" value="show" />
									<c:set var="height" value="" />
									<c:forEach items="${umList}" var="umList">
										<c:if test="${umList.menu_num eq '461' and umList.read_yn eq 'None'}">
											<c:set var="shown" value="hidden" />
											<c:set var="height" value=";height:0px" />
										</c:if>
									</c:forEach>
									<div style="visibility:${shown};${height}">
										<li><a class="nav-link" href="commission-report"> Commission Report </a></li>
									</div>
								</ul></li>

						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

		</div>

	</div>

</aside>
<!-- end: sidebar -->
