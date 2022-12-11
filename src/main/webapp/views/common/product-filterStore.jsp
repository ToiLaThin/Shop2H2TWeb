<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="shop.Services.Impl.AccountServicesImpl"%>


<div class="text-center mb-5 text-danger">
	<h2 class="section-title px-5">
		<span class="px-2">${store.name }</span>
	</h2>
</div>
<br>
<!-- Shop Product Start -->
<div class="col-lg-12 col-md-12">
	<%
		AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
		String username = (String) session.getAttribute("username");
		int accountId = accountServicesImpl.findAccountId(username);
	%>
	<div class="row" id="products">
		<c:forEach items="${productList }" var="product" varStatus="Stt">
			<c:if test="${product.status == 0}">
				<div class="col-lg-3 col-md-6 col-sm-12 pb-1 product">
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
						<div
							class="card-footer d-flex justify-content-between bg-light border">
							<a
								href="<%=request.getContextPath() %>/common/product/detail?productId=${product.productId }"
								class="btn btn-sm text-dark p-0"><i
								class="fas fa-eye text-primary mr-1"></i>View Detail </a>
							<c:if test="${username != null }">
								<c:set var="isLogin" value="true" />
							</c:if>
							<c:if test="${username == null }">
								<c:set var="isLogin" value="false" />
							</c:if>
							<c:if test="${isLogin == true }">
								<c:if test="${product.isWished == false }">
									<!-- có thể đưa biến từ jsp tag vào chứ ko cần là attribute -->
									<a
										href="<%=request.getContextPath() %>/common/wishList/insert?productId=${product.productId }&accountId=<%=accountId %>"
										class="btn btn-sm text-dark p-0"><i
										class="far fa-heart text-primary mr-1"></i>Add To Wishlist </a>
								</c:if>
								<c:if test="${product.isWished == true }">
									<!-- có thể đưa biến từ jsp tag vào chứ ko cần là attribute -->
									<a
										href="<%=request.getContextPath() %>/common/wishList/delete?productId=${product.productId }&accountId=<%=accountId %>"
										class="btn btn-sm text-dark p-0"><i
										class="fas fa-heart text-primary mr-1"></i>Wished </a>
								</c:if>
							</c:if>
							<c:if test="${isLogin == false }">
								<a href="<%=request.getContextPath() %>/views/common/login.jsp"
									class="btn btn-sm text-dark p-0"><i
									class="far fa-heart text-primary mr-1"></i>Add To Wishlist </a>
							</c:if>
							<a
								href="<%=request.getContextPath() %>/common/cart?productId=${product.productId }&action=addToCart"
								class="btn btn-sm text-dark p-0"><i
								class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart </a>
						</div>
						<div
							class="card-footer d-flex justify-content-between bg-light border">
							<c:if test="${username != null }">
								<c:set var="isLogin" value="true" />
							</c:if>
							<c:if test="${username == null }">
								<c:set var="isLogin" value="false" />
							</c:if>
							<c:if test="${isLogin == true }">
								<a
									href="<%=request.getContextPath() %>/common/buyNow?productId=${product.productId }"
									class="btn btn-block text-dark p-0"><i
									class="fas fa-shopping-cart text-primary mr-1"></i>Buy now</a>
							</c:if>
							<c:if test="${isLogin == false }">
								<a href="<%=request.getContextPath()%>/views/common/login.jsp"
									class="btn btn-block text-dark p-0"><i
									class="fas fa-shopping-cart text-primary mr-1"></i>Buy now</a>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${product.status == 1}">
				<div class="col-lg-4 col-md-6 col-sm-12 pb-1 product">
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
								class="fas fa-eye text-primary mr-1"></i>View Detail</a>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<!-- Shop Product End -->
