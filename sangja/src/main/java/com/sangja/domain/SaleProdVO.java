package com.sangja.domain;

import java.util.List;

public class SaleProdVO {
	/*
	 * CREATE TABLE `tbl_sale_prod` ( `sale_prod_num` int(11) NOT NULL
	 * AUTO_INCREMENT, `sale_num` int(11) DEFAULT NULL, `prd_mng_num` int(11)
	 * DEFAULT NULL, `sale_opt` varchar(10) DEFAULT NULL, `unit_price` int(11)
	 * DEFAULT NULL, `sale_price` int(11) DEFAULT NULL, `sale_qty` int(11) DEFAULT
	 * NULL, `tot_sale_price` int(11) DEFAULT NULL, `editor` varchar(50) DEFAULT
	 * NULL, `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT
	 * NULL, PRIMARY KEY (`sale_prod_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */
	private int sale_prod_num;
	private String sale_num;
	private int prd_mng_num;
	private String prd_nm;
	private String upc_code;
	private String sale_opt;
	private double unit_price;
	private double sale_price;
	private int sale_qty;
	private double tot_sale_price;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;
	private List<SaleProdVO> SaleProdVOList;

	public int getSale_prod_num() {
		return sale_prod_num;
	}

	public void setSale_prod_num(int sale_prod_num) {
		this.sale_prod_num = sale_prod_num;
	}

	public String getSale_num() {
		return sale_num;
	}

	public void setSale_num(String sale_num) {
		this.sale_num = sale_num;
	}

	public int getPrd_mng_num() {
		return prd_mng_num;
	}

	public void setPrd_mng_num(int prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
	}

	public String getSale_opt() {
		return sale_opt;
	}

	public void setSale_opt(String sale_opt) {
		this.sale_opt = sale_opt;
	}

	public double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}

	public double getSale_price() {
		return sale_price;
	}

	public void setSale_price(double sale_price) {
		this.sale_price = sale_price;
	}

	public int getSale_qty() {
		return sale_qty;
	}

	public void setSale_qty(int sale_qty) {
		this.sale_qty = sale_qty;
	}

	public double getTot_sale_price() {
		return tot_sale_price;
	}

	public void setTot_sale_price(double tot_sale_price) {
		this.tot_sale_price = tot_sale_price;
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

	public String getPrd_nm() {
		return prd_nm;
	}

	public void setPrd_nm(String prd_nm) {
		this.prd_nm = prd_nm;
	}

	public List<SaleProdVO> getSaleProdVOList() {
		return SaleProdVOList;
	}

	public void setSaleProdVOList(List<SaleProdVO> saleProdVOList) {
		SaleProdVOList = saleProdVOList;
	}

	public String getUpc_code() {
		return upc_code;
	}

	public void setUps_code(String upc_code) {
		this.upc_code = upc_code;
	}

}
