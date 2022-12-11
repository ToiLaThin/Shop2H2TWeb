<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<meta charset="utf-8">
<title>User and Product management</title>

	<!-- User Accounts Start -->
    <div class="container-fluid py-5 mb-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">User 's Accounts</span>
			</h2>
		</div>
		<div class="row px-xl-5">
            <div class="col">
                <div class="d-flex justify-content-start align-items-center text-center">
				<c:forEach items="${userAccounts}" var="acc" varStatus="Stt">
					<div class="p-1" style="width:10%">
						<div>
							<c:if test="${acc.images == null }">
								<img src="<%=request.getContextPath()%>/img/user.jpg"
									class="rounded-circle border-1 border-dark" width="75"
									height="75" />
							</c:if>
							<c:if test="${acc.images != null }">
								<img src="${acc.images }"
									class="rounded-circle border-1 border-dark" width="75"
									height="75" />
							</c:if>
						</div>
						<h4 class="p-0 m-0"><a class="text-dark" href="<%=request.getContextPath() %>/admin/account/detail?accountId=${acc.userId}">${acc.username }</a></h4>
						<c:if test="${acc.status == 0}">
							<small class="text-dark mb-4 d-block">
								Status: <span class="text-success">Active</span>
							</small>
						</c:if>
						<c:if test="${acc.status == 1}">
							<small class="text-dark mb-4 d-block">
								Status: <span class="text-danger">Inactive</span>
							</small>
						</c:if>
					</div>
				</c:forEach>				
                </div>
            </div>
        </div>
    </div>
    <!-- User Accounts End -->
    
    <!-- Seller Accounts Start -->
    <div class="container-fluid py-5 mb-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">Seller 's Accounts</span>
			</h2>
		</div>
		<div class="row px-xl-5">
            <div class="col">
                <div class="d-flex justify-content-start align-items-center text-center">
				<c:forEach items="${sellerAccounts}" var="acc" varStatus="Stt">
					<div class="p-1" style="width:10%">
						<div>
							<c:if test="${acc.images == null }">
								<img src="<%=request.getContextPath()%>/img/user.jpg"
									class="rounded-circle border-1 border-dark" width="75"
									height="75" />
							</c:if>
							<c:if test="${acc.images != null }">
								<img src="${acc.images }"
									class="rounded-circle border-1 border-dark" width="75"
									height="75" />
							</c:if>
						</div>
						<h4 class="p-0 m-0"><a class="text-dark" href="<%=request.getContextPath() %>/admin/account/detail?accountId=${acc.userId}">${acc.username }</a></h4>
						<c:if test="${acc.status == 0}">
							<small class="text-dark mb-4 d-block">
								Status: <span class="text-success">Active</span>
							</small>
						</c:if>
						<c:if test="${acc.status == 1}">
							<small class="text-dark mb-4 d-block">
								Status: <span class="text-danger">Inactive</span>
							</small>
						</c:if>
					</div>
				</c:forEach>				
                </div>
            </div>
        </div>
    </div>
    <!-- Seller Accounts End -->
    
    <!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>




<div class="container-fluid mt-3">
	<div class="text-center mb-4">
		<h2 class="section-title px-5">
			<span class="px-2">All Products</span>
		</h2>
	</div>
	<div class="row">
		<c:forEach items="${pros }" var="product" varStatus="Stt">
			<c:if test="${product.status == 0}">
				<div class="col-lg-2 col-md-4 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
							<img class="" src="${product.images }" alt=""
								style="width: 100%;" height="360">
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
						</div>
						<div class="card-footer d-flex justify-content-between bg-light border">
							<a
								href="<%=request.getContextPath() %>/common/product/detail?productId=${product.productId }"
								class="btn btn-sm text-dark p-0"><i
								class="fas fa-eye text-primary mr-1"></i>View Detail
							</a>
							<p class="m-0 p-0">
								Status: <span class="text-success">Active</span>
							</p>							
						</div>						
					</div>
				</div>
			</c:if>
			<c:if test="${product.status == 1}">
				<div class="col-lg-2 col-md-4 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4 bg-secondary">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
							<img class="" src="${product.images }" alt=""
								style="width: 100%;" height="360">
						</div>
						<div
							class="card-body border-left border-right text-center p-0 pt-4 pb-3">
							<h6 class="text-truncate mb-3">${product.productName }</h6>
							<div class="d-flex justify-content-center">
								<h6 class="text-muted ml-2">Locked</h6>
							</div>
						</div>
						<div
							class="card-footer d-flex justify-content-between bg-light border">
							<a
								href="<%=request.getContextPath() %>/common/product/detail?productId=${product.productId }"
								class="btn btn-sm text-dark p-0"><i
								class="fas fa-eye text-primary mr-1"></i>View Detail
							</a>
							<p class="m-0 p-0">
								Status: <span class="text-danger">Inactive</span>
							</p>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>



<!-- load back to top -->
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/lib/easing/easing.min.js"></script>
<script src="<%=request.getContextPath() %>/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="<%=request.getContextPath() %>/mail/jqBootstrapValidation.min.js"></script>
<script src="<%=request.getContextPath() %>/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="<%=request.getContextPath() %>/js/main.js"></script>