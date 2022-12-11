package shop.Controller.Seller;

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
import shop.Services.Impl.CategoryServicesImpl;
import shop.Services.Impl.ProductServicesImpl;


@WebServlet(urlPatterns= {"/seller/home"})
public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ProductServicesImpl productService = new ProductServicesImpl();
	CategoryServicesImpl categoryServicesImpl = new CategoryServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int sellerId = (int) session.getAttribute("sellerId");
		List<ProductModel> productListOfSeller = productService.findAllBySellerId(sellerId);
		req.setAttribute("productListOfSeller", productListOfSeller);
		List<CategoryModel> categories = categoryServicesImpl.findAll();
		req.setAttribute("categories", categories); 
		RequestDispatcher rd = req.getRequestDispatcher("/views/seller/home.jsp");
		rd.forward(req, resp);
	}
	
}
