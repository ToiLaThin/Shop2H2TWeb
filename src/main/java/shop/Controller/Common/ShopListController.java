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
import javax.servlet.http.HttpSession;

import shop.Models.CategoryModel;
import shop.Models.ProductModel;
import shop.Models.StoreModel;
import shop.Services.IStoreServices;
import shop.Services.Impl.AccountServicesImpl;
import shop.Services.Impl.StoreServicesImpl;

@WebServlet(urlPatterns = {"/common/shop/list"})
public class ShopListController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	IStoreServices storeServices=new StoreServicesImpl();
	AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)  {
		List<StoreModel> storeList = storeServices.findAll();		
		req.setAttribute("storeList", storeList);
		RequestDispatcher rd = req.getRequestDispatcher("/views/common/shop-list.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}

