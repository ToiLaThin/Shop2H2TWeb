package shop.Controller.Common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.ProductModel;
import shop.Services.Impl.ProductServicesImpl;
import shop.Services.Impl.WishListServicesImpl;

@WebServlet(urlPatterns = {"/common/wishList/insert","/common/wishList/delete","/common/wishList/listProduct"})
public class WishListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	WishListServicesImpl wishListServicesImpl = new WishListServicesImpl();
	ProductServicesImpl productServicesImpl = new ProductServicesImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		if (url.contains("wishList/insert")) {
			int productId = Integer.parseInt(req.getParameter("productId"));
			int accountId = Integer.parseInt(req.getParameter("accountId"));
			wishListServicesImpl.insertToWishList(productId, accountId);
			RequestDispatcher rd = req.getRequestDispatcher("/common/home");
			rd.forward(req, resp);
		}
		else if(url.contains("wishList/delete")) {
			int productId = Integer.parseInt(req.getParameter("productId"));
			int accountId = Integer.parseInt(req.getParameter("accountId"));
			wishListServicesImpl.deleteFromWishList(productId, accountId);
			RequestDispatcher rd = req.getRequestDispatcher("/common/home");
			rd.forward(req, resp);
		}
		else if(url.contains("wishList/listProduct")) {
			int accountId = Integer.parseInt(req.getParameter("accountId"));
			List<Integer> productIdList = wishListServicesImpl.findAllProductId(accountId);
			List<ProductModel> productList = new ArrayList<ProductModel>();
			for(int productId : productIdList) {
				productList.add(productServicesImpl.find(productId));
			}
			
			req.setAttribute("productList", productList);
			RequestDispatcher rd = req.getRequestDispatcher("/views/common/wishList.jsp");
			rd.forward(req, resp);
		}
		
	}
	
	

}
