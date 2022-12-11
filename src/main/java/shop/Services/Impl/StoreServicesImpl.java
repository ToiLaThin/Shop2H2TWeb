package shop.Services.Impl;

import java.sql.Date;
import java.util.List;

import shop.DAO.Impl.StoreDAOImpl;
import shop.Models.ProductModel;
import shop.Models.StoreModel;
import shop.Services.IStoreServices;

public class StoreServicesImpl implements IStoreServices{

	StoreDAOImpl storeDAOImpl = new StoreDAOImpl();
	
	@Override
	public void insertStore(String storeName, Date storeDate) {
		storeDAOImpl.insertStore(storeName, storeDate);
	}

	@Override
	public int findStoreId(String storeName) {
		return storeDAOImpl.findStoreId(storeName);
	}

	@Override
	public List<StoreModel> findAll() {
		return storeDAOImpl.findAll();

	}

	@Override
	public List<ProductModel> findAllProduct(int storeId) {
		return storeDAOImpl.findAllProduct(storeId);

	}

	@Override
	public StoreModel findStore(int storeId) {
		return storeDAOImpl.findStore(storeId);
	}

	@Override
	public List<StoreModel> findBySearch(String searchPhrase) {
		return storeDAOImpl.findBySearch(searchPhrase);
	}

}
