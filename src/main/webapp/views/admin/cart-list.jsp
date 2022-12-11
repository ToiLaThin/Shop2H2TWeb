<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>

<h4>Cart Waiting</h4>
<table class="table table-bordered text-center mb-0">
	<thead class="text-dark bg-warning">
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
	<c:forEach items="${waitingCarts }" var="cart" varStatus="cartSTT">
		<tr>
			<td><a class="text-decoration-none" href="<%=request.getContextPath() %>/admin/cart/detail?cartId=${cart.cartId}">Cart${cart.cartId }</a></td>
			<td>User${cart.userId }</td>
			<td>${cart.buyDate }</td>
			<td>${cart.status }</td>
			<td>${cart.address }</td>
			<td>${cart.phoneNumber }</td>
			<td>
				<a class="btn btn-sm btn-danger" href="<%=request.getContextPath() %>/admin/cart/change/inValid?cartId=${cart.cartId}">Mark Invalid</a>
				<a class="btn btn-sm btn-success" href="<%=request.getContextPath() %>/admin/cart/change/valid?cartId=${cart.cartId}">Mark Valid</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
<br>

<h4>Cart Accepted</h4>
<table class="table table-bordered text-center mb-0">
	<thead class="text-dark bg-success">
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
	<c:forEach items="${validCarts }" var="cart" varStatus="cartSTT">
		<tr>
			<td><a class="text-decoration-none" href="<%=request.getContextPath() %>/admin/cart/detail?cartId=${cart.cartId}">Cart${cart.cartId }</a></td>
			<td>User${cart.userId }</td>
			<td>${cart.buyDate }</td>
			<td>${cart.status }</td>
			<td>${cart.address }</td>
			<td>${cart.phoneNumber }</td>
			<td>
				<a class="btn btn-sm btn-danger" href="<%=request.getContextPath() %>/admin/cart/change/inValid?cartId=${cart.cartId}">Mark Invalid</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
<br>

<h4>Cart Declined</h4>
<table class="table table-bordered text-center mb-0">
	<thead class="text-dark bg-danger">
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
	<c:forEach items="${inValidCarts }" var="cart" varStatus="cartSTT">
		<tr>
			<td><a class="text-decoration-none" href="<%=request.getContextPath() %>/admin/cart/detail?cartId=${cart.cartId}">Cart${cart.cartId }</a></td>
			<td>User${cart.userId }</td>
			<td>${cart.buyDate }</td>
			<td>${cart.status }</td>
			<td>${cart.address }</td>
			<td>${cart.phoneNumber }</td>
			<td>
				<a class="btn btn-sm btn-success" href="<%=request.getContextPath() %>/admin/cart/change/valid?cartId=${cart.cartId}">Mark Valid</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
<br>
<a class="btn btn-primary" href="<%=request.getContextPath() %>/common/home">Back</a>