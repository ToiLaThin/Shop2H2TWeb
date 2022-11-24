package shop.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shop.Connection.DbConnection;
import shop.DAO.ICategoryDAO;
import shop.Models.CategoryModel;

public class CategoryDAOImpl extends DbConnection implements ICategoryDAO{

	@Override
	public List<CategoryModel> findAll() {
		List<CategoryModel> categories = new ArrayList<CategoryModel>();
		String sql = "Select * From Category";
		
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery() ;
			while(rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getNString("categoryName"));
				category.setImages(rs.getString("images"));
				category.setStatus(rs.getInt("status"));
				categories.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}

	@Override
	public void insertCategory(CategoryModel category) {
		String sql = "Insert Into Category(categoryName,images,status) Values(?,?,0)";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setString(2, category.getImages());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void editCategory(CategoryModel category) {
		String sql = "Update Category Set categoryName=?,images=? Where categoryId=?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setString(2, category.getImages());
			ps.setInt(3, category.getCategoryId());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteCategory(int categoryId) {
		String sql = "Delete From Category Where categoryId = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,categoryId);;
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CategoryModel find(int categoryId) {
		String sql = "Select * From Category Where categoryId = ?";		
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ResultSet rs = ps.executeQuery() ;
			while(rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getNString("categoryName"));
				category.setImages(rs.getString("images"));
				category.setStatus(rs.getInt("status"));
				return category;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
