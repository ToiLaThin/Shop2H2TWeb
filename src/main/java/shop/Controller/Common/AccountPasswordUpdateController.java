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

@WebServlet(urlPatterns = {"/common/account/passwordUpdate"})
public class AccountPasswordUpdateController extends HttpServlet{

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

			String accountOldPassword = account.getPassword();			
			req.setAttribute("accountId", accountId);
			req.setAttribute("accountOldPassword", accountOldPassword);
			RequestDispatcher rd =req.getRequestDispatcher("/views/common/password-update.jsp");
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
			//edit product
			int accountId = Integer.parseInt(req.getParameter("accountId"));
			String accountOldPassword = req.getParameter("accountOldPassword");
			String retypeOldPassword = req.getParameter("retypeOldPassword");
			String accountNewPassword = req.getParameter("accountNewPassword");
			String retypeNewPassword = req.getParameter("retypeNewPassword");
			if(accountOldPassword.equals(retypeOldPassword))
			{
				if(accountNewPassword.equals(retypeNewPassword))
				{
					accountServicesImpl.changePassword(accountId, accountNewPassword);
					resp.sendRedirect(req.getContextPath() + "/common/home");
				}
			}
			else {
				resp.sendRedirect(req.getContextPath() + "/common/account/passwordUpdate?accountId=" + accountId);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
