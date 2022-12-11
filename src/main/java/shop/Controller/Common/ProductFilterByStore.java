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
import shop.Models.StoreModel;
import shop.Services.IStoreServices;
import shop.Services.Impl.AccountServicesImpl;
import shop.Services.Impl.CategoryServicesImpl;
import shop.Services.Impl.ProductServicesImpl;
import shop.Services.Impl.StoreServicesImpl;
import shop.Services.Impl.WishListServicesImpl;

@WebServlet(urlPatterns= {"/common/product/filterByStore"})
public class ProductFilterByStore extends HttpServlet{
	ProductServicesImpl productService = new ProductServicesImpl();
	AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
	WishListServicesImpl wishListServicesImpl = new WishListServicesImpl();
	IStoreServices storeServiceImp= new StoreServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int storeId =  Integer.parseInt(req.getParameter("storeId"));
		List<ProductModel> productList = storeServiceImp.findAllProduct(storeId);
		StoreModel store = storeServiceImp.findStore(storeId);
		req.setAttribute("store", store);
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		if(username != null)
		{
			int accountId = accountServicesImpl.findAccountId(username);		
			req.setAttribute("accountId", accountId);
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
		req.setAttribute("productList", productList);		
		RequestDispatcher rd = req.getRequestDispatcher("/views/common/product-filterStore.jsp");
		rd.forward(req, resp);
	}

	private static final long serialVersionUID = 1L;	

}
