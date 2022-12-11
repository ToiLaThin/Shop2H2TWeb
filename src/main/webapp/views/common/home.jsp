<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@page import="shop.Services.Impl.AccountServicesImpl"%>

<!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Category Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Categories
                    <span class="btn btn-sm btn-light"><i class="fa fa-filter" type="button" data-toggle="collapse"
					data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"></i>
					</span>
					</h5>
                    <div class="collapse" id="collapseExample">
                    	<c:forEach items="${categories}" var="category" varStatus="Stt">
	                        <div class="custom-control d-flex align-items-center justify-content-between mb-3">
	                            <label class="custom-control-label">
		                            <a href="<%=request.getContextPath() %>/common/product/filter?categoryId=${category.categoryId }&categoryName=${category.categoryName}">
										${category.categoryName}
									</a>
								</label>
	                            <span class="badge border font-weight-normal">${category.categoryId }</span>
	                        </div>
                    	</c:forEach>                        
                    </div>
                </div>
                <!-- Category End -->
                
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="price-all">
                            <label class="custom-control-label" for="price-all">All Price</label>
                            <span class="badge border font-weight-normal">1000</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-1">
                            <label class="custom-control-label" for="price-1">$0 - $100</label>
                            <span class="badge border font-weight-normal">150</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-2">
                            <label class="custom-control-label" for="price-2">$100 - $200</label>
                            <span class="badge border font-weight-normal">295</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-3">
                            <label class="custom-control-label" for="price-3">$200 - $300</label>
                            <span class="badge border font-weight-normal">246</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-4">
                            <label class="custom-control-label" for="price-4">$300 - $400</label>
                            <span class="badge border font-weight-normal">145</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="price-5">
                            <label class="custom-control-label" for="price-5">$400 - $500</label>
                            <span class="badge border font-weight-normal">168</span>
                        </div>
                    </form>
                </div>
                <!-- Price End -->
                
                <!-- Color Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="color-all">
                            <label class="custom-control-label" for="price-all">All Color</label>
                            <span class="badge border font-weight-normal">1000</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-1">
                            <label class="custom-control-label" for="color-1">Black</label>
                            <span class="badge border font-weight-normal">150</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-2">
                            <label class="custom-control-label" for="color-2">White</label>
                            <span class="badge border font-weight-normal">295</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-3">
                            <label class="custom-control-label" for="color-3">Red</label>
                            <span class="badge border font-weight-normal">246</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="color-4">
                            <label class="custom-control-label" for="color-4">Blue</label>
                            <span class="badge border font-weight-normal">145</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="color-5">
                            <label class="custom-control-label" for="color-5">Green</label>
                            <span class="badge border font-weight-normal">168</span>
                        </div>
                    </form>
                </div>
                <!-- Color End -->

                <!-- Size Start -->
                <div class="mb-5">
                    <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="size-all">
                            <label class="custom-control-label" for="size-all">All Size</label>
                            <span class="badge border font-weight-normal">1000</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="size-1">
                            <label class="custom-control-label" for="size-1">XS</label>
                            <span class="badge border font-weight-normal">150</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="size-2">
                            <label class="custom-control-label" for="size-2">S</label>
                            <span class="badge border font-weight-normal">295</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="size-3">
                            <label class="custom-control-label" for="size-3">M</label>
                            <span class="badge border font-weight-normal">246</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="size-4">
                            <label class="custom-control-label" for="size-4">L</label>
                            <span class="badge border font-weight-normal">145</span>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="size-5">
                            <label class="custom-control-label" for="size-5">XL</label>
                            <span class="badge border font-weight-normal">168</span>
                        </div>
                    </form>
                </div>
                <!-- Size End -->
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
				<div class="row pb-3">
					<div class="col-12 pb-1">
						<div class="d-flex align-items-center justify-content-between mb-4">
							<c:url value="/common/product/search" var="productSearchControllerUrl"></c:url>
							<form role="form" action=${productSearchControllerUrl }	method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search for products" name="searchPhrase" required>
									<div class="input-group-append">
										<button type="submit" class="input-group-text bg-transparent text-primary">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</form>
														
							<!-- dung mỗi khi chọn thì 
							lấy value của option đã chọn chuyển cho api controller để order by
							id cho phần product thay vì append thì replace
							
							khi load more product thì cũng lấy value của option chuyển cho loadMore -->
							
							<div class="dropdown ml-4">
								Sort by: 
								<select id="sortBy" class="btn border dropdown-toggle">
									<option value="modifiedDate" default>Latest</option>
									<option value="revenue">Revenue</option>
									<option value="price">Price</option>
								</select>
								<!-- <button class="btn border dropdown-toggle" type="button"
									id="triggerId" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">Sort by</button>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="triggerId">
									<a class="dropdown-item" href="#">Latest</a> <a
										class="dropdown-item" href="#">Popularity</a> <a
										class="dropdown-item" href="#">Best Rating</a>
								</div> -->
							</div>
						</div>
					</div>
				</div>
				<%
					AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
					String username = (String) session.getAttribute("username");
					int accountId = accountServicesImpl.findAccountId(username);
				%>
				<div class="row" id="products">
					<c:forEach items="${productList }" var="product" varStatus="Stt">
						<c:if test="${product.status == 0}">
							<div class="col-lg-4 col-md-6 col-sm-12 pb-1 product">
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
											class="fas fa-eye text-primary mr-1"></i>View Detail
										</a> 
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
												class="far fa-heart text-primary mr-1"></i>Add To Wishlist
												</a>							
											</c:if>
											<c:if test="${product.isWished == true }">
												<!-- có thể đưa biến từ jsp tag vào chứ ko cần là attribute -->
												<a
												href="<%=request.getContextPath() %>/common/wishList/delete?productId=${product.productId }&accountId=<%=accountId %>"
												class="btn btn-sm text-dark p-0"><i
												class="fas fa-heart text-primary mr-1"></i>Wished 
												</a>							
											</c:if>
										</c:if>	
										<c:if test="${isLogin == false }">
											<a
											href="<%=request.getContextPath() %>/views/common/login.jsp"
											class="btn btn-sm text-dark p-0"><i
											class="far fa-heart text-primary mr-1"></i>Add To Wishlist
											</a>							
										</c:if>			
										<a
										href="<%=request.getContextPath() %>/common/cart?productId=${product.productId }&action=addToCart"
										class="btn btn-sm text-dark p-0"><i
										class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
										</a>
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
												href="<%=request.getContextPath()%>/views/common/login.jsp"
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
				<div class="col-12 pb-1">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center mb-3">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>
				</div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
	
<script type="text/javascript">
	window.onload = function() {
		let accountDisabled = ${accountDisabled};
		console.log(accountDisabled);
		console.log(typeof (accountDisabled));
		let orderSuccess = ${orderSuccess}		;
		console.log(orderSuccess);
		console.log(typeof (orderSuccess));

		if (accountDisabled === true) {
			alert("Đăng nhập thành công nhưng tài khoản đã bị khóa. Xin liên hệ admin");
		}
		if (orderSuccess === true) {
			alert("Đặt hàng thành công. Xin chờ admin duyệt hàng");
		}
	}		
</script>

<script>
	/* viet tach script ra thi ko loi ? */
	$('#sortBy').on('change',function() {		
		let orderBy = $(this).val();
		let isLogin = "${isLogin}";		
		var root = "${pageContext.request.contextPath}"
		$.ajax({
			url : root + "/common/product/sort", //send to Controller
			type : "get", //send it through get method
			data : {
				orderBy : orderBy,
				isLogin : isLogin
			},
			success : function(data) {
				$("#products").empty().append(data);
			},
			error : function(xhr) {
			}
		});
	});
</script>
<script>
		$(window).scroll(
				function() {
					if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
						loadMoreProduct();
					}});
		function loadMoreProduct() {
			/* tạo viên amount để Gọi và đếm classname là product */
			var amount = document.getElementsByClassName("product").length;
			console.log(amount);
			let orderBy = $('#sortBy').val();
			let isLogin = "${isLogin}";
			var root = "${pageContext.request.contextPath}"
			$.ajax({
				url : root + "/common/product/loadAjax", //send to Controller
				type : "get", //send it through get method
				data : {
					currProductsCount : amount,
					orderBy : orderBy,
					isLogin: isLogin
				},
				success : function(data) {
					$("#products").append(data);
					console.log("success");
				},
				error : function(xhr) {
				}
			});
		};
	</script>

	
