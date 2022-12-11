package shop.Controller.Common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.ProductModel;
import shop.Services.Impl.ProductServicesImpl;

@WebServlet(urlPatterns = {"/common/product/sort"})
public class ProductSortController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	ProductServicesImpl productService = new ProductServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderBy = req.getParameter("orderBy");
		String isLogin = req.getParameter("isLogin");
		List<ProductModel> productList = productService.loadInitNine(orderBy);
		PrintWriter out = resp.getWriter();
		for (ProductModel product : productList) {
			if(product.getStatus() == 0)
			{
				out.println("<div class='col-lg-4 col-md-6 col-sm-12 pb-1 product'>\r\n"
						+ "								<div class='card product-item border-0 mb-4'>\r\n"
						+ "									<div\r\n"
						+ "										class='card-header product-img position-relative overflow-hidden bg-transparent border p-0'>\r\n"
						+ "										<img class='' src='" + product.getImages() + "' alt=''\r\n"
						+ "											style='width: 100%;' height='360'>\r\n"
						+ "									</div>\r\n"
						+ "									<div\r\n"
						+ "										class='card-body border-left border-right text-center p-0 pt-4 pb-3'>\r\n"
						+ "										<h6 class='text-truncate mb-3'>" + product.getProductName() + "</h6>\r\n"
						+ "										<div class='d-flex justify-content-center'>\r\n"
						+ "											<h6>" + product.getPrice() + "</h6>\r\n"
						+ "											<h6 class='text-muted ml-2'>\r\n"
						+ "												<del>" + product.getPrice() + "$ </del>\r\n"
						+ "											</h6>\r\n"
						+ "										</div>\r\n"
						+ "									</div>\r\n"
						+ "									<div\r\n"
						+ "										class='card-footer d-flex justify-content-between bg-light border'>\r\n"
						+ "										<a\r\n"
						+ "											href='<%=request.getContextPath() %>/common/product/detail?productId=" + product.getProductId() + "'\r\n"
						+ "											class='btn btn-sm text-dark p-0'><i\r\n"
						+ "											class='fas fa-eye text-primary mr-1'></i>View Detail</a> <a\r\n"
						+ "											href='<%=request.getContextPath() %>/common/cart?productId=" + product.getProductId() + "&action=addToCart'\r\n"
						+ "											class='btn btn-sm text-dark p-0'><i\r\n"
						+ "											class='fas fa-shopping-cart text-primary mr-1'></i>Add To Cart</a>\r\n"
						+ "									</div>\r\n"
						+ "									<div\r\n"
						+ "										class='card-footer d-flex justify-content-between bg-light border'>");
				if(isLogin == "true") {
					out.println("<a\r\n"
							+ "												href='<%=request.getContextPath() %>/common/buyNow?productId=${product.productId }'\r\n"
							+ "												class='btn btn-block text-dark p-0'><i\r\n"
							+ "												class='fas fa-shopping-cart text-primary mr-1'></i>Buy now</a>");
				}
				else {
					out.println("<a\r\n"
							+ "												href='<%=request.getContextPath()%>/views/common/login.jsp'\r\n"
							+ "												class='btn btn-block text-dark p-0'><i\r\n"
							+ "												class='fas fa-shopping-cart text-primary mr-1'></i>Buy now</a>");
				}
				out.println("</div>\r\n"
						+ "								</div>\r\n"
						+ "							</div>");
			}
			else if(product.getStatus() == 1)
			{
				out.println("<div class='col-lg-4 col-md-6 col-sm-12 pb-1 product'>\r\n"
						+ "								<div class='card product-item border-0 mb-4 bg-secondary'>\r\n"
						+ "									<div\r\n"
						+ "										class='card-header product-img position-relative overflow-hidden bg-transparent border p-0'>\r\n"
						+ "										<img class='' src='" + product.getImages() + "' alt=''\r\n"
						+ "											style='width: 100%;' height='360'>\r\n"
						+ "									</div>\r\n"
						+ "									<div\r\n"
						+ "										class='card-body border-left border-right text-center p-0 pt-4 pb-3'>\r\n"
						+ "										<h6 class='text-truncate mb-3'>" + product.getProductName() + "</h6>\r\n"
						+ "										<div class='d-flex justify-content-center'>\r\n"
						+ "											<h6 class='text-muted ml-2'>Locked</h6>\r\n"
						+ "										</div>\r\n"
						+ "									</div>\r\n"
						+ "									<div\r\n"
						+ "										class='card-footer d-flex justify-content-between bg-light border'>\r\n"
						+ "										<a\r\n"
						+ "											href='<%=request.getContextPath() %>/common/product/detail?productId=" + product.getProductId() + "'\r\n"
						+ "											class='btn btn-sm text-dark p-0'><i\r\n"
						+ "											class='fas fa-eye text-primary mr-1'></i>View Detail</a>\r\n"
						+ "									</div>\r\n"
						+ "								</div>\r\n"
						+ "							</div>");
			}
		}
		
	}
	
	

}
