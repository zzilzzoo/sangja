package com.sangja.domain;

public class PackingVO {
	/*
	 * CREATE TABLE `tbl_packing_info` ( `pack_num` int(11) NOT NULL AUTO_INCREMENT,
	 * `sale_num` varchar(20) DEFAULT NULL, `pack_date` varchar(20) DEFAULT NULL,
	 * `invoice_no` varchar(30) DEFAULT NULL, `cust_po_num` varchar(30) DEFAULT
	 * NULL, `cust_num` int(11) DEFAULT NULL, `bill_addr1` varchar(100) DEFAULT
	 * NULL, `bill_addr2` varchar(100) DEFAULT NULL, `ship_addr1` varchar(100)
	 * DEFAULT NULL, `ship_addr2` varchar(100) DEFAULT NULL, `po_number` varchar(20)
	 * DEFAULT NULL, `terms` varchar(20) DEFAULT NULL, `ship_date` varchar(20)
	 * DEFAULT NULL, `ship_method` varchar(20) DEFAULT NULL, `payment` varchar(20)
	 * DEFAULT NULL, `remark` varchar(200) DEFAULT NULL, `tot_box_qty` int(11)
	 * DEFAULT NULL, `editor` varchar(50) DEFAULT NULL, `crt_ymdt` varchar(30)
	 * DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT NULL, `tot_sale_qty` int(11)
	 * DEFAULT NULL, PRIMARY KEY (`pack_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */

	private int pack_num;
	private String sale_num;
	private String pack_date;
	private String invoice_no;
	private String cust_po_num;
	private int cust_num;
	private String bill_title;
	private String bill_addr1;
	private String bill_addr2;
	private String bill_to_remark;
	private String ship_title;
	private String ship_addr1;
	private String ship_addr2;
	private String ship_to_remark;
	private String po_number;
	private String terms;
	private String ship_date;
	private String ship_method;
	private String payment;
	public int getPack_num() {
		return pack_num;
	}
	public void setPack_num(int pack_num) {
		this.pack_num = pack_num;
	}
	public String getSale_num() {
		return sale_num;
	}
	public void setSale_num(String sale_num) {
		this.sale_num = sale_num;
	}
	public String getPack_date() {
		return pack_date;
	}
	public void setPack_date(String pack_date) {
		this.pack_date = pack_date;
	}
	public String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}
	public String getCust_po_num() {
		return cust_po_num;
	}
	public void setCust_po_num(String cust_po_num) {
		this.cust_po_num = cust_po_num;
	}
	public int getCust_num() {
		return cust_num;
	}
	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}
	public String getBill_addr1() {
		return bill_addr1;
	}
	public void setBill_addr1(String bill_addr1) {
		this.bill_addr1 = bill_addr1;
	}
	public String getBill_addr2() {
		return bill_addr2;
	}
	public void setBill_addr2(String bill_addr2) {
		this.bill_addr2 = bill_addr2;
	}
	public String getShip_addr1() {
		return ship_addr1;
	}
	public void setShip_addr1(String ship_addr1) {
		this.ship_addr1 = ship_addr1;
	}
	public String getShip_addr2() {
		return ship_addr2;
	}
	public void setShip_addr2(String ship_addr2) {
		this.ship_addr2 = ship_addr2;
	}
	public String getPo_number() {
		return po_number;
	}
	public void setPo_number(String po_number) {
		this.po_number = po_number;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public String getShip_date() {
		return ship_date;
	}
	public void setShip_date(String ship_date) {
		this.ship_date = ship_date;
	}
	public String getShip_method() {
		return ship_method;
	}
	public void setShip_method(String ship_method) {
		this.ship_method = ship_method;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getTot_box_qty() {
		return tot_box_qty;
	}
	public void setTot_box_qty(int tot_box_qty) {
		this.tot_box_qty = tot_box_qty;
	}
	public int getTot_sale_qty() {
		return tot_sale_qty;
	}
	public void setTot_sale_qty(int tot_sale_qty) {
		this.tot_sale_qty = tot_sale_qty;
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
	public String getBill_to_remark() {
		return bill_to_remark;
	}
	public void setBill_to_remark(String bill_to_remark) {
		this.bill_to_remark = bill_to_remark;
	}
	public String getShip_to_remark() {
		return ship_to_remark;
	}
	public void setShip_to_remark(String ship_to_remark) {
		this.ship_to_remark = ship_to_remark;
	}
	public String getBill_title() {
		return bill_title;
	}
	public void setBill_title(String bill_title) {
		this.bill_title = bill_title;
	}
	public String getShip_title() {
		return ship_title;
	}
	public void setShip_title(String ship_title) {
		this.ship_title = ship_title;
	}
	private String remark;
	private int tot_box_qty;
	private int tot_sale_qty;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

}
