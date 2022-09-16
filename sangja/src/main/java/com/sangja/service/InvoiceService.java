package com.sangja.service;

import java.util.List;

import com.sangja.domain.InvoiceVO;

public interface InvoiceService {
public List<InvoiceVO> list() throws Exception;
	
	public List<InvoiceVO> listByWhere(String strWhere) throws Exception;

	public void write(InvoiceVO vo) throws Exception;

	public InvoiceVO view(String sale_num) throws Exception;

	public void modify(InvoiceVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(String sale_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<InvoiceVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<InvoiceVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
