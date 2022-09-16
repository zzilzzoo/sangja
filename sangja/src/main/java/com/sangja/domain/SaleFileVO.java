package com.sangja.domain;

public class SaleFileVO {
	/*CREATE TABLE `tbl_sale_file` (
  `file_num` int(11) NOT NULL AUTO_INCREMENT,
  `sale_num` varchar(50) DEFAULT NULL,
  `save_folder` varchar(50) DEFAULT NULL,
  `org_file_nm` varchar(50) DEFAULT NULL,
  `save_file_nm` varchar(50) DEFAULT NULL,
  `save_ymdt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`file_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/
	
	private String file_num;
	private String sale_num;
	private String save_folder;
	private String org_file_nm;
	private String save_file_nm;
	private String save_ymdt;
	
	public String getFile_num() {
		return file_num;
	}
	public void setFile_num(String file_num) {
		this.file_num = file_num;
	}
	public String getSale_num() {
		return sale_num;
	}
	public void setSale_num(String sale_num) {
		this.sale_num = sale_num;
	}
	public String getSave_folder() {
		return save_folder;
	}
	public void setSave_folder(String save_folder) {
		this.save_folder = save_folder;
	}
	public String getOrg_file_nm() {
		return org_file_nm;
	}
	public void setOrg_file_nm(String org_file_nm) {
		this.org_file_nm = org_file_nm;
	}
	public String getSave_file_nm() {
		return save_file_nm;
	}
	public void setSave_file_nm(String save_file_nm) {
		this.save_file_nm = save_file_nm;
	}
	public String getSave_ymdt() {
		return save_ymdt;
	}
	public void setSave_ymdt(String save_ymdt) {
		this.save_ymdt = save_ymdt;
	}
	

}
