package com.sangja.service;

import java.util.List;

import com.sangja.domain.CategoryVO;

public interface CategoryService {
	public List<CategoryVO> list() throws Exception;

	public void write(CategoryVO vo) throws Exception;

	public CategoryVO view(int ctgry_mng_num) throws Exception;

	public void modify(CategoryVO vo) throws Exception;

	// 게시물 삭제
	public void delete(int ctgry_mng_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<CategoryVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징+ 검색
	public List<CategoryVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	public int searchCount(String searchType, String keyword) throws Exception;
}
