package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.InvoiceDAO;
import com.sangja.domain.InvoiceVO;

@Service
public class InvoiceServiceImpl implements InvoiceService {

	@Inject
	private InvoiceDAO dao;
	
	@Override
	public List<InvoiceVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<InvoiceVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listByWhere(strWhere);
	}

	@Override
	public void write(InvoiceVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public InvoiceVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(sale_num);
	}

	@Override
	public void modify(InvoiceVO vo) throws Exception {
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
	public List<InvoiceVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InvoiceVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
