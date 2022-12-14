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

import shop.Models.CartItemModel;
import shop.Models.ProductModel;
import shop.Models.ReviewModel;
import shop.Services.Impl.AccountServicesImpl;
import shop.Services.Impl.InventoryServicesImpl;
import shop.Services.Impl.ProductServicesImpl;
import shop.Services.Impl.ReviewServicesImpl;

@WebServlet(urlPatterns = {"/common/product/detail"})
public class ProductDetailController extends HttpServlet{
		
	private static final long serialVersionUID = 1L;
	
	ProductServicesImpl productServicesImpl = new ProductServicesImpl();
	InventoryServicesImpl inventoryServicesImpl = new InventoryServicesImpl();
	ReviewServicesImpl reviewServicesImpl = new ReviewServicesImpl();
	AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get current user images
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		String accountImages = accountServicesImpl.findById(accountServicesImpl.findAccountId(username)).getImages();
		req.setAttribute("accountImages", accountImages);
		
		int productId = Integer.parseInt(req.getParameter("productId")); 
		ProductModel product = productServicesImpl.find(productId);		
		req.setAttribute("product", product); 
		//lay so luong hang nay trong kho
		int productAmountInInventory = inventoryServicesImpl.findAmount(productId);
		if(productAmountInInventory == -1)
			productAmountInInventory = 0;
		
		
		List<CartItemModel> cart = (List<CartItemModel>) session.getAttribute("cart");
		int productQuantityInCart;
		if(cart != null)
		{
			int productIndexInCart = isExisting(productId, cart);
			//ch??? l???y quantity ra ch???a kh??ng thay ?????i quantity product trong cart
			if (productIndexInCart == -1) {
				productQuantityInCart = 0;
			} else {
				productQuantityInCart = cart.get(productIndexInCart).getQuantity();
			}			
		} else {
			productQuantityInCart = 0;
		}
		int allReviewCount = reviewServicesImpl.loadAllByProduct(productId) .size();
		List<ReviewModel> reviews = reviewServicesImpl.loadInitTenByProduct(productId);
		req.setAttribute("reviewCount", allReviewCount);
		req.setAttribute("reviews", reviews);
		req.setAttribute("productAmountInInventory", productAmountInInventory);
		req.setAttribute("productQuantityInCart", productQuantityInCart);
		RequestDispatcher rd = req.getRequestDispatcher("/views/common/product.jsp");
		rd.forward(req, resp);
	}
	
	
	private int isExisting(int productId, List<CartItemModel> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getProductId() == productId) {
				return i;
			}
		}
		return -1;
	}
	
}
