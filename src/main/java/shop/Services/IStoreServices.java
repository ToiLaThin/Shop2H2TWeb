package shop.Services;

import java.sql.Date;
import java.util.List;

import shop.Models.ProductModel;
import shop.Models.StoreModel;

public interface IStoreServices {
	void insertStore(String storeName, Date storeDate);
	int findStoreId(String storeName);
	List<StoreModel> findAll();
	List<ProductModel> findAllProduct(int storeId);
	StoreModel findStore(int storeId);
	List<StoreModel> findBySearch(String searchPhrase);
}
