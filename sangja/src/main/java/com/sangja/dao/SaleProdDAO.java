package com.sangja.dao;

import java.util.List;

import com.sangja.domain.SaleProdVO;
import com.sangja.domain.SaleVO;

public interface SaleProdDAO {
	public List<SaleProdVO> list() throws Exception;

	public List<SaleProdVO> listBySaleNum(String sale_num) throws Exception;

	public List<SaleProdVO> listBySaleNums(List<SaleVO> sale_list) throws Exception;

	public void write(SaleProdVO vo) throws Exception;

	public SaleProdVO view(int sale_prod_num) throws Exception;

	public void modify(SaleProdVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int sale_prod_num) throws Exception;

	public void deleteAll(String sale_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<SaleProdVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<SaleProdVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
