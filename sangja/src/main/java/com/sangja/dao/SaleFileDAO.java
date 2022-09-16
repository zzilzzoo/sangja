package com.sangja.dao;

import java.util.List;

import com.sangja.domain.SaleFileVO;
import com.sangja.domain.SaleVO;

public interface SaleFileDAO {
	public List<SaleFileVO> list() throws Exception;

	public List<SaleFileVO> listBySaleNum(String sale_num) throws Exception;

	public List<SaleFileVO> listBySaleNums(List<SaleVO> sale_list) throws Exception;

	public void write(SaleFileVO vo) throws Exception;

	public SaleFileVO view(String file_num) throws Exception;
	
	public SaleFileVO viewBySaleNum(String sale_num) throws Exception;

	public void modify(SaleFileVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(String file_num) throws Exception;

	public void deleteAll(String sale_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<SaleFileVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<SaleFileVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
