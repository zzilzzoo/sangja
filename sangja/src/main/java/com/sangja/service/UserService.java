package com.sangja.service;

import java.util.List;

import com.sangja.domain.UserVO;

public interface UserService {
	public List<UserVO> list() throws Exception;
	
	public List<UserVO> listbyWhere(String strWhere) throws Exception;

	public void write(UserVO vo) throws Exception;

	public UserVO view(int user_num) throws Exception;

	public void modify(UserVO vo) throws Exception;

	// 게시물 삭제
	public void delete(int user_num) throws Exception;

	public UserVO login(UserVO vo) throws Exception;
	//아이디 체크
	public int idCheck(String user_id) throws Exception;
	// 게시물 총 갯수
	public int count() throws Exception;

	// product 커미션용 list
	public List<UserVO> listForProduct(int prd_mng_num) throws Exception;

	// 게시물 목록 + 페이징
	public List<UserVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징+ 검색
	public List<UserVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	public int searchCount(String searchType, String keyword) throws Exception;
}
