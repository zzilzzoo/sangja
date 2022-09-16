package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.PackingProductDAO;
import com.sangja.domain.PackingProductVO;

@Service
public class PackingProductServiceImpl implements PackingProductService {

	@Inject
	private PackingProductDAO dao;
	@Override
	public List<PackingProductVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<PackingProductVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listByWhere(strWhere);
	}

	@Override
	public void write(PackingProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public PackingProductVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(sale_num);
	}

	@Override
	public void modify(PackingProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(sale_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PackingProductVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PackingProductVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
