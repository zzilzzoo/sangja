package com.sangja.domain;

public class InventoryVO {

	/*
	 * CREATE TABLE `tbl_inventory` ( `prd_mng_num` int(11) DEFAULT NULL, `user_num`
	 * int(11) DEFAULT NULL, `comp_qty` int(11) DEFAULT NULL, `user_qty` int(11)
	 * DEFAULT NULL, `tot_qty` int(11) DEFAULT NULL, `editor` varchar(50) DEFAULT
	 * NULL, `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT
	 * NULL, PRIMARY KEY (`prd_mng_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */

	private int prd_mng_num;
	private int user_num;
	private int qty;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}
