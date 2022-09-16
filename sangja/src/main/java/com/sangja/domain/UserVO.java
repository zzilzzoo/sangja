package com.sangja.domain;

public class UserVO {

	/*
	 * `user_num` int(11) NOT NULL AUTO_INCREMENT, `user_nm_f` varchar(100) NOT
	 * NULL, `user_nm_l` varchar(100) DEFAULT NULL, `user_id` varchar(100) NOT NULL,
	 * `user_pwd` varchar(100) DEFAULT NULL, `job` varchar(100) DEFAULT NULL,
	 * `user_status` varchar(10) DEFAULT 'Active', `editor` varchar(50) DEFAULT
	 * NULL, `crt_ymdt` varchar(30) DEFAULT NULL, `mod_ymdt` varchar(30) DEFAULT
	 * NULL,
	 */

	private int user_num;
	private String user_nm_f;
	private String user_nm_l;
	private String user_id;
	private String user_pwd;
	private String category;
	private String phone_no;
	private String job;
	private String user_status;
	private String editor;
	private String crt_ymdt;
	private String mod_ymdt;

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getUser_nm_f() {
		return user_nm_f;
	}

	public void setUser_nm_f(String user_nm_f) {
		this.user_nm_f = user_nm_f;
	}

	public String getUser_nm_l() {
		return user_nm_l;
	}

	public void setUser_nm_l(String user_nm_l) {
		this.user_nm_l = user_nm_l;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

}
