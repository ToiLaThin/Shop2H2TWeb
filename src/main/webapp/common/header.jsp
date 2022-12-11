<%@page import="shop.Services.Impl.AccountServicesImpl"%>
<%@page import="shop.Services.Impl.CategoryServicesImpl"%>
<%@page import="shop.Services.Impl.WishListServicesImpl"%>
<%@page import="shop.Models.CategoryModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ page import="shop.Models.CartItemModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
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
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
            </div>
            <c:url value="/common/product/search" var="productSearchControllerUrl"></c:url>
            <div class="col-lg-6 col-6 text-left">
                <form role="form" action=${productSearchControllerUrl } method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products" name="searchPhrase" required>
                        <div class="input-group-append">
                            <button type="submit" class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <%!int cartSize;%>
            <%
            	AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
                List<CartItemModel> cart = (List<CartItemModel>) session.getAttribute("cart");
                if (cart != null) {
                	cartSize = cart.size();
                } else
                	cartSize = 0;
                String rootPath = request.getContextPath();
                String registerPageUrl = rootPath + "/views/common/register.jsp";
                String emptyRole = "";
                String username = (String) session.getAttribute("username");
                String userRole = (String) session.getAttribute("userRole");
                int accountId = accountServicesImpl.findAccountId(username);
                String logoutPageUrl = rootPath + "/common/logout";
                String accountPasswordUpdateUrl = rootPath + "/common/account/passwordUpdate?accountId=" + accountId;
                String accountProfileUpdateUrl = rootPath + "/common/account/profileUpdate?accountId=" + accountId;
                String wishListUrl = rootPath + "/common/wishList/listProduct?accountId=" + accountId;
                
                /* code for wishlist count */
                int wishListSize;
                WishListServicesImpl wishListServicesImpl = new WishListServicesImpl();
                List<Integer> productIdList = wishListServicesImpl.findAllProductId(accountId);
    			wishListSize = productIdList.size();
    			
            %>
            <div class="col-lg-3 col-6 text-right">
                <a href="<%=request.getContextPath() %>/common/wishList/listProduct?accountId=<%=accountId%>" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge"><%=wishListSize%></span>
                </a>
                <a href="<%=request.getContextPath() %>/common/cart" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge"><%=cartSize%></span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">                        
	                <%
	                	CategoryServicesImpl categoryService = new CategoryServicesImpl();
		                List<CategoryModel> categories = categoryService.findAll();
		                for(CategoryModel category : categories) {
		                	out.print("<a href='" + request.getContextPath() + "/common/product/filter?categoryId=" + category.getCategoryId() + "&categoryName=" + category.getCategoryName() + "' class='nav-item nav-link'>"
							+ category.getCategoryName() + "</a>");						
		                }
		            %>                                         
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a class="nav-item nav-link" href="<%=request.getContextPath() %>/common/home">Home <span class="sr-only">(current)</span></a>
                            <c:if test="${ userRole.equalsIgnoreCase('admin')}">
 								<a class="nav-item nav-link" href="<%=request.getContextPath() %>/admin/category/list">Categories</a>                            
 							</c:if>
                            <%-- <a href="<%=request.getContextPath() %>/user/product/list" class="nav-item nav-link">Product</a> --%>
                            <a href="<%=request.getContextPath() %>/common/cart" class="nav-item nav-link">Cart</a>
 							<a class="nav-item nav-link" href="<%=request.getContextPath() %>/common/shop/list">Shop <span class="sr-only"></span></a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="<%=request.getContextPath() %>/views/common/about.jsp" class="dropdown-item">About Us</a>                                    
                                </div>
                            </div>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
						<c:if test="${ userRole != emptyRole && username != null}">
							<div class="nav-item dropdown">
								<a
									class="nav-link dropdown-toggle" id="navbarScrollingDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="false"
									href="<%=request.getContextPath()%>/user/cart"> <i
										class="fa fa-user"></i> ${userRole } ${username}
								</a>
								<ul class="dropdown-menu"
									aria-labelledby="navbarScrollingDropdown">
									<c:if test="${ userRole.equalsIgnoreCase('admin')}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/admin/cart/list">
											Order management </a>
									</c:if>
									<c:if test="${ userRole.equalsIgnoreCase('admin')}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/admin/UAPManage">
											User and Product Management </a>
									</c:if>
									<c:if test="${ userRole.equalsIgnoreCase('user')}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/views/user/registerSeller.jsp">
											Open Shop </a>
									</c:if>
									<c:if test="${ userRole.equalsIgnoreCase('seller')}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/seller/home"> My Shop
										</a>
									</c:if>
									<a class="dropdown-item"
										href="<%=request.getContextPath()%>/common/receipt/list">Orders
										and receipts </a>
									<li><hr class='dropdown-divider'></li>
									<%
									out.print("<a href='" + logoutPageUrl + "' class='dropdown-item'>Logout</a>");
									out.print("<a href='" + registerPageUrl + "' class='dropdown-item'>Register</a>");
									out.print("<a href='" + accountPasswordUpdateUrl + "' class='dropdown-item'>Change password</a>");
									out.print("<a href='" + accountProfileUpdateUrl + "' class='dropdown-item'>Profile</a>");
									out.print("<a href='" + wishListUrl + "' class='dropdown-item'>Wishlist</a>");
									%>
								</ul>
							</div>
						</c:if>
						<c:if test="${ userRole == emptyRole && username == null}">
							<div class="nav-item dropdown">
								<a
									class="nav-link dropdown-toggle"
									id="secondNavBarScrollingDropdown" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"
									href="<%=request.getContextPath()%>/user/cart"> <i
										class="fa fa-gear fa-lg mr-1 ml-2"></i>
								</a>
								<ul class="dropdown-menu"
									aria-labelledby="secondNavBarScrollingDropdown">
									<%
									String loginPageUrl = rootPath + "/views/common/login.jsp";
									out.print("<a href='" + loginPageUrl + "' class='dropdown-item'>Login</a>");
									out.print("<a href='" + registerPageUrl + "' class='dropdown-item'>Register</a>");									
									%>
								</ul>
							</div>
						</c:if>
					</div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->