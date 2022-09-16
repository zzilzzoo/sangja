package com.sangja.domain;

public class InventoryUserVO {
	
	/*SELECT t1.prd_mng_num,t1.inout_ymdt,
    t1.user_num,
    t2.category,
    ifnull(concat(t2.user_nm_f, ' ', t2.user_nm_f), '회사') user_nm,
    t1.event_opt,
    t1.bf_comp_qty,
    t1.bf_user_qty,
    t1.unit_price,
    t1.event_qty,
    t1.event_amt,
    t1.af_comp_qty,
    t1.af_user_qty,
    t1.tot_qty,
    t1.event_note
FROM tbl_inventory_inout t1
  LEFT OUTER JOIN tbl_user t2 ON t1.user_num = t2.user_num where t1.prd_mng_num=25*/
  
	private int prd_mng_num;
	private String inout_ymdt;
	private int user_num;
	private String category;
    private String user_nm;
    private String event_opt;
    private int bf_comp_qty;
    private int bf_user_qty;
    private double unit_price;
    private int event_qty;
    private double event_amt;
    private int af_comp_qty;
    private int af_user_qty;
    public int getPrd_mng_num() {
		return prd_mng_num;
	}
	public void setPrd_mng_num(int prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
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
	public String getEvent_opt() {
		return event_opt;
	}
	public void setEvent_opt(String event_opt) {
		this.event_opt = event_opt;
	}
	public int getBf_comp_qty() {
		return bf_comp_qty;
	}
	public void setBf_comp_qty(int bf_comp_qty) {
		this.bf_comp_qty = bf_comp_qty;
	}
	public int getBf_user_qty() {
		return bf_user_qty;
	}
	public void setBf_user_qty(int bf_user_qty) {
		this.bf_user_qty = bf_user_qty;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public int getEvent_qty() {
		return event_qty;
	}
	public void setEvent_qty(int event_qty) {
		this.event_qty = event_qty;
	}
	public double getEvent_amt() {
		return event_amt;
	}
	public void setEvent_amt(double event_amt) {
		this.event_amt = event_amt;
	}
	public int getAf_comp_qty() {
		return af_comp_qty;
	}
	public void setAf_comp_qty(int af_comp_qty) {
		this.af_comp_qty = af_comp_qty;
	}
	public int getAf_user_qty() {
		return af_user_qty;
	}
	public void setAf_user_qty(int af_user_qty) {
		this.af_user_qty = af_user_qty;
	}
	public int getTot_qty() {
		return tot_qty;
	}
	public void setTot_qty(int tot_qty) {
		this.tot_qty = tot_qty;
	}
	public String getEvent_note() {
		return event_note;
	}
	public void setEvent_note(String event_note) {
		this.event_note = event_note;
	}
	public String getInout_ymdt() {
		return inout_ymdt;
	}
	public void setInout_ymdt(String inout_ymdt) {
		this.inout_ymdt = inout_ymdt;
	}
	private int tot_qty;
    private String event_note;
	
}
