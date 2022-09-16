package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.InventoryDAO;
import com.sangja.domain.InventoryVO;
import com.sangja.domain.ProductInventoryVO;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Inject
	private InventoryDAO dao;
	
	@Override
	public List<InventoryVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<ProductInventoryVO> PrdInvList() throws Exception {
		// TODO Auto-generated method stub
		return dao.PrdInvList();
	}

	@Override
	public void write(InventoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public InventoryVO view(int prd_mng_num,int user_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(prd_mng_num,user_num);
	}

	@Override
	public ProductInventoryVO PrdInvView(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.PrdInvView(prd_mng_num);
	}

	@Override
	public void modify(InventoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int prd_mng_num,int user_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(prd_mng_num,user_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InventoryVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InventoryVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
