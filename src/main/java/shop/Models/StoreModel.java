package shop.Models;

import java.sql.Date;

public class StoreModel {
private int storeId;
private String name;
private Date storeDate;
public int getStoreId() {
	return storeId;
}
public void setStoreId(int storeId) {
	this.storeId = storeId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Date getStoreDate() {
	return storeDate;
}
public void setStoreDate(Date storeDate) {
	this.storeDate = storeDate;
}
}
