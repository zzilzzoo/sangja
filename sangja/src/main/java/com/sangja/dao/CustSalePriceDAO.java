package com.sangja.dao;

import java.util.List;

import com.sangja.domain.CustSalePriceVO;

public interface CustSalePriceDAO {
	public List<CustSalePriceVO> list() throws Exception;

	public void write(CustSalePriceVO vo) throws Exception;

	public CustSalePriceVO view(int cust_num,int prd_mng_num) throws Exception;
	
	// 게시뮬 삭제
	public void delete(int cust_num,int prd_mng_num) throws Exception;

}
