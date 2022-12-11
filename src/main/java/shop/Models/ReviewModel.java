package shop.Models;

import java.sql.Timestamp;

public class ReviewModel {
	int reviewId;
	String content;
	Timestamp dateCreated;
	int idAccount;
	int idProduct;
	AccountModel account;
	
	public AccountModel getAccount() {
		return account;
	}
	public void setAccount(AccountModel account) {
		this.account = account;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}
	public int getIdAccount() {
		return idAccount;
	}
	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	@Override
	public String toString() {
		return "ReviewModel [reviewId=" + reviewId + ", content=" + content + ", dateCreated=" + dateCreated
				+ ", idAccount=" + idAccount + ", idProduct=" + idProduct + ", account=" + account + "]";
	}
	
}
