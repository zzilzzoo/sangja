package com.sangja.dao;

import java.util.List;

import com.sangja.domain.SaleVO;

public interface SaleDAO {
	public List<SaleVO> list() throws Exception;
	
	public List<SaleVO> listByWhere(String strWhere) throws Exception;
	
	public void write(SaleVO vo) throws Exception;

	public SaleVO view(String sale_num) throws Exception;

	public void modify(SaleVO vo) throws Exception;

	// 결제금액수정
	public void modifyPayAmt(String sale_num, double pay_amt, String pay_ymdt) throws Exception;

	// 게시뮬 삭제
	public void delete(String sale_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;
	
	public int countByWhere(String strWhere) throws Exception;

	// 게시물 목록 + 페이징
	public List<SaleVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<SaleVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;

	public String getSaleNum(String SaleType) throws Exception;
}
