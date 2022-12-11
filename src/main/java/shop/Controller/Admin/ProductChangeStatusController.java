package shop.Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.ProductModel;
import shop.Services.IProductServices;
import shop.Services.Impl.ProductServicesImpl;

@WebServlet(urlPatterns = {"/admin/product/changestatus"})
public class ProductChangeStatusController extends HttpServlet{
	private static final long serialVersionUID = -1544634944957746011L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int productId= Integer.parseInt(req.getParameter("productId"));
		IProductServices productServices = new ProductServicesImpl();
		ProductModel product = productServices.find(productId);
		if (product.getStatus() == 1) {
			product.setStatus(0);
		}
		else {
			product.setStatus(1);
		}
		productServices.editProduct(product);
		
		RequestDispatcher rd = req.getRequestDispatcher("/common/home");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
