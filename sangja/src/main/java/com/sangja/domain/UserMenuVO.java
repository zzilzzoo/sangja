package com.sangja.domain;

public class UserMenuVO {
	/*
	 * CREATE TABLE `tbl_user_menu` ( `user_num` int(11) NOT NULL, `menu_num`
	 * int(11) NOT NULL, `read_yn` varchar(10) DEFAULT NULL, `write_yn` varchar(10)
	 * DEFAULT NULL, `delete_yn` varchar(10) DEFAULT NULL, `editor` varchar(50)
	 * DEFAULT NULL, `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30)
	 * DEFAULT NULL, PRIMARY KEY (`user_num`,`menu_num`) ) ENGINE=InnoDB DEFAULT
	 * CHARSET=utf8;
	 */
	private int user_num;
	private int menu_num;
	private String read_yn;
	private String write_yn;
	private String delete_yn;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public int getMenu_num() {
		return menu_num;
	}

	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}

	public String getRead_yn() {
		return read_yn;
	}

	public void setRead_yn(String read_yn) {
		this.read_yn = read_yn;
	}

	public String getWrite_yn() {
		return write_yn;
	}

	public void setWrite_yn(String write_yn) {
		this.write_yn = write_yn;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
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
