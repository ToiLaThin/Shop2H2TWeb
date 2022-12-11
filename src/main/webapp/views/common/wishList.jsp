<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@page import="shop.Services.Impl.AccountServicesImpl"%>
<div class="text-center mb-4 text-danger">
	<div class="display-1"><i class="fas fa-heart"></i></div>
	<h2 class="section-title px-5">
		<span class="px-2">Your Wishlist</span>
	</h2>
</div>
<c:if test="${productList.size() == 0 }">
	<div class="container-xxl py-1 text-center">
         <div class="row justify-content-center">
             <div class="col-lg-6">
                 <p class="mb-4">Empty. Would you like to add more product to wish list?</p>
                 <a class="btn btn-success rounded-pill py-3 px-5" href="<%=request.getContextPath() %>/common/home">Yes !!!</a>
             </div>
         </div>
     </div>
</c:if>
<c:if test="${productList.size() > 0 }">
	<%
		AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
		String username = (String) session.getAttribute("username");
		int accountId = accountServicesImpl.findAccountId(username);
	%>
	<div class="container mb-4">
		<div class="row">
			<div class="col-12">
				<div class="table-responsive">
					<table class="table table-striped  text-center mb-0">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">Product</th>
								<th scope="col" class="text-right">Price</th>
								<th scope="col">Column</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody class="align-middle">
							<c:forEach items="${productList}" var="product" varStatus="STT">
								<tr>
									<td><img src="${product.images }" width="50" height="50" /></td>
									<td>${product.productName }</td>
									<td class="text-right">${product.price}€</td>
									<td class="text-center">
										<a class="btn btn-sm btn-warning" href="<%=request.getContextPath() %>/common/buyNow?productId=${product.productId }">
										<i class="fa fa-shopping-cart"></i> 
										</a>
									</td>
									<td class="text-center">
										<a class="btn btn-sm btn-danger" href="<%=request.getContextPath() %>/common/wishList/delete?productId=${product.productId }&accountId=<%=accountId %>">
										<i class="fa fa-trash"></i> 
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container-xxl py-5">
			<div class="container px-lg-5 text-center">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<a class="btn btn-success rounded-pill py-3 px-5"
							href="<%=request.getContextPath()%>/common/home">Go Back To
							Home</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>


