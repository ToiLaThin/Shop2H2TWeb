<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ page import="shop.Models.CartItemModel" %>
<%@ page import="shop.Services.Impl.InventoryServicesImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<c:if test="${cart == null }">
	<!-- 404 Start -->
        <div class="container-xxl py-5">
            <div class="container px-lg-5 text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
                        <h1 class="mb-4">Cart is empty</h1>
                        <p class="mb-4">We’re sorry, the page you have looked for does not exist in our website! Maybe go to our home page or try to use a search?</p>
                        <a class="btn btn-primary rounded-pill py-3 px-5" href="<%=request.getContextPath() %>/common/home">Go Back To Home</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 404 End -->
</c:if>
<c:if test="${cart.size() == 0 }">
	<!-- 404 Start -->
        <div class="container-xxl py-5">
            <div class="container px-lg-5 text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
                        <h1 class="mb-4">Cart is empty</h1>
                        <p class="mb-4">We’re sorry, the page you have looked for does not exist in our website! Maybe go to our home page or try to use a search?</p>
                        <a class="btn btn-primary rounded-pill py-3 px-5" href="<%=request.getContextPath()%>/common/home">Go Back To Home</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 404 End -->
</c:if>
<c:if test="${cart != null && cart.size() > 0}">	
	<!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                       	<!-- tag declare chỉ chạy 1 lần -->
                    	<%! float totalPrice; %>
                    	<%               
                    		totalPrice = 0;
                    		List<CartItemModel> cart = (List<CartItemModel>)session.getAttribute("cart");
                    		for(CartItemModel cartItem: cart) {                    			
                    			int quantity = cartItem.getQuantity();
                    			float productPricePerUnit = cartItem.getProduct().getPrice();
                    			totalPrice += quantity * productPricePerUnit;	                    			
                    		}
                    	%>
                    	<c:forEach items="${cart }" var="cartItem" varStatus="STT">
                        <tr>
                            <td class="align-middle"><img src="${cartItem.product.images }" width="50" height="50"/> ${cartItem.product.productName }</td>
                            <td class="align-middle">${cartItem.product.price} €</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <!-- <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div> -->
                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${cartItem.quantity}">
                                    <!-- <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div> -->
                                </div>
                            </td>
                            <td class="align-middle">${cartItem.product.price * cartItem.quantity }</td>
                            <td class="align-middle"><a class="btn btn-sm btn-danger" href="<%=request.getContextPath() %>/common/cart?action=remove&productId=${cartItem.product.productId}"><i class="fa fa-trash"></i></a></td>
                        </tr>
                        </c:forEach>
                                                
                    </tbody>
                </table>
                
            </div>
            <div class="col-lg-4">
                <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium"><%=totalPrice %></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">6,90 €</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><%=totalPrice+6.90 %> €</h5>
                        </div>
                        <c:if test="${isLogin != null }">
		               	<c:set var = "isLogin" value = "false"/>
		               	<c:set var = "username" value = '${session.getAttribute("username") }'/>                    
		               	</c:if>
		               	<c:if test="${username != null }">
		                    <c:set var = "isLogin" value = "true"/>
		               	</c:if>
		               	<c:if test="${username == null }">
		                    <c:set var = "isLogin" value = "false"/>
		               	</c:if>
		               	<c:if test="${isLogin == true }">
		                    <a class="btn btn-block btn-primary my-3 py-3" href='<%=request.getContextPath() %>/common/order'>Order</a>
		               	</c:if>
		               	<c:if test="${isLogin == false }">
		                    <a class="btn btn-block btn-primary my-3 py-3" href='<%=request.getContextPath() %>/views/common/login.jsp'>Order</a>
		               	</c:if>
		               	<a class="btn btn-block btn-light  my-3 py-3" href="<%=request.getContextPath() %>/common/home">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->
</c:if>

<script type="text/javascript">
	window.onload = function() {
		let outOfProduct = ${outOfProduct};
		console.log(outOfProduct);
		console.log(typeof(outOfProduct));
		
		if(outOfProduct === true)
			{
				alert("Không còn hàng trong kho");
				let root = "${pageContext.request.contextPath}"				
				window.location.href = root + "/common/home";
			}
	}
</script>
