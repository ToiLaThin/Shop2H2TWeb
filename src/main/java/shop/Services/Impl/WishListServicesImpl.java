package shop.Services.Impl;

import java.util.List;

import shop.DAO.Impl.WishListDAOImpl;
import shop.Services.IWishListServices;

public class WishListServicesImpl implements IWishListServices{

	WishListDAOImpl wishListDAOImpl = new WishListDAOImpl();
	
	@Override
	public void insertToWishList(int productId, int accountId) {
		wishListDAOImpl.insertToWishList(productId, accountId);
	}

	@Override
	public void deleteFromWishList(int productId, int accountId) {
		wishListDAOImpl.deleteFromWishList(productId, accountId);
	}

	@Override
	public boolean isInWishList(int productId, int accountId) {
		return wishListDAOImpl.isInWishList(productId, accountId);
	}

	@Override
	public List<Integer> findAllProductId(int accountId) {
		return wishListDAOImpl.findAllProductId(accountId);
	}

}
