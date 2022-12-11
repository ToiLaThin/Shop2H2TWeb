<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
 <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="text-center mb-4">
	            <h2 class="section-title px-5"><span class="px-2">Product of category: ${categoryName} </span></h2>
	        </div>
			

            <!-- Shop Product Start -->
            <div class="col-lg-12 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="container-fluid mb-4 clearfix">                            
                            <div class="dropdown ml-4 float-right">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sort by
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="#">Latest</a>
                                    <a class="dropdown-item" href="#">Popularity</a>
                                    <a class="dropdown-item" href="#">Best Rating</a>
                                </div>
                            </div>
                        </div>
                    </div>
               	</div>
				<div class="row">
					<c:forEach items="${productsByCategory }" var="product"
						varStatus="Stt">
						<c:if test="${product.status == 0}">
							<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
								<div class="card product-item border-0 mb-4">
									<div
										class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
										<img style="width:100%; height:254px;" src="${product.images }">
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
									<div
										class="card-footer d-flex justify-content-between bg-light border">
										<a
											href="<%=request.getContextPath() %>/common/product/detail?productId=${product.productId }"
											class="btn btn-sm text-dark p-0"><i
											class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a
											href="<%=request.getContextPath() %>/common/cart?productId=${product.productId }&action=addToCart"
											class="btn btn-sm text-dark p-0"><i
											class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
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
											<a
												href="<%=request.getContextPath() %>/views/common/login.jsp"
												class="btn btn-block text-dark p-0"><i
												class="fas fa-shopping-cart text-primary mr-1"></i>Buy now</a>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${product.status == 1}">
							<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
								<div class="card product-item border-0 mb-4 bg-secondary">
									<div
										class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
										<img style="width:100%; height:254px;" src="${product.images }">
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
        </div>
    </div>
    <!-- Shop End -->
	
	
