<%@page import="shop.Services.Impl.AccountServicesImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${product.productName}</title>
</head>
<body>
	<!--  Breadcumb -->
	<div class="container-fluid">
	    <div class="row">
	        <div class="col">
	            <nav aria-label="breadcrumb">
	                <ol class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/common/home">Home</a></li>
	                    <li class="breadcrumb-item"><a href="category.html">Category</a></li>
	                    <li class="breadcrumb-item active" aria-current="page">Product</li>
	                </ol>
	            </nav>
	        </div>
	    </div>
	</div>
	
	<!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img src="${product.images }" alt="Image" width="719" height="435">
                        </div>
                        <div class="carousel-item">
                            <img src="${product.images }" alt="Image" width="719" height="435">
                        </div>
                        <div class="carousel-item">
                            <img src="${product.images }" alt="Image" width="719" height="435">
                        </div>
                        <div class="carousel-item">
                            <img src="${product.images }" alt="Image" width="719" height="435">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-secondary"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-secondary"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold">${product.productName }</h3>
                <c:if test="${ userRole.equalsIgnoreCase('admin')}">
					<small class="mb-4 text-muted">Created On: ${product.modifiedDate} </small>
				</c:if>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(50 Reviews)</small>
                </div>
                <div class="d-flex">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
                <h3 class="font-weight-semi-bold mb-1">$${product.price }</h3>
				<c:if test="${ userRole.equalsIgnoreCase('admin')}">
					<span class="mb-1">Trang thái: </span>
					<c:if test="${ product.status==1}">
						<span class="mb-1">Bị vô hiệu hóa</span>
						<br>
						<br>
					</c:if>
					<c:if test="${ product.status==0}">
						<span class="mb-1">Được phép bán</span>	
						<br>
					</c:if>
				</c:if>
				<c:if test="${ userRole.equalsIgnoreCase('admin')}">
					<a class="btn btn-secondary btn-sm"
						href="<%=request.getContextPath() %>/admin/product/changestatus?productId=${product.productId }">
						Change status </a>
					<br>
					<br>
				</c:if>
				<div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                    <form>                        
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-2" name="size">
                            <label class="custom-control-label" for="size-2">S</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-3" name="size">
                            <label class="custom-control-label" for="size-3">M</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-4" name="size">
                            <label class="custom-control-label" for="size-4">L</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-5" name="size">
                            <label class="custom-control-label" for="size-5">XL</label>
                        </div>
                    </form>
                </div>
				<div class="form-group d-flex mb-3">
					<label class="text-dark font-weight-medium mb-0 mr-3" for="colors">Color:
					</label> <select class="custom-select" id="colors">
						<option selected>Select</option>
						<option value="1">Blue</option>
						<option value="2">Red</option>
						<option value="3">Green</option>
					</select>
				</div>
				<c:if test="${ product.status==0}">
				<p>Quantity in your cart:</p>
				<div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group mr-3" style="width: 130px;">                    	
                        <div class="input-group-btn">
                            <button class="btn btn-danger" onclick="func_SubtractProductQuantityByOne()">
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input id="quantity" type="text" class="form-control bg-secondary text-center" name="quantity" min="0" max="${productAmountInInventory }"
										value="${productQuantityInCart }">
                        <div class="input-group-btn">
                            <button class="btn btn-success" onclick="func_AddProductQuantityByOne()">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <button class="btn btn-primary px-3 text-uppercase" id="updateProductQuantityBtn"
									onclick="func_changeProductQuantityInCart()">
						<i class="fa fa-shopping-cart mr-1"></i> Update To Cart
					</button>
                </div>
                </c:if>
                
                <div class="datasheet p-3 mb-2 bg-info text-white">
                    <a href="" class="text-white"><i class="fa fa-file-text"></i> Download DataSheet</a>
                </div>
                <div class="product_rassurance">
                    <ul class="list-inline">
                        <li class="list-inline-item"><i class="fa fa-truck fa-2x"></i><br/>Fast delivery</li>
                        <li class="list-inline-item"><i class="fa fa-credit-card fa-2x"></i><br/>Secure payment</li>
                        <li class="list-inline-item"><i class="fa fa-phone fa-2x"></i><br/>+33 1 22 54 65 60</li>
                    </ul>
                </div>
                <div class="reviews_product mb-2 ">
                    3 reviews
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    (4/5)
                    <a class="pull-right" href="#reviews">View all reviews</a>
                </div>
                	
            </div>
        </div>
        
		<!-- Products Start -->
		<div class="container-fluid py-5">
	        <div class="text-center mb-4">
	            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
	        </div>
	        <div class="row px-xl-5">
	            <div class="col">
	                <div class="owl-carousel related-carousel">
	                    <div class="card product-item border-0">
	                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                            <img class="img-fluid w-100" src="<%=request.getContextPath() %>/img/product-1.jpg" alt="">
	                        </div>
	                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
	                            <div class="d-flex justify-content-center">
	                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
	                            </div>
	                        </div>
	                        <div class="card-footer d-flex justify-content-between bg-light border">
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
	                        </div>
	                    </div>
	                    <div class="card product-item border-0">
	                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                            <img class="img-fluid w-100" src="<%=request.getContextPath() %>/img/product-2.jpg" alt="">
	                        </div>
	                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
	                            <div class="d-flex justify-content-center">
	                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
	                            </div>
	                        </div>
	                        <div class="card-footer d-flex justify-content-between bg-light border">
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
	                        </div>
	                    </div>
	                    <div class="card product-item border-0">
	                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                            <img class="img-fluid w-100" src="<%=request.getContextPath() %>/img/product-3.jpg" alt="">
	                        </div>
	                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
	                            <div class="d-flex justify-content-center">
	                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
	                            </div>
	                        </div>
	                        <div class="card-footer d-flex justify-content-between bg-light border">
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
	                        </div>
	                    </div>
	                    <div class="card product-item border-0">
	                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                            <img class="img-fluid w-100" src="<%=request.getContextPath() %>/img/product-4.jpg" alt="">
	                        </div>
	                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
	                            <div class="d-flex justify-content-center">
	                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
	                            </div>
	                        </div>
	                        <div class="card-footer d-flex justify-content-between bg-light border">
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
	                        </div>
	                    </div>
	                    <div class="card product-item border-0">
	                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                            <img class="img-fluid w-100" src="<%=request.getContextPath() %>/img/product-5.jpg" alt="">
	                        </div>
	                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                            <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
	                            <div class="d-flex justify-content-center">
	                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
	                            </div>
	                        </div>
	                        <div class="card-footer d-flex justify-content-between bg-light border">
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    	<!-- Products End -->
    
	    <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>                    
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${reviewCount})</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p>${product.description }</p>
                    </div>
                    
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6" id="reviews">
                                <h4 class="mb-4">${reviewCount} review for ${product.productName }</h4>
                                <c:forEach items="${reviews}" var="review" varStatus="Stt">
                                <div class="media mb-4 review">
                                	<c:if test="${review.account.images == null }">
                                    	<img src="<%=request.getContextPath()%>/img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;height: 50px;">
                                    </c:if>
                                	<c:if test="${review.account.images != null }">
                                    	<img src="${review.account.images }" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                    </c:if>
                                    <div class="media-body">
                                        <h6>${review.account.username}<small> - <i>${review.dateCreated}</i></small></h6>
                                        <div class="text-primary mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                        <p>${review.content}.</p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="col-md-6">
                            	<c:if test="${username != null }">
									<c:set var="isLogin" value="true" />
								</c:if>
								<c:if test="${username == null }">
									<c:set var="isLogin" value="false" />
								</c:if>
								<c:if test="${isLogin == false }">
									<div>
										<small>You currently are not logged in.<a
											href="<%=request.getContextPath()%>/views/common/login.jsp">Log
												In</a> to make review ?
										</small>
									</div>
								</c:if>
								
								<c:if test="${isLogin == true }">
									<c:url value="/common/review/insert" var="reviewControllerUrl"></c:url>
	                                <h4 class="mb-4">Leave a review</h4>
	                                <small>Your email address will not be published. Required fields are marked *</small>
									
									<div class="d-flex my-3">
	                                    <p class="mb-0 mr-2">Your Rating * :</p>
	                                    <div class="text-primary">
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                    </div>
	                                </div>
	                                <form method="post" action="${reviewControllerUrl}" id="myReviewCreate">
	                                    <div class="form-group">
	                                    	<c:if test="${accountImages == null }">
	                                    		<img src="<%=request.getContextPath()%>/img/user.jpg" class="rounded-circle border-1 border-dark" width="75" height="75" />
	                                    	</c:if>
	                                    	<c:if test="${accountImages != null }">
	                                    		<img src="${accountImages }" class="rounded-circle border-1 border-dark" width="75" height="75" />
	                                    	</c:if>
	                                        <label for="message"><b>${username}</b> 's review *</label>
											<%
												String username;
												int yourAccountId;
												username = (String) session.getAttribute("username");
												AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
												yourAccountId = accountServicesImpl.findAccountId(username);
												out.println("<input type='hidden' value='" + yourAccountId + "' name='accountId'/>");
											%>

											<input type="hidden" value="${product.productId }" name="productId"/>
	                                        <textarea id="message" name="yourReviewContent" cols="30" rows="5" class="form-control" style="resize:none;" placeholder="Bạn đang nghĩ gì về sản phẩm này?" required></textarea>
	                                    </div>                                    
	                                    <div class="form-group mb-0">
	                                        <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
	                                    </div>
	                                </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	<!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
    
	<script>
		$(window).scroll(
				function() {
					if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
						loadMore();
					}});
		function loadMore() {
			/* tạo viên amount để Gọi và đếm classname là product */
			var amount = document.getElementsByClassName("review").length;
			var productId = ${product.productId};
			var root = "${pageContext.request.contextPath}"
			$.ajax({
				url : root + "/common/review/loadAjax", //send to Controller
				type : "get", //send it through get method
				data : {
					currReviewsCount : amount,
					productId : productId
				},
				success : function(data) {
					$("#reviews").append(data);
				},
				error : function(xhr) {
				}
			});
		};
	</script>
	<script>
		let maxQuantityInt = parseInt(document.getElementById("quantity").max,10);
		let minQuantityInt = parseInt(document.getElementById("quantity").min,10);
		const func_AddProductQuantityByOne = function() {
			const element = document.getElementById("quantity");
			let quantityString = element.value;
			let quantityInt = parseInt(quantityString, 10) + 1;
			if (quantityInt > maxQuantityInt) {
				alert("Hết hàng")
			} else {
				element.value = quantityInt;				
			}
		}
		const func_SubtractProductQuantityByOne = function() {
			const element = document.getElementById("quantity");
			let quantityString = element.value;
			let quantityInt = parseInt(quantityString, 10) - 1;			
			if (quantityInt < minQuantityInt) {
				alert("Số lượng không hợp lệ");
			} else {
				element.value = quantityInt;				
			}
		}

		const func_changeProductQuantityInCart = function() {
			var changedProductQuantityInCart = document
					.getElementById("quantity").value;
			if (changedProductQuantityInCart > 0) {
				var pId = ${product.productId};
				console.log("Hello");
				var root = "${pageContext.request.contextPath}"
				window.location.href = root + "/common/cart?productId=" + pId
						+ "&action=updateToCart&productQuantity="
						+ changedProductQuantityInCart;
			} else {
				alert("Chưa mua hàng");
			}
		};
	</script>
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
</body>
</html>