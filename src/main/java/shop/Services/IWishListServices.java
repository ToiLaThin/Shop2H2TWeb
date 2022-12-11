package shop.Services;

import java.util.List;

public interface IWishListServices {
	void insertToWishList(int productId,int accountId);
	void deleteFromWishList(int productId,int accountId);
	boolean isInWishList(int productId,int accountId);
	
	List<Integer> findAllProductId(int accountId);
}
