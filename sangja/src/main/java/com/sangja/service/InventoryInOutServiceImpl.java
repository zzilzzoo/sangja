package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.sangja.dao.InventoryInOutDAO;
import com.sangja.domain.InventoryInOutVO;
import com.sangja.domain.InventoryUserVO;

@Service
public class InventoryInOutServiceImpl implements InventoryInOutService {

	@Inject
	private InventoryInOutDAO dao;
	
	@Override
	public List<InventoryInOutVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(InventoryInOutVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public InventoryInOutVO view(int mng_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(mng_no);
	}

	@Override
	public void delete(int mng_no) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(mng_no);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InventoryInOutVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InventoryInOutVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InventoryUserVO> InvIOUserList(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.InvIOUserList(prd_mng_num);
	}

}
