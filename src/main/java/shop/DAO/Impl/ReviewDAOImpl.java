package shop.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.Connection.DbConnection;
import shop.DAO.IReviewDAO;
import shop.Models.AccountModel;
import shop.Models.ReviewModel;
import shop.Services.Impl.AccountServicesImpl;

public class ReviewDAOImpl extends DbConnection implements IReviewDAO{

	@Override
	public void insert(ReviewModel review) {
		String sql = "Insert Into Review(content,dateCreated,id_Review_Product,id_Review_Account) Values(?,?,?,?)";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, review.getContent());
			ps.setTimestamp(2, review.getDateCreated());
			ps.setInt(3, review.getIdProduct());
			ps.setInt(4, review.getIdAccount());
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
	public void edit(ReviewModel review) {
		String sql = "Update Review Set content=?,dateCreated=?,id_Review_Product=?,id_Review_Account=? where Review.reviewId=?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, review.getContent());
			ps.setTimestamp(2, review.getDateCreated());
			ps.setInt(3, review.getIdProduct());
			ps.setInt(4, review.getIdAccount());
			ps.setInt(5, review.getReviewId());
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
	public void delete(int reviewId) {
		String sql = "Delete From Review Where reviewId = ?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, reviewId);
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
	public List<ReviewModel> loadAllByProduct(int productId) {
		String sql = "Select * From Review Where id_Review_Product = ? Order By dateCreated Desc";	
		List<ReviewModel> reviews = new ArrayList<ReviewModel>();
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,productId);
			ResultSet rs = ps.executeQuery();
			AccountServicesImpl acccAccountServicesImpl = new AccountServicesImpl();
			while(rs.next())
			{
				ReviewModel review = new ReviewModel();
				review.setReviewId(rs.getInt("reviewId"));
				review.setContent(rs.getNString("content"));
				review.setDateCreated(rs.getTimestamp("dateCreated"));
				review.setIdProduct(rs.getInt("id_Review_Product"));
				int accountId = rs.getInt("id_Review_Account");
				review.setIdAccount(accountId);				
				AccountModel account = acccAccountServicesImpl.findById(accountId);
				review.setAccount(account);
				reviews.add(review);
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
		return reviews;
	}

	@Override
	public List<ReviewModel> loadAllByAccount(int accountId) {
		String sql = "Select * From Review Where id_Review_Account = ?";	
		List<ReviewModel> reviews = new ArrayList<ReviewModel>();
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,accountId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ReviewModel review = new ReviewModel();
				review.setReviewId(rs.getInt("reviewId"));
				review.setContent(rs.getNString("content"));
				review.setDateCreated(rs.getTimestamp("dateCreated"));
				review.setIdProduct(rs.getInt("id_Review_Product"));
				review.setIdAccount(rs.getInt("id_Review_Account"));
				reviews.add(review);
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
		return reviews;
	}

	@Override
	public List<ReviewModel> loadInitTenByProduct(int productId) {
		String sql = "Select Top 5 * From Review Where id_Review_Product = ? Order By dateCreated Desc";	
		List<ReviewModel> reviews = new ArrayList<ReviewModel>();
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,productId);
			ResultSet rs = ps.executeQuery();
			AccountServicesImpl acccAccountServicesImpl = new AccountServicesImpl();
			while(rs.next())
			{
				ReviewModel review = new ReviewModel();
				review.setReviewId(rs.getInt("reviewId"));
				review.setContent(rs.getNString("content"));
				review.setDateCreated(rs.getTimestamp("dateCreated"));
				review.setIdProduct(rs.getInt("id_Review_Product"));
				int accountId = rs.getInt("id_Review_Account");
				review.setIdAccount(accountId);				
				AccountModel account = acccAccountServicesImpl.findById(accountId);
				review.setAccount(account);
				reviews.add(review);
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
		return reviews;
	}

	@Override
	public List<ReviewModel> loadNextTenByProduct(int productId, int skipAmount) {
		String sql = "Select * From Review Where id_Review_Product = ? Order By dateCreated Desc Offset ? Rows Fetch Next 5 Rows Only";	
		List<ReviewModel> reviews = new ArrayList<ReviewModel>();
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,productId);
			ps.setInt(2, skipAmount);
			ResultSet rs = ps.executeQuery();
			AccountServicesImpl acccAccountServicesImpl = new AccountServicesImpl();
			while(rs.next())
			{
				ReviewModel review = new ReviewModel();
				review.setReviewId(rs.getInt("reviewId"));
				review.setContent(rs.getNString("content"));
				review.setDateCreated(rs.getTimestamp("dateCreated"));
				review.setIdProduct(rs.getInt("id_Review_Product"));
				int accountId = rs.getInt("id_Review_Account");
				review.setIdAccount(accountId);				
				AccountModel account = acccAccountServicesImpl.findById(accountId);
				review.setAccount(account);
				reviews.add(review);
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
		return reviews;
	}

}
