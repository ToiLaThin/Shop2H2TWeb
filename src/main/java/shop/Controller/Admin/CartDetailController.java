package shop.Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.AccountModel;
import shop.Models.ProductModel;
import shop.Services.IAccountServices;
import shop.Services.ICartItemServices;
import shop.Services.ICartServices;
import shop.Services.Impl.AccountServicesImpl;
import shop.Services.Impl.CartItemServicesImpl;
import shop.Services.Impl.CartServicesImpl;

@WebServlet(urlPatterns = {"/admin/cart/detail"})
public class CartDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ICartServices cartServices= new CartServicesImpl();
		ICartItemServices cartItemServices= new CartItemServicesImpl();
		int cartId= Integer.parseInt(req.getParameter("cartId"));
		req.setAttribute("cartId", cartId);
		req.setAttribute("cartItems", cartItemServices.findAllByCartId(cartId));
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/cart-detail.jsp");
		rd.forward(req, resp);
	}
}
