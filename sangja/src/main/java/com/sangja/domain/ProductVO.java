package com.sangja.domain;

public class ProductVO {
	/*
	 * CREATE TABLE `tbl_product` ( `prd_mng_num` int(11) NOT NULL AUTO_INCREMENT,
	 * `ctgry_mng_num` int(11) NOT NULL, `prd_nm` varchar(100) NOT NULL, `prd_code`
	 * varchar(50) DEFAULT NULL, `prd_dscp` varchar(1000) DEFAULT NULL, `upc_code`
	 * varchar(50) DEFAULT NULL, `sale_status` varchar(10) DEFAULT 'Active',
	 * `unit_price` int(11) DEFAULT '0', `cost_price` int(11) DEFAULT '0', `prd_qty`
	 * int(11) DEFAULT '0', `editor` varchar(50) DEFAULT NULL, `crt_ymdt`
	 * varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT NULL, PRIMARY KEY
	 * (`prd_mng_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */
	private Integer prd_mng_num;
	private Integer ctgry_mng_num;
	private String ctgry_nm;
	private String prd_nm;
	private String prd_code;
	private String prd_dscp;
	private String upc_code;
	private String sale_status;
	private double unit_price;
	private double cost_price;
	private int prd_qty;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public Integer getPrd_mng_num() {
		return prd_mng_num;
	}

	public void setPrd_mng_num(Integer prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
	}

	public Integer getCtgry_mng_num() {
		return ctgry_mng_num;
	}

	public void setCtgry_mng_num(Integer ctgry_mng_num) {
		this.ctgry_mng_num = ctgry_mng_num;
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

	public String getPrd_dscp() {
		return prd_dscp;
	}

	public void setPrd_dscp(String prd_dscp) {
		this.prd_dscp = prd_dscp;
	}

	public String getUpc_code() {
		return upc_code;
	}

	public void setUpc_code(String upc_code) {
		this.upc_code = upc_code;
	}

	public String getSale_status() {
		return sale_status;
	}

	public void setSale_status(String sale_status) {
		this.sale_status = sale_status;
	}

	public double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}

	public double getCost_price() {
		return cost_price;
	}

	public void setCost_price(double cost_price) {
		this.cost_price = cost_price;
	}

	public int getPrd_qty() {
		return prd_qty;
	}

	public void setPrd_qty(int prd_qty) {
		this.prd_qty = prd_qty;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getCrt_ymdt() {
		return crt_ymdt;
	}

	public void setCrt_ymdt(String crt_ymdt) {
		this.crt_ymdt = crt_ymdt;
	}

	public String getMod_ymdt() {
		return mod_ymdt;
	}

	public void setMod_ymdt(String mod_ymdt) {
		this.mod_ymdt = mod_ymdt;
	}

	public String getCtgry_nm() {
		return ctgry_nm;
	}

	public void setCtgry_nm(String ctgry_nm) {
		this.ctgry_nm = ctgry_nm;
	}

}
