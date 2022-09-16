package com.sangja.domain;

public class SalePayRecVO {
	/*
	 * CREATE TABLE `tbl_sale_pay_rec` ( `pay_num` int(11) NOT NULL AUTO_INCREMENT,
	 * `sale_num` int(11) NOT NULL, `pay_type` varchar(10) NOT NULL, `check_no`
	 * varchar(50) DEFAULT NULL, `pay_amt` int(11) DEFAULT '0', `pay_ymdt`
	 * varchar(30) DEFAULT NULL, `editor` varchar(50) DEFAULT NULL, `crt_ymdt`
	 * varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT NULL, PRIMARY KEY
	 * (`pay_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */

	private int pay_num;
	private String sale_num;
	private String pay_type;
	private String check_no;
	private double pay_amt;
	private String pay_ymdt;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;
	private String file_num;

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public String getSale_num() {
		return sale_num;
	}

	public void setSale_num(String sale_num) {
		this.sale_num = sale_num;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getCheck_no() {
		return check_no;
	}

	public void setCheck_no(String check_no) {
		this.check_no = check_no;
	}

	public double getPay_amt() {
		return pay_amt;
	}

	public void setPay_amt(double pay_amt) {
		this.pay_amt = pay_amt;
	}

	public String getPay_ymdt() {
		return pay_ymdt;
	}

	public void setPay_ymdt(String pay_ymdt) {
		this.pay_ymdt = pay_ymdt;
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

	public String getFile_num() {
		return file_num;
	}

	public void setFile_num(String file_num) {
		this.file_num = file_num;
	}

}
