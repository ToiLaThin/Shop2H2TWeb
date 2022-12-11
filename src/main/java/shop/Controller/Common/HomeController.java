package shop.Controller.Common;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.Models.CategoryModel;
import shop.Models.ProductModel;
import shop.Services.Impl.AccountServicesImpl;
import shop.Services.Impl.CategoryServicesImpl;
import shop.Services.Impl.ProductServicesImpl;
import shop.Services.Impl.WishListServicesImpl;

@WebServlet(urlPatterns= {"/common/home"})
public class HomeController extends HttpServlet{

	ProductServicesImpl productService = new ProductServicesImpl();
	CategoryServicesImpl categoryServicesImpl = new CategoryServicesImpl();
	AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
	WishListServicesImpl wishListServicesImpl = new WishListServicesImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductModel> productList = productService.findAll();
		//get curr accountId
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		if(username != null)
		{
			int accountId = accountServicesImpl.findAccountId(username);		
			req.setAttribute("accountId", accountId);
			//thêm isWished vào ProductModel
			//lặp qua tất cả product trong productList dùng wishListService kiểm tra và set is Wish
			for(ProductModel p : productList) {
				if(wishListServicesImpl.isInWishList(p.getProductId(), accountId))
				{
					p.setIsWished(true);
				}
				else {
					p.setIsWished(false);
				}
			}
		}
		/*
		 * List<ProductModel> top4CheapestProducts = productService.findCheapest();
		 * List<ProductModel> latestProducts = productService.findLatest();
		 * List<ProductModel> bestSellingProducts = productService.findBestSelling();
		 */
		req.setAttribute("productList", productList);
		List<CategoryModel> categories = categoryServicesImpl.findAll();
		req.setAttribute("categories", categories); 
		
		
		 
		/*
		 * req.setAttribute("top4CheapestProducts", top4CheapestProducts);
		 * req.setAttribute("latestProducts", latestProducts);
		 * req.setAttribute("bestSellingProducts", bestSellingProducts);
		 */		
		RequestDispatcher rd = req.getRequestDispatcher("/views/common/home.jsp");
		rd.forward(req, resp);
	}

	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductModel> productList = productService.findAll();
		//cần có đoạn code ngày giống doGet để nếu từ login vào thì vẫn có dữ liệu	
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			int accountId = accountServicesImpl.findAccountId(username);
			req.setAttribute("accountId", accountId);
			// thêm isWished vào ProductModel
			// lặp qua tất cả product trong productList dùng wishListService kiểm tra và set
			// is Wish
			for (ProductModel p : productList) {
				if (wishListServicesImpl.isInWishList(p.getProductId(), accountId)) {
					p.setIsWished(true);
				} else {
					p.setIsWished(false);
				}
			}
		}
		boolean accountDisabled = false;
		boolean orderSuccess = false;
		if(req.getAttribute("accountDisabled") != null) {
			accountDisabled = (boolean) req.getAttribute("accountDisabled");
		}
		if(req.getAttribute("orderSuccess") != null) {
			orderSuccess = (boolean) req.getAttribute("orderSuccess");
		}
		req.setAttribute("productList", productList);
		req.setAttribute("accountDisabled", accountDisabled);
		req.setAttribute("orderSuccess", orderSuccess);
		List<CategoryModel> categories = categoryServicesImpl.findAll();
		req.setAttribute("categories", categories); 
		RequestDispatcher rd = req.getRequestDispatcher("/views/common/home.jsp");
		rd.forward(req, resp);
	}	
	
	

}
