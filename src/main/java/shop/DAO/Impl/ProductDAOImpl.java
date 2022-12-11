package shop.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.Connection.DbConnection;
import shop.DAO.IProductDAO;
import shop.Models.ProductModel;

public class ProductDAOImpl extends DbConnection implements IProductDAO{

	@Override
	public List<ProductModel> findAll() {
		List<ProductModel> products = new ArrayList<ProductModel>();
		String sql = "Select * From Product";
		Connection conn = null;
		//cột nào là số thì mặc định là 0
		//cột nào là String hoặc Date thì mặc định là null
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
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
	public ProductModel find(int productId) {
		String sql = "Select * From Product Where productId = ?";	
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,productId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getNString("productName"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setDescription(rs.getNString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setProductCode(rs.getInt("productCode"));
				product.setImages(rs.getNString("images"));
				product.setStatus(rs.getInt("status"));
				product.setModifiedDate(rs.getDate("modifiedDate"));
				product.setRevenue(rs.getInt("revenue"));
				product.setSellerId(rs.getInt("sellerId"));
				return product;				
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
	public List<ProductModel> findByCategory(int categoryId) {
		List<ProductModel> productsByCategory = new ArrayList<ProductModel>();
		String sql = "Select * From Product Where categoryId = ?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getNString("productName"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setDescription(rs.getNString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setProductCode(rs.getInt("productCode"));
				product.setImages(rs.getNString("images"));
				product.setStatus(rs.getInt("status"));
				product.setModifiedDate(rs.getDate("modifiedDate"));
				product.setSellerId(rs.getInt("sellerId"));
				productsByCategory.add(product);				
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
		return productsByCategory;
	}

	@Override
	public List<ProductModel> findAllBySellerId(int sellerId) {
		List<ProductModel> productsOfSeller = new ArrayList<ProductModel>();
		String sql = "Select * From Product Where sellerId = ?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getNString("productName"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setDescription(rs.getNString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setProductCode(rs.getInt("productCode"));
				product.setImages(rs.getNString("images"));
				product.setStatus(rs.getInt("status"));
				product.setModifiedDate(rs.getDate("modifiedDate"));
				product.setSellerId(rs.getInt("sellerId"));
				
				productsOfSeller.add(product);				
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
		return productsOfSeller;
	}

	@Override
	public void insertProduct(ProductModel product) {
		String sql = "Insert Into Product(productName,description,price,images,modifiedDate,sellerId,status,categoryId,revenue) Values(?,?,?,?,?,?,0,?,0)";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDescription());
			ps.setFloat(3, product.getPrice());
			ps.setString(4, product.getImages());
			ps.setDate(5, product.getModifiedDate());
			ps.setInt(6, product.getSellerId());
			ps.setInt(7, product.getCategoryId());
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
	public void deleteProduct(int productId) {
		String sql = "Delete From Product Where productId = ?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,Integer.toString(productId));
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
	public void editProduct(ProductModel product) {
		System.out.print("Đang cập nhật sản phẩm...");
		String sql = "Update Product set productName=?,description=?,price=?,images=?,modifiedDate=?,status=?,categoryId=?,revenue=? where Product.productId=?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDescription());
			ps.setFloat(3, product.getPrice());
			ps.setString(4, product.getImages());
			ps.setDate(5, product.getModifiedDate());
			
			ps.setInt(6, product.getStatus());
			ps.setInt(7, product.getCategoryId());
			ps.setInt(8, product.getRevenue());
			ps.setInt(9, product.getProductId());
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
	public int findProductId(ProductModel product) {
		String sql = "Select Top 1 productId From Product Where productName = ? And description = ? And price = ? And images = ? And modifiedDate = ? And sellerId = ?";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, product.getProductName());
			ps.setNString(2, product.getDescription());
			ps.setFloat(3, product.getPrice());
			ps.setNString(4, product.getImages());
			ps.setDate(5, product.getModifiedDate());
			ps.setInt(6, product.getSellerId());
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				return rs.getInt("productId");
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
		return 0;
	}

	@Override
	public List<ProductModel> findBySearch(String searchPhrase) {
		List<ProductModel> productsBySearch = new ArrayList<ProductModel>();
		String sql = "Select * From Product Where productName Like N'%" + searchPhrase + "%'";
		Connection conn = null;
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getNString("productName"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setDescription(rs.getNString("description"));
				product.setPrice(rs.getFloat("price"));
				product.setProductCode(rs.getInt("productCode"));
				product.setImages(rs.getNString("images"));
				product.setStatus(rs.getInt("status"));
				product.setModifiedDate(rs.getDate("modifiedDate"));
				product.setSellerId(rs.getInt("sellerId"));
				productsBySearch.add(product);				
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
		return productsBySearch;
	}

	@Override
	public List<ProductModel> loadInitNine(String orderBy) {
		List<ProductModel> products = new ArrayList<ProductModel>();
		String sql = "";
		
		if (orderBy.equals("modifiedDate"))
		{
			System.out.println("modifiedDate");
			sql = "Select Top 9 * From Product Order By modifiedDate Desc, productId";
		}
		else if(orderBy.equals("revenue"))
		{
			System.out.println("revenue");
			sql = "Select Top 9 * From Product Order By revenue Desc, productId";
		}
		else if(orderBy.equals("price"))
		{
			System.out.println("price");
			sql = "Select Top 9 * From Product Order By price, productId";
		}
		else
		{
			sql = "Select Top 9 * From Product";
		}
		Connection conn = null;
		//cột nào là số thì mặc định là 0
		//cột nào là String hoặc Date thì mặc định là null
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
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
	public List<ProductModel> loadNextNine(String orderBy, int skipAmount) {
		List<ProductModel> products = new ArrayList<ProductModel>();
		String sql = "";
		
		if (orderBy.equals("modifiedDate"))
		{
			System.out.println("modifiedDate");
			sql = "Select * From Product Order By modifiedDate Desc, productId Offset ? Rows Fetch Next 9 Rows Only";
		}
		else if(orderBy.equals("revenue"))
		{
			System.out.println("revenue");
			sql = "Select * From Product Order By revenue Desc, productId Offset ? Rows Fetch Next 9 Rows Only";
		}
		else if(orderBy.equals("price"))
		{
			System.out.println("price");
			sql = "Select * From Product Order By price, productId Offset ? Rows Fetch Next 9 Rows Only";
		}
		else
		{
			sql = "Select * From Product Offset ? Rows Fetch Next 9 Rows Only";
		}
		Connection conn = null;
		//cột nào là số thì mặc định là 0
		//cột nào là String hoặc Date thì mặc định là null
		try {
			conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, skipAmount);
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
	
	
	
}
