package com.sangja.service;

import java.util.List;

import com.sangja.domain.InventoryInOutVO;
import com.sangja.domain.InventoryUserVO;

public interface InventoryInOutService {
	public List<InventoryInOutVO> list() throws Exception;

	public void write(InventoryInOutVO vo) throws Exception;

	public InventoryInOutVO view(int mng_no) throws Exception;

	// 게시뮬 삭제
	public void delete(int mng_no) throws Exception;
	
	public List<InventoryUserVO> InvIOUserList(int prd_mng_num) throws Exception ;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<InventoryInOutVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<InventoryInOutVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
