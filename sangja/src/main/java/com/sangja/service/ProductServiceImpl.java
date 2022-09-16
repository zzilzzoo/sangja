package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.ProductDAO;
import com.sangja.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;

	@Override
	public List<ProductVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	@Override
	public List<ProductVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listByWhere(strWhere);
	}
	@Override
	public void write(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public ProductVO view(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(prd_mng_num);
	}
	
	@Override
	public ProductVO viewByUpc(String upc_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.viewByUpc(upc_code);
	}

	@Override
	public void modify(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(prd_mng_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<ProductVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<ProductVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(searchType, keyword);
	}

	

}
