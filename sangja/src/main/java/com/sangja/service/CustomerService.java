package com.sangja.service;

import java.util.List;

import com.sangja.domain.CustomerVO;

public interface CustomerService {
	public List<CustomerVO> list() throws Exception;
	public List<CustomerVO> listByWhere(String strWhere) throws Exception;

	public void write(CustomerVO vo) throws Exception;

	public CustomerVO view(int cust_num) throws Exception;

	public void modify(CustomerVO vo) throws Exception;
	
	//마지막 방문일자 업데이트
	public void modifyVisitYmd(int cust_num,String last_visit_ymd) throws Exception;
	

	public void deletemodify(int cust_num) throws Exception;

	// 게시물 삭제
	public void delete(int cust_num) throws Exception;

	// 게시물 총 갯수
	public int count(String strWhere) throws Exception;

	// 게시물 목록 + 페이징
	public List<CustomerVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징+ 검색
	public List<CustomerVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	public int searchCount(String searchType, String keyword) throws Exception;

	public List<CustomerVO> listForUser(int mng_user_num) throws Exception;

	public void modifyMngUser(int mng_user_num, int cust_num) throws Exception;

}
