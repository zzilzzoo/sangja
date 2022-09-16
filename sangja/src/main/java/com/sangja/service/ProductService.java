package com.sangja.service;

import java.util.List;

import com.sangja.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> list() throws Exception;
	public List<ProductVO> listByWhere(String strWhere) throws Exception;

	public void write(ProductVO vo) throws Exception;

	public ProductVO view(int prd_mng_num) throws Exception;
	public ProductVO viewByUpc(String upc_code) throws Exception;

	public void modify(ProductVO vo) throws Exception;

	// 게시물 삭제
	public void delete(int prd_mng_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<ProductVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징+ 검색
	public List<ProductVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	public int searchCount(String searchType, String keyword) throws Exception;
}
