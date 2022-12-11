<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ page import="shop.Models.CartItemModel" %>
<%@ page import="shop.Services.Impl.InventoryServicesImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<div class="text-center mb-4 text-danger">
	<h2 class="section-title px-5">
		<span class="px-2">Cart${cartId }</span>
	</h2>
</div>
<div class="container mb-4">
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table table-bordered text-center mb-0">
					<thead class="bg-secondary text-dark">
						<tr>
							<th>Products</th>
							<th>Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>

						</tr>
					</thead>
					
					<c:set var = "finalPrice" value = "0"/>
					<tbody class="align-middle">
						<c:forEach items="${cartItems }" var="cartItem" varStatus="STT">
							<tr>
								<td class="align-middle">
									<img src="${cartItem.product.images }" width="50" height="50" />
								</td>
								<td class="align-middle">${cartItem.product.productName }</td>
								<td class="align-middle">${cartItem.product.price}€</td>

								<td class="align-middle">${cartItem.quantity}</td>
								<td class="align-middle">${cartItem.product.price * cartItem.quantity }</td>
								<c:set var = "finalPrice" value = "${finalPrice + cartItem.product.price * cartItem.quantity }"/>
							</tr>
						</c:forEach>
						
						<tr>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"></td>
							<td class="align-middle"><b class="text-danger">Total</b></td>
							<td class="align-middle"><b class="text-success"><c:out value = "${finalPrice}"/>$</b></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
