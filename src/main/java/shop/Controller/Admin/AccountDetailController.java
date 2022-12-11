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
import shop.Services.Impl.AccountServicesImpl;
import shop.Services.Impl.ProductServicesImpl;



@WebServlet(urlPatterns = {"/admin/account/detail"})
public class AccountDetailController extends HttpServlet{
	ProductServicesImpl productService = new ProductServicesImpl();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IAccountServices accountServices=new AccountServicesImpl();
		int accountId= Integer.parseInt(req.getParameter("accountId"));
		AccountModel account=accountServices.findById(accountId);
		req.setAttribute("account", account);
		int sellerId = account.getSellerId();
		if(sellerId > 0)
		{
			List<ProductModel> productListOfSeller = productService.findAllBySellerId(sellerId);
			req.setAttribute("sellerId", sellerId);
			req.setAttribute("productListOfSeller", productListOfSeller);
		}
			
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/account-detail.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
