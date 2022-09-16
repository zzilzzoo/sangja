package com.sangja.service;

import java.util.List;

import com.sangja.domain.PackingVO;

public interface PackingService {
public List<PackingVO> list() throws Exception;
	
	public List<PackingVO> listByWhere(String strWhere) throws Exception;

	public void write(PackingVO vo) throws Exception;

	public PackingVO view(String sale_num) throws Exception;

	public void modify(PackingVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(String sale_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<PackingVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<PackingVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
