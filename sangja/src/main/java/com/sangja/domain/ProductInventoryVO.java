package com.sangja.domain;

public class ProductInventoryVO {
	private int prd_mng_num;
	private int ctgry_mng_num;
	private String ctgry_nm;
	private String prd_nm;
	private String prd_code;
	private int user_num;
	private String category;
	
	public int getPrd_mng_num() {
		return prd_mng_num;
	}
	public void setPrd_mng_num(int prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
	}
	public int getCtgry_mng_num() {
		return ctgry_mng_num;
	}
	public void setCtgry_mng_num(int ctgry_mng_num) {
		this.ctgry_mng_num = ctgry_mng_num;
	}
	public String getCtgry_nm() {
		return ctgry_nm;
	}
	public void setCtgry_nm(String ctgry_nm) {
		this.ctgry_nm = ctgry_nm;
	}
	public String getPrd_nm() {
		return prd_nm;
	}
	public void setPrd_nm(String prd_nm) {
		this.prd_nm = prd_nm;
	}
	public String getPrd_code() {
		return prd_code;
	}
	public void setPrd_code(String prd_code) {
		this.prd_code = prd_code;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	private String user_nm;
	private int qty;
	
}
