package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.ProductCommsDAO;
import com.sangja.domain.ProductCommsVO;

@Service
public class ProductCommsServiceImpl implements ProductCommsService {

	@Inject
	private ProductCommsDAO dao;

	@Override
	public List<ProductCommsVO> list(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(prd_mng_num);
	}

	@Override
	public void write(ProductCommsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);

	}

	@Override
	public ProductCommsVO view(int prd_mng_num, int user_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(prd_mng_num, user_num);
	}

	@Override
	public void modify(ProductCommsVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);

	}

	@Override
	public void delete(int prd_mng_num, int user_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(prd_mng_num, user_num);
	}

}
