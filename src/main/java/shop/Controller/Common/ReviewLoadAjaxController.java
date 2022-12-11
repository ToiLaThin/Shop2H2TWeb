package shop.Controller.Common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.Models.ReviewModel;
import shop.Services.Impl.ReviewServicesImpl;

@WebServlet(urlPatterns = {"/common/review/loadAjax"})
public class ReviewLoadAjaxController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	ReviewServicesImpl reviewServicesImpl = new ReviewServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String skipAmount = req.getParameter("currReviewsCount");
		int skipAmountInt = Integer.parseInt(skipAmount);
		int productId = Integer.parseInt(req.getParameter("productId"));
		List<ReviewModel> nextTenReviews = reviewServicesImpl.loadNextTenByProduct(productId, skipAmountInt);
		PrintWriter out = resp.getWriter();
		for (ReviewModel r : nextTenReviews) {
			out.println("<div class='media mb-4 review'>\r\n"
					+ "                                    <img src='" + req.getContextPath() + "/img/user.jpg' alt='Image' class='img-fluid mr-3 mt-1' style='width: 45px;'>\r\n"
					+ "                                    <div class='media-body'>\r\n"
					+ "                                        <h6>" + r.getAccount().getUsername() + "<small> - <i>" + r.getDateCreated() + "</i></small></h6>\r\n"
					+ "                                        <div class='text-primary mb-2'>\r\n"
					+ "                                            <i class='fas fa-star'></i>\r\n"
					+ "                                            <i class='fas fa-star'></i>\r\n"
					+ "                                            <i class='fas fa-star'></i>\r\n"
					+ "                                            <i class='fas fa-star-half-alt'></i>\r\n"
					+ "                                            <i class='far fa-star'></i>\r\n"
					+ "                                        </div>\r\n"
					+ "                                        <p>" + r.getContent() + ".</p>\r\n"
					+ "                                    </div>\r\n"
					+ "                                </div>");
		}
	}
	

}
