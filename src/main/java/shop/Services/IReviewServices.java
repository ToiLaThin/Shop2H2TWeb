package shop.Services;

import java.util.List;

import shop.Models.ReviewModel;

public interface IReviewServices {
	void insert(ReviewModel review);
	void edit(ReviewModel review);
	void delete(int reviewId);
	List<ReviewModel> loadAllByProduct(int productId);
	List<ReviewModel> loadAllByAccount(int accountId);
	List<ReviewModel> loadInitTenByProduct(int productId);
	List<ReviewModel> loadNextTenByProduct(int productId, int skipAmount);
}
