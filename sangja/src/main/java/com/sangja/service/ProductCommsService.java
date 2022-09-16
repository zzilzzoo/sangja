package com.sangja.service;

import java.util.List;

import com.sangja.domain.ProductCommsVO;

public interface ProductCommsService {
	public List<ProductCommsVO> list(int prd_mng_num) throws Exception;

	public void write(ProductCommsVO vo) throws Exception;

	public ProductCommsVO view(int prd_mng_num, int user_num) throws Exception;

	public void modify(ProductCommsVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int prd_mng_num, int user_num) throws Exception;
}
