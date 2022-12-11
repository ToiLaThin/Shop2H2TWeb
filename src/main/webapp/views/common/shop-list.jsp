<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="shop.Services.Impl.AccountServicesImpl"%>
<!-- Shop Start -->
<div class="container mb-4">
	<div class="row">
		<div class="col-12">
			<!-- Shop Product Start -->
			<div class="row pb-3">
				<div class="col-4 pb-1 float-right">
					<form action="<%=request.getContextPath()%>/common/shop/search" method="post" role="form">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Tìm kiếm cửa hàng" name="searchPhrase" required>
							<div class="input-group-append">
								<button type="submit" class="input-group-text bg-transparent text-primary">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="container-fluid pt-5">
					<div class="row px-xl-5">
						<div class="col-lg-12 table-responsive mb-5">
							<table class="table table-bordered text-center mb-0">
								<thead class="bg-secondary text-dark">
									<tr>
										<th>Tên shop</th>
										<th>Ngày thành lập</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody class="align-middle">

									<c:forEach items="${storeList}" var="store" varStatus="STT">
										<tr>
											<td class="align-middle">${store.name}</td>
											<td class="align-middle">${store.storeDate}</td>
											<td class="align-middle"><a
												href="<%=request.getContextPath() %>/common/product/filterByStore?storeId=${store.storeId}">
													Xem sản phẩm </a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- Shop Product End -->
		</div>
	</div>
</div>
<!-- Shop End -->



