package shop.Models;

import java.sql.Date;

public class ProductModel {
	int productId;
	String productName;
	int productCode;
	int categoryId;
	String description;
	float price;	
	String images;
	int status;
	Date modifiedDate;
	int sellerId;
	int revenue;
	boolean isWished;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
		
	public int getRevenue() {
		return revenue;
	}
	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}
	
	/* phải bắt đầu bằng get nếu không sẽ không truy cập đc property */
	public boolean getIsWished() {
		return isWished;
	}
	public void setIsWished(boolean isWished) {
		this.isWished = isWished;
	}
	@Override
	public String toString() {
		return "ProductModel [productId=" + productId + ", productName=" + productName + ", productCode=" + productCode
				+ ", categoryId=" + categoryId + ", description=" + description + ", price=" + price + ", images="
				+ images + ", status=" + status + ", modifiedDate=" + modifiedDate + ", sellerId=" + sellerId
				+ ", revenue=" + revenue + ", isWished=" + isWished + "]";
	}
	
	
	
	
}
