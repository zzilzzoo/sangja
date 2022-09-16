package com.sangja.dao;

import java.util.List;

import com.sangja.domain.SalePayRecVO;
import com.sangja.domain.SaleVO;

public interface SalePayRecDAO {
	public List<SalePayRecVO> list() throws Exception;

	public List<SalePayRecVO> salepaylist(String sale_num) throws Exception;

	public List<SalePayRecVO> salepaylistBysalenums(List<SaleVO> sale_list) throws Exception;

	public void write(SalePayRecVO vo) throws Exception;

	public SalePayRecVO view(int pay_num) throws Exception;

	public void modify(SalePayRecVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int pay_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<SalePayRecVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<SalePayRecVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
