package shop.Controller.Common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.AccountModel;
import shop.Services.Impl.AccountServicesImpl;

@WebServlet(urlPatterns = {"/common/account/profileUpdate"})
public class AccountProfileUpdateController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	AccountServicesImpl accountServicesImpl = new AccountServicesImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		try {
			int accountId = Integer.parseInt(req.getParameter("accountId"));
			AccountModel account = accountServicesImpl.findById(accountId);

			req.setAttribute("accountId", accountId);
			req.setAttribute("account", account);			
			
			RequestDispatcher rd =req.getRequestDispatcher("/views/common/profile-update.jsp");
			rd.forward(req, resp);			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		try {
			AccountModel account = new AccountModel();
			account.setUserId(Integer.parseInt(req.getParameter("accountId")));
			account.setFullname(req.getParameter("accountFullname"));
			account.setEmail(req.getParameter("accountEmail"));
			account.setPhone((String)req.getParameter("accountPhone"));
			account.setImages(req.getParameter("accountImages"));
			
			accountServicesImpl.changeProfile(account);
			resp.sendRedirect(req.getContextPath() + "/common/account/profileUpdate?accountId=" + account.getUserId());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
