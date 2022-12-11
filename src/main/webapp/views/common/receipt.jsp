<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>

<h4>Cart Waiting</h4>
<table class="table table-warning text-center mb-0">
	<thead class="text-dark">
		<tr>
			<th>CartId</th>
			<th>UserId</th>
			<th>Buy Date</th>
			<th>Status</th>
			<th>Address</th>
			<th>PhoneNumber</th>
		</tr>
	</thead>
	<tbody class="align-middle">
	<c:forEach items="${waitingCartsOfUser }" var="cart" varStatus="cartSTT">
		<tr>
			<td>Cart${cart.cartId }</td>
			<td>User${cart.userId }</td>
			<td>${cart.buyDate }</td>
			<td>${cart.status }</td>
			<td>${cart.address }</td>
			<td>${cart.phoneNumber }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
<br>

<h4>Cart Accepted</h4>
<table class="table table-success text-center mb-0">
	<thead class="text-dark">
		<tr>
			<th>CartId</th>
			<th>UserId</th>
			<th>Buy Date</th>
			<th>Status</th>
			<th>Address</th>
			<th>PhoneNumber</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody class="align-middle">
	<c:forEach items="${validCartsOfUser }" var="cart" varStatus="cartSTT">
		<tr>
			<td>Cart${cart.cartId }</td>
			<td>User${cart.userId }</td>
			<td>${cart.buyDate }</td>
			<td>${cart.status }</td>
			<td>${cart.address }</td>
			<td>${cart.phoneNumber }</td>
			<td>
				<a class="btn btn-sm btn-danger" href="<%=request.getContextPath() %>/common/order/checkout?cartId=${cart.cartId}&buyDate=${cart.buyDate}">Checkout</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
<br>

<!-- receipt co the xem chi tiet duoc -->
<h4>Receipts</h4>
<table class="table table-danger text-center mb-0">
	<thead class="text-dark">
		<tr>
			<th>receiptId</th>
			<th>releaseDate</th>
			<th>cartId</th>		
			<th>Action</th>	
		</tr>
	</thead>
	<tbody class="align-middle">
	<c:forEach items="${receiptsOfUser }" var="receipt" varStatus="receiptSTT">
		<tr>
			<td>Receipt${receipt.receiptId }</td>
			<td>${receipt.releaseDate }</td>
			<td>${receipt.cartId }</td>
			<td><a class="btn btn-sm btn-warning" href="<%=request.getContextPath() %>/common/order/detail?cartId=${receipt.cartId}&receiptId=${receipt.receiptId}">View</a></td>
		</tr>
	</c:forEach>
 	</tbody>
</table>
<br>
<br>
<a class="btn btn-primary" href="<%=request.getContextPath() %>/common/home">Back</a>

<script type="text/javascript">
	window.onload = function() {
		let isOutOfOneProduct = ${isOutOfOneProduct};
		console.log(isOutOfOneProduct);
		console.log(typeof(isOutOfOneProduct));
		
		if(isOutOfOneProduct  === true)
			{
				alert("Có một mặt hàng bạn đặt đã hết xin đợi tới khi hàng về");
				/* let root = "${pageContext.request.contextPath}"				
				window.location.href = root + "/common/home"; */
			}
	}
</script>