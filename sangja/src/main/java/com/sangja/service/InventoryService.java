package com.sangja.service;

import java.util.List;

import com.sangja.domain.InventoryVO;
import com.sangja.domain.ProductInventoryVO;

public interface InventoryService {
	public List<InventoryVO> list() throws Exception;

	public List<ProductInventoryVO> PrdInvList() throws Exception;

	public void write(InventoryVO vo) throws Exception;

	public InventoryVO view(int prd_mng_num,int user_num) throws Exception;

	public ProductInventoryVO PrdInvView(int prd_mng_num) throws Exception;

	public void modify(InventoryVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int prd_mng_num,int user_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<InventoryVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<InventoryVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
