package com.sangja.dao;

import java.util.List;

import com.sangja.domain.UserMenuVO;

public interface UserMenuDAO {
	public List<UserMenuVO> list(int user_num) throws Exception;

	public void write(UserMenuVO vo) throws Exception;

	public UserMenuVO view(int user_num, int menu_num) throws Exception;

	public void modify(UserMenuVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int user_num, int menu_num) throws Exception;

	public void deleteAll(int user_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<UserMenuVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<UserMenuVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
