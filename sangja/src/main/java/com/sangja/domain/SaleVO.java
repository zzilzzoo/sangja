package com.sangja.domain;

public class SaleVO {
	/*
	 * CREATE TABLE `tbs_sale_rec` ( `sale_num` varchar(50) NOT NULL, `ord_no`
	 * varchar(50) DEFAULT NULL, `sale_ymd` varchar(30) NOT NULL, `sale_time`
	 * varchar(30) NOT NULL, `sale_type` varchar(10) DEFAULT NULL, `sale_user_num`
	 * int(11) DEFAULT NULL, `cust_num` int(11) DEFAULT NULL, `cust_nm` varchar(100)
	 * DEFAULT NULL, `addr` varchar(100) DEFAULT NULL, `city` varchar(50) DEFAULT
	 * NULL, `state` varchar(50) DEFAULT NULL, `zip_code` varchar(20) DEFAULT NULL,
	 * `tot_sale_amt` int(11) DEFAULT NULL, `tot_pay_amt` int(11) DEFAULT NULL,
	 * `last_pay_ymdt` varchar(30) DEFAULT NULL, `editor` varchar(50) DEFAULT NULL,
	 * `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT NULL,
	 * PRIMARY KEY (`sale_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */

	private String sale_num;
	private String ord_no;
	private String sale_ymd;
	private String sale_time;
	private String sale_type;
	private int sale_user_num = 0;
	private String sale_user_nm;
	private int cust_num = 0;
	private String cust_nm;
	private String addr;
	private String city;
	private String state;
	private String zip_code;
	private double tot_sale_amt = 0;
	private double tot_tax_amt = 0;
	private double shopping_cost = 0;
	private double tot_ord_amt = 0;
	private double tot_pay_amt = 0;
	private String last_pay_ymdt;
	private String sale_note;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public SaleVO() {
		this.sale_num = "0";
		this.ord_no = "";
		this.sale_ymd = "";
		this.sale_time = "";
		this.sale_type = "";
		this.sale_user_num = 0;
		this.cust_num = 0;
		this.cust_nm = "";
		this.addr = "";
		this.city = "";
		this.state = "";
		this.zip_code = "";
		this.tot_sale_amt = 0;
		this.tot_pay_amt = 0;
		this.last_pay_ymdt = "";
		this.editor = "";
		this.crt_ymdt = "";
		this.mod_ymdt = "";
	}

	public String getSale_num() {
		return sale_num;
	}

	public void setSale_num(String sale_num) {
		this.sale_num = sale_num;
	}

	public String getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}

	public String getSale_ymd() {
		return sale_ymd;
	}

	public void setSale_ymd(String sale_ymd) {
		this.sale_ymd = sale_ymd;
	}

	public String getSale_time() {
		return sale_time;
	}

	public void setSale_time(String sale_time) {
		this.sale_time = sale_time;
	}

	public String getSale_type() {
		return sale_type;
	}

	public void setSale_type(String sale_type) {
		this.sale_type = sale_type;
	}

	public int getSale_user_num() {
		return sale_user_num;
	}

	public void setSale_user_num(int sale_user_num) {
		this.sale_user_num = sale_user_num;
	}

	public int getCust_num() {
		return cust_num;
	}

	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}

	public double getTot_sale_amt() {
		return tot_sale_amt;
	}

	public void setTot_sale_amt(double tot_sale_amt) {
		this.tot_sale_amt = tot_sale_amt;
	}

	public double getTot_pay_amt() {
		return tot_pay_amt;
	}

	public void setTot_pay_amt(double tot_pay_amt) {
		this.tot_pay_amt = tot_pay_amt;
	}

	public String getLast_pay_ymdt() {
		return last_pay_ymdt;
	}

	public void setLast_pay_ymdt(String last_pay_ymdt) {
		this.last_pay_ymdt = last_pay_ymdt;
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

	public String getCust_nm() {
		return cust_nm;
	}

	public void setCust_nm(String cust_nm) {
		this.cust_nm = cust_nm;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public double getTot_tax_amt() {
		return tot_tax_amt;
	}

	public void setTot_tax_amt(double tot_tax_amt) {
		this.tot_tax_amt = tot_tax_amt;
	}

	public String getSale_note() {
		return sale_note;
	}

	public void setSale_note(String sale_note) {
		this.sale_note = sale_note;
	}

	public double getShopping_cost() {
		return shopping_cost;
	}

	public void setShopping_cost(double shopping_cost) {
		this.shopping_cost = shopping_cost;
	}

	public double getTot_ord_amt() {
		return tot_ord_amt;
	}

	public void setTot_ord_amt(double tot_ord_amt) {
		this.tot_ord_amt = tot_ord_amt;
	}

	public String getSale_user_nm() {
		return sale_user_nm;
	}

	public void setSale_user_nm(String sale_user_nm) {
		this.sale_user_nm = sale_user_nm;
	}

}
