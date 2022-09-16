package com.sangja.domain;

public class CustSalePriceVO {
	/*
	 * create table tbl_board( bno int not null auto_increment, title varchar(50)
	 * not null, content text not null, writer varchar(30) not null, regDate
	 * timestamp not null default now(), viewCnt int default 0, primary key(bno) );
	 */

	private Integer cust_num;
	private Integer prd_mng_num;
	private double sale_price;
	
	public Integer getCust_num() {
		return cust_num;
	}
	public void setCust_num(Integer cust_num) {
		this.cust_num = cust_num;
	}
	public Integer getPrd_mng_num() {
		return prd_mng_num;
	}
	public void setPrd_mng_num(Integer prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
	}
	public double getSale_price() {
		return sale_price;
	}
	public void setSale_price(double sale_price) {
		this.sale_price = sale_price;
	}
		

}
