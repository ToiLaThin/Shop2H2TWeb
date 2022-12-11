package shop.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.Connection.DbConnection;
import shop.DAO.IWishListDAO;

public class WishListDAOImpl extends DbConnection implements IWishListDAO{

	@Override
	public void insertToWishList(int productId, int accountId) {
		String sql = "Insert Into WishList(id_WishList_Account,id_WishList_Product) Values(?,?)";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			ps.setInt(2, productId);
			ps.executeUpdate();
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
		
	}

	@Override
	public void deleteFromWishList(int productId, int accountId) {
		String sql = "Delete From WishList Where id_WishList_Account = ? And id_WishList_Product = ?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			ps.setInt(2, productId);
			ps.executeUpdate();
		} catch (Exception e) {
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
	public boolean isInWishList(int productId, int accountId) {
		boolean isInWishList = false;
		Connection conn = null;
		try {
			String sql = "Select * From WishList Where id_WishList_Account = ? And id_WishList_Product = ?";
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			ps.setInt(2, productId);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				isInWishList = true;
			else
				isInWishList = false;						
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
		
		return isInWishList;
	}

	@Override
	public List<Integer> findAllProductId(int accountId) {
		List<Integer> productIdList = new ArrayList<Integer>();
		Connection conn = null;
		try {
			String sql = "Select id_WishList_Product From WishList Where id_WishList_Account = ?";
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				productIdList.add(rs.getInt("id_WishList_Product"));
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
		return productIdList;
	}
	

}
