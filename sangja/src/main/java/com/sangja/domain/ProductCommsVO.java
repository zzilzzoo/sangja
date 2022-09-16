package com.sangja.domain;

import java.util.List;

public class ProductCommsVO {

	private int chb = 0;
	private int prd_mng_num = 0;
	private int user_num = 0;
	private String user_id;
	private String user_nm_f;
	private double comms_rate = 0;
	private String editor;

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public int getPrd_mng_num() {
		return prd_mng_num;
	}

	public void setPrd_mng_num(int prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
	}

	public double getComms_rate() {
		return comms_rate;
	}

	public void setComms_rate(double comms_rate) {
		this.comms_rate = comms_rate;
	}

	private List<ProductCommsVO> productCommsList;

	public List<ProductCommsVO> getProductCommsList() {
		return productCommsList;
	}

	public void setProductCommsList(List<ProductCommsVO> productCommsList) {
		this.productCommsList = productCommsList;
	}

	public String getUser_nm_f() {
		return user_nm_f;
	}

	public void setUser_nm_f(String user_nm_f) {
		this.user_nm_f = user_nm_f;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getChb() {
		return chb;
	}

	public void setChb(int chb) {
		this.chb = chb;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

}
