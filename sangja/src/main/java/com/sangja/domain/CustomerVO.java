package com.sangja.domain;

public class CustomerVO {
	/*
	 * CREATE TABLE `tbl_customer` ( `cust_num` int(11) NOT NULL AUTO_INCREMENT,
	 * `mng_user_num` int(11) DEFAULT NULL, `cust_nm` varchar(100) DEFAULT NULL,
	 * `zip_code` varchar(50) DEFAULT NULL, `state` varchar(100) DEFAULT NULL,
	 * `city` varchar(100) DEFAULT NULL, `addr` varchar(255) DEFAULT NULL,
	 * `visit_term` int(11) DEFAULT NULL, `last_visit_ymd` varchar(30) DEFAULT NULL,
	 * `cust_status` varchar(10) DEFAULT NULL, `editor` varchar(50) DEFAULT NULL,
	 * `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT NULL,
	 * PRIMARY KEY (`cust_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */
	private int cust_num;
	private int mng_user_num;
	private String cust_nm;
	private String mng_user_nm;
	private String zip_code;
	private String state;
	private String city;
	private String addr;
	private int visit_term;
	private String last_visit_ymd;
	private String cust_status;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public int getCust_num() {
		return cust_num;
	}

	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}

	public int getMng_user_num() {
		return mng_user_num;
	}

	public void setMng_user_num(int mng_user_num) {
		this.mng_user_num = mng_user_num;
	}

	public String getCust_nm() {
		return cust_nm;
	}

	public void setCust_nm(String cust_nm) {
		this.cust_nm = cust_nm;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getVisit_term() {
		return visit_term;
	}

	public void setVisit_term(int visit_term) {
		this.visit_term = visit_term;
	}

	public String getLast_visit_ymd() {
		return last_visit_ymd;
	}

	public void setLast_visit_ymd(String last_visit_ymd) {
		this.last_visit_ymd = last_visit_ymd;
	}

	public String getCust_status() {
		return cust_status;
	}

	public void setCust_status(String cust_status) {
		this.cust_status = cust_status;
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

	public String getMng_user_nm() {
		return mng_user_nm;
	}

	public void setMng_user_nm(String mng_user_nm) {
		this.mng_user_nm = mng_user_nm;
	}

}
