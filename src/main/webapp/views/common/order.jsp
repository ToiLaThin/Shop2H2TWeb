<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!-- Checkout Start -->
    <div class="container-fluid pt-5">
    	<c:url value="/common/order" var="checkoutControllerUrl"></c:url>
    	<form method="post" action="${checkoutControllerUrl }">
        <div class="row px-xl-5">
            <section class="col-lg-8">
                <div class="mb-4 collapse" id="shipping-address">
                    <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text" placeholder="John">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text" placeholder="Doe">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="example@email.com">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No *</label>
                            <input class="form-control" type="text" name="phoneNumber" placeholder="Ex: 0928354635" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Deliver Address *</label>
                            <input class="form-control" type="text" placeholder="123 Street" name="address" required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 2</label>
                            <input class="form-control" type="text" placeholder="123 Street">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <select class="custom-select">
                                <option selected>United States</option>
                                <option>England</option>
                                <option>Japan</option>
                                <option>Viet Nam</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP Code</label>
                            <input class="form-control" type="text" placeholder="123">
                        </div>                        
                        <div class="col-md-12 form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="shipto">
                                <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Ship to different address</label>
                            </div>
                        </div>
                    </div>
                </div>
                
            </section>
            <section class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Products</h5>
						<c:set var="finalPrice" value="0" />
						<c:forEach items="${cart }" var="cartItem" varStatus="Stt">
							<c:set var="productQuantityPrice" value="${cartItem.product.price*cartItem.quantity}" />
							<c:set var="finalPrice"	value="${finalPrice + productQuantityPrice }" />
							<div class="d-flex justify-content-between">
								<p>${cartItem.product.productName }(${cartItem.product.price }$ x ${cartItem.quantity})</p>
								<p><c:out value = "${productQuantityPrice}"/>$</p>
							</div>
						</c:forEach>					
						<hr class="mt-0">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium"><c:out value="${finalPrice}" /></h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">$10</h6>
						</div>
				</div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><c:out value="${finalPrice + 10}"/>$</h5>
                        </div>
					<%
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
						String currDate = java.time.LocalDateTime.now().format(formatter);
						out.print("<div class='d-flex justify-content-between mt-2'>" +
	                            "<h5 class='text-muted'>Date</h5>" +
	                            "<h5 class='text-muted'>" + currDate + "</h5>" +
	                        "</div>" +
	                    "</div>");
					%>
					
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Payment</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal">
                                <label class="custom-control-label" for="paypal" data-toggle="collapse" data-target="#shipping-address">Paypal</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                <label class="custom-control-label" for="directcheck" data-toggle="collapse" data-target="#shipping-address">Direct Check</label>
                            </div>
                        </div>
                        <div class="">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                <label class="custom-control-label" for="banktransfer" data-toggle="collapse" data-target="#shipping-address">Bank Transfer</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</button>
                        <a type="button" class="btn btn-lg btn-block btn-secondary font-weight-bold my-3 py-3" href="<%=request.getContextPath() %>/common/home">Back</a>
                    </div>
                </div>
            </section>
        </div>
        </form>
    </div>
    <!-- Checkout End -->

<script type="text/javascript">
	window.onload = function() {
		let outOfProduct = ${outOfProduct};
		console.log(outOfProduct);
		console.log(typeof(outOfProduct));
		
		if(outOfProduct === true)
		{
			alert("Không còn sản phẩm trong kho nên không thể mua ngay");
			let root = "${pageContext.request.contextPath}"				
			window.location.href = root + "/common/home";
		}
	}
</script>	