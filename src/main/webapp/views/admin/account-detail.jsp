<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<!-- 404 Start -->
<div class="container-xxl py-5">
	<div class="container px-lg-5 text-center ">
		<div class="row justify-content-center ">
			<div class="col-lg-6 bg-secondary p-5 border border-light rounded-lg">
				<div>
						<c:if test="${account.images == null }">
						<img src="<%=request.getContextPath()%>/img/user.jpg" class="rounded-circle border-1 border-dark" width="75" height="75" />
						</c:if>
						<c:if test="${account.images != null }">
						<img src="${account.images }" class="rounded-circle border-1 border-dark" width="75" height="75" />
						</c:if>
				</div>
				<h1 class="p-0 m-0">${account.username }</h1>
				<p class="text-dark p-0 m-0">${account.fullname }</p>
				<small class="text-dark mb-4 d-block">${account.email }</small>
				<c:if test="${account.status == 0}">
					<p class="mb-4 ">Status: <span class="text-success">Active</span></p>
				</c:if>
				<c:if test="${account.status == 1}">
					<p class="mb-4 ">Status: <span class="text-danger">Inactive</span></p>
				</c:if>
				
				<a class="btn btn-success rounded-pill py-3 px-5" href="<%=request.getContextPath() %>/admin/user/changestatus0?userid=${account.userId}">Go
					Active
				</a>
				<a class="btn btn-danger rounded-pill py-3 px-5" href="<%=request.getContextPath() %>/admin/user/changestatus1?userid=${account.userId}">Go
					Inactive
				</a>
			</div>
		</div>
	</div>
</div>
<!-- 404 End -->

<c:if test="${sellerId != null}">
<!-- Products Start -->
<div class="container-fluid pt-5">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">Shop 's Products</span>
		</h2>
	</div>
	<div class="row px-xl-5 pb-3">
		<c:forEach items="${productListOfSeller }" var="product"
			varStatus="Stt">
			<c:if test="${product.status == 0}">
				<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
							<img style="width: 100%; height: 100%" src="${product.images }">
						</div>
						<div
							class="card-body border-left border-right text-center p-0 pt-4 pb-3">
							<h6 class="text-truncate mb-3">${product.productName }</h6>
							<div class="d-flex justify-content-center">
								<h6>${product.price}$</h6>
								<h6 class="text-muted ml-2">
									<del>${product.price}$ </del>
								</h6>
							</div>
							<c:if test="${product.description.length() < 101}">
								<h6>
									<small class="text-muted mb-3">${product.description }</small>
								</h6>
							</c:if>

							<c:if test="${product.description.length() >= 101}">
								<h6>
									<small class="text-muted mb-3">${product.description.substring(0,100)}...</small>
								</h6>
							</c:if>
						</div>		
						<div class="card-footer d-flex justify-content-between bg-light border">
							<a	href="<%=request.getContextPath() %>/common/product/detail?productId=${product.productId }"
								class="btn btn-block text-dark p-0"><i
								class="fas fa-eye text-primary mr-1"></i>View Detail
							</a>
						</div>					
						<div class="card-footer d-flex justify-content-between bg-light border">
							<a	href="<%=request.getContextPath() %>/seller/product/update?productId=${product.productId}"
								class="btn btn-block text-dark p-0"><i
								class="fas fa-wrench text-primary mr-1"></i>Update
							</a>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${product.status == 1}">
				<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4 bg-secondary">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
							<img style="width: 100%; height: 100%" src="${product.images }">
						</div>
						<div
							class="card-body border-left border-right text-center p-0 pt-4 pb-3">
							<h6 class="text-truncate mb-3">${product.productName }</h6>
							<div class="d-flex justify-content-center">
								<h6 class="text-muted ml-2">Locked</h6>
							</div>
						</div>
						<div class="card-footer d-flex justify-content-between bg-light border">
							<a	href="<%=request.getContextPath() %>/common/product/detail?productId=${product.productId }"
								class="btn btn-block text-dark p-0"><i
								class="fas fa-eye text-primary mr-1"></i>View Detail
							</a>
						</div>										
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
</c:if>
<!-- Products End -->