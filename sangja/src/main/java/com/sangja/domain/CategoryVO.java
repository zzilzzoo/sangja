package com.sangja.domain;

public class CategoryVO {
	/*
	 * CREATE TABLE `tbl_category` ( `ctgry_mng_num` int(11) NOT NULL
	 * AUTO_INCREMENT, `ctgry_nm` varchar(50) NOT NULL, `editor` varchar(50) DEFAULT
	 * NULL, `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT
	 * NULL, PRIMARY KEY (`ctgry_mng_num`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 * 
	 */
	private int ctgry_mng_num;
	private String ctgry_nm;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public int getCtgry_mng_num() {
		return ctgry_mng_num;
	}

	public void setCtgry_mng_num(int ctgry_mng_num) {
		this.ctgry_mng_num = ctgry_mng_num;
	}

	public String getCtgry_nm() {
		return ctgry_nm;
	}

	public void setCtgry_nm(String ctgry_nm) {
		this.ctgry_nm = ctgry_nm;
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
