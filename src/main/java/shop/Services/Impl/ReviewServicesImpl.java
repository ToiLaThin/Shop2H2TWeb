package shop.Services.Impl;

import java.util.List;

import shop.DAO.Impl.ReviewDAOImpl;
import shop.Models.ReviewModel;
import shop.Services.IReviewServices;

public class ReviewServicesImpl implements IReviewServices{

	ReviewDAOImpl reviewDAOImpl = new ReviewDAOImpl();
	
	@Override
	public void insert(ReviewModel review) {
		reviewDAOImpl.insert(review);
	}

	@Override
	public void edit(ReviewModel review) {
		reviewDAOImpl.edit(review);
	}

	@Override
	public void delete(int reviewId) {
		reviewDAOImpl.delete(reviewId);
	}

	@Override
	public List<ReviewModel> loadAllByProduct(int productId) {
		return reviewDAOImpl.loadAllByProduct(productId);
	}

	@Override
	public List<ReviewModel> loadAllByAccount(int accountId) {
		return reviewDAOImpl.loadAllByAccount(accountId);
	}

	@Override
	public List<ReviewModel> loadInitTenByProduct(int productId) {
		return reviewDAOImpl.loadInitTenByProduct(productId);
	}

	@Override
	public List<ReviewModel> loadNextTenByProduct(int productId, int skipAmount) {
		return reviewDAOImpl.loadNextTenByProduct(productId, skipAmount);
	}
	
}
