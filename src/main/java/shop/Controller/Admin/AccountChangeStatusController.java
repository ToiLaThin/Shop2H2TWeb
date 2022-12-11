package shop.Controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Services.IAccountServices;
import shop.Services.Impl.AccountServicesImpl;



@WebServlet(urlPatterns = {"/admin/user/changestatus1","/admin/user/changestatus0"})
public class AccountChangeStatusController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IAccountServices accountServices =new AccountServicesImpl();
		int accountId=Integer.parseInt(req.getParameter("userid"));
		
		String url = req.getRequestURL().toString();
		if (url.contains("/admin/user/changestatus0")) {
			accountServices.changeStatus(accountId, 0);
		}
		if (url.contains("/admin/user/changestatus1")) {
			accountServices.changeStatus(accountId, 1);
		}

		RequestDispatcher rd = req.getRequestDispatcher("/admin/account/detail?accountId=" + accountId);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
