package com.sangja.service;

import java.util.List;

import com.sangja.domain.PackingProductVO;

public interface PackingProductService {
	public List<PackingProductVO> list() throws Exception;

	public List<PackingProductVO> listByWhere(String strWhere) throws Exception;

	public void write(PackingProductVO vo) throws Exception;

	public PackingProductVO view(String sale_num) throws Exception;

	public void modify(PackingProductVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(String sale_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<PackingProductVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<PackingProductVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
