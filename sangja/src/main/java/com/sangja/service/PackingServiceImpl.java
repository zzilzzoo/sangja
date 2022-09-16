package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.PackingDAO;
import com.sangja.domain.PackingVO;

@Service
public class PackingServiceImpl implements PackingService {

	@Inject
	private PackingDAO dao;
	
	@Override
	public List<PackingVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<PackingVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listByWhere(strWhere);
	}

	@Override
	public void write(PackingVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public PackingVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(sale_num);
	}

	@Override
	public void modify(PackingVO vo) throws Exception {
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
	public List<PackingVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PackingVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
