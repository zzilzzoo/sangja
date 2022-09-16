package com.sangja.domain;

public class MenuVO {
	/*
	 * CREATE TABLE `tbl_menu` ( `menu_num` int(11) NOT NULL AUTO_INCREMENT,
	 * `menu_nm` varchar(100) NOT NULL, `editor` varchar(50) DEFAULT NULL,
	 * `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT NULL,
	 * PRIMARY KEY (`menu_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */
	private int menu_num;
	private String menu_nm;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public String getMenu_nm() {
		return menu_nm;
	}

	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
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

}
