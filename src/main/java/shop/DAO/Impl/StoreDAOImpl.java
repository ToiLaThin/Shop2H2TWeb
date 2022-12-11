package shop.DAO.Impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.Connection.DbConnection;
import shop.DAO.IStoreDAO;
import shop.Models.ProductModel;
import shop.Models.StoreModel;

public class StoreDAOImpl extends DbConnection implements IStoreDAO{

	@Override
	public void insertStore(String storeName, Date storeDate) {
		Connection conn = null;
		try {
			String sql = "Insert Into Store(storeName,storeDate) Values (?,?)";
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, storeName);			
			ps.setDate(2, storeDate);			
			ps.executeUpdate();			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally  {           
	        if ( conn != null )
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}  
		}
	}

	@Override
	public int findStoreId(String storeName) {
		Connection conn = null;
		try {
			//2 là user mặc định sau khi đăng ký có role là user
			String sql = "Select storeId From Store Where storeName = ?";
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, storeName);			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt("storeId");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally  {           
	        if ( conn != null )
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}  
		}
		return 0;
	}

	@Override
	public List<StoreModel> findAll() {
		List<StoreModel> stores = new ArrayList<StoreModel>();
		String sql = "Select * From Store";
		Connection conn = null;
		//cột nào là số thì mặc định là 0
		//cột nào là String hoặc Date thì mặc định là null
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setName(rs.getNString("storeName"));
				store.setStoreDate(rs.getDate("storeDate"));
				stores.add(store);				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally  {           
	        if ( conn != null )
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}  
		}
		return stores;
	}

	@Override
	public List<ProductModel> findAllProduct(int storeId) {
		List<ProductModel> products = new ArrayList<ProductModel>();
		String sql = "Select * From Product Inner Join Inventory on Product.productId=Inventory.id_Inventory_Product where id_Inventory_Store=? ";
		
		
		Connection conn = null;
		//cột nào là số thì mặc định là 0
		//cột nào là String hoặc Date thì mặc định là null
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,storeId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId")); 
				product.setProductName(rs.getNString("productName"));
				product.setCategoryId(rs.getInt("categoryId")); 
				product.setDescription(rs.getNString("description"));
				product.setPrice(rs.getFloat("price"));				
				product.setImages(rs.getNString("images"));
				product.setStatus(rs.getInt("status"));
				product.setModifiedDate(rs.getDate("modifiedDate"));
				product.setRevenue(rs.getInt("revenue"));
				products.add(product);				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally  {           
	        if ( conn != null )
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}  
		}
		return products;
	}

	@Override
	public StoreModel findStore(int storeId) {
		String sql = "Select * From Store Where storeId=?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,storeId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setName(rs.getNString("storeName"));
				store.setStoreDate(rs.getDate("storeDate"));
				return store;		
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally  {           
	        if ( conn != null )
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}  
		}
		return null;
	}

	@Override
	public List<StoreModel> findBySearch(String searchPhrase) {
		List<StoreModel> stores = new ArrayList<StoreModel>();
		String sql = "Select * From Store Where storeName Like N'%" + searchPhrase + "%'";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setName(rs.getNString("storeName"));
				store.setStoreDate(rs.getDate("storeDate"));
				stores.add(store);				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally  {           
	        if ( conn != null )
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}  
		}
		return stores;
	}

}
