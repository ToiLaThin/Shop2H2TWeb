package shop.DAO;

import java.util.List;

import shop.Models.ReviewModel;

public interface IReviewDAO {
	void insert(ReviewModel review);
	void edit(ReviewModel review);
	void delete(int reviewId);
	List<ReviewModel> loadAllByProduct(int productId);
	List<ReviewModel> loadInitTenByProduct(int productId);
	List<ReviewModel> loadAllByAccount(int accountId);
	List<ReviewModel> loadNextTenByProduct(int productId, int skipAmount);
	
}
