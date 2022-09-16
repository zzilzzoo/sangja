package com.sangja.domain;

import java.util.List;

public class InventoryInOutVO {

	/*CREATE TABLE `tbl_inventory_inout` (
			  `mng_num` int(11) NOT NULL AUTO_INCREMENT,
			  `prd_mng_num` int(11) DEFAULT NULL,
			  `user_num` int(11) DEFAULT NULL,
			  `inout_ymdt` varchar(30) DEFAULT NULL,
			  `event_opt` varchar(50) DEFAULT NULL,
			  `bf_comp_qty` int(11) DEFAULT NULL,
			  `bf_user_qty` int(11) DEFAULT NULL,
			  `unit_fee` double DEFAULT NULL,
			  `event_qty` int(11) DEFAULT NULL,
			  `event_amt` double DEFAULT NULL,
			  `af_comp_qty` int(11) DEFAULT NULL,
			  `af_user_qty` int(11) DEFAULT NULL,
			  `tot_qty` int(11) DEFAULT NULL,
			  `event_note` varchar(200) DEFAULT NULL,
			  PRIMARY KEY (`mng_num`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/

	 private int  mng_num;
	 private int prd_mng_num;
	 private int user_num;
	 private String inout_ymdt;
	 private String event_opt;
	 private int bf_comp_qty;
	 private int bf_user_qty;
	 private double cost_price;
	 private double unit_price;
	 private int event_qty;
	 private double event_amt;
	 private int af_comp_qty;
	 private int af_user_qty;
	 private int tot_qty;
	 private String event_note;
	 private List<InventoryInOutVO> InventoryInOutVOList;
	 
	public int getMng_num() {
		return mng_num;
	}
	public void setMng_num(int mng_num) {
		this.mng_num = mng_num;
	}
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
	public String getInout_ymdt() {
		return inout_ymdt;
	}
	public void setInout_ymdt(String inout_ymdt) {
		this.inout_ymdt = inout_ymdt;
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
	public double getCost_price() {
		return cost_price;
	}
	public void setCost_price(double cost_price) {
		this.cost_price = cost_price;
	}
	public double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}
	public List<InventoryInOutVO> getInventoryInOutVOList() {
		return InventoryInOutVOList;
	}
	public void setInventoryInOutVOList(List<InventoryInOutVO> inventoryInOutVOList) {
		InventoryInOutVOList = inventoryInOutVOList;
	}
	
}
