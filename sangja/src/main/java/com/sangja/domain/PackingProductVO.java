package com.sangja.domain;

import java.util.List;

public class PackingProductVO {
/*
 * CREATE TABLE `tbl_packing_product` (
  `pack_prd_num` int(11) NOT NULL AUTO_INCREMENT,
  `sale_num` varchar(20) DEFAULT NULL,
  `prd_mng_num` int(11) DEFAULT NULL,
  `sale_qty` int(11) DEFAULT NULL,
  `qty_per_box` int(11) DEFAULT NULL,
  `box_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`pack_prd_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */
	private int pack_prd_num;
	private String sale_num;
	private int prd_mng_num;
	private String prd_nm;
	private int sale_qty;
	private int qty_per_box;
	private int box_qty;
	private List<PackingProductVO> PackingProductVOList;
	
	public int getPack_prd_num() {
		return pack_prd_num;
	}
	public void setPack_prd_num(int pack_prd_num) {
		this.pack_prd_num = pack_prd_num;
	}
	public String getSale_num() {
		return sale_num;
	}
	public void setSale_num(String sale_num) {
		this.sale_num = sale_num;
	}
	public int getPrd_mng_num() {
		return prd_mng_num;
	}
	public void setPrd_mng_num(int prd_mng_num) {
		this.prd_mng_num = prd_mng_num;
	}
	public int getSale_qty() {
		return sale_qty;
	}
	public void setSale_qty(int sale_qty) {
		this.sale_qty = sale_qty;
	}
	public int getQty_per_box() {
		return qty_per_box;
	}
	public void setQty_per_box(int qty_per_box) {
		this.qty_per_box = qty_per_box;
	}
	public int getBox_qty() {
		return box_qty;
	}
	public void setBox_qty(int box_qty) {
		this.box_qty = box_qty;
	}
	public List<PackingProductVO> getPackingProductVOList() {
		return PackingProductVOList;
	}
	public void setPackingProductVOList(List<PackingProductVO> packingProductVOList) {
		PackingProductVOList = packingProductVOList;
	}
	public String getPrd_nm() {
		return prd_nm;
	}
	public void setPrd_nm(String prd_nm) {
		this.prd_nm = prd_nm;
	}
	
	
}
