package shop.Controller.Common;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.ProductModel;
import shop.Models.ReviewModel;
import shop.Services.Impl.ReviewServicesImpl;

@WebServlet(urlPatterns = {"/common/review/insert"})
public class ReviewInsertController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	ReviewServicesImpl reviewServicesImpl = new ReviewServicesImpl();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
		try {
			//edit product			
			ReviewModel reviewCreated = new ReviewModel();
			int productId = Integer.parseInt(req.getParameter("productId"));
			int accountId = Integer.parseInt(req.getParameter("accountId"));
			reviewCreated.setIdAccount(accountId);
			reviewCreated.setIdProduct(productId);
			reviewCreated.setContent(req.getParameter("yourReviewContent"));
			
	        Timestamp dateCreated = new Timestamp(new java.util.Date().getTime());
	        reviewCreated.setDateCreated(dateCreated);
			
	        reviewServicesImpl.insert(reviewCreated);
	        resp.sendRedirect(req.getContextPath() + "/common/product/detail?productId=" + productId);
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getRequestURI());
		}
		
	}
	
	

}
