package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.SaleProdDAO;
import com.sangja.domain.SaleProdVO;
import com.sangja.domain.SaleVO;

@Service
public class SaleProdServiceImpl implements SaleProdService {

	@Inject
	private SaleProdDAO dao;

	@Override
	public List<SaleProdVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<SaleProdVO> listBySaleNum(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.listBySaleNum(sale_num);
	}
	
	@Override
	public List<SaleProdVO> listBySaleNums(List<SaleVO> sale_list) throws Exception {
		// TODO Auto-generated method stub
		return dao.listBySaleNums(sale_list);
	}
	@Override
	public void write(SaleProdVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public SaleProdVO view(int sale_prod_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(sale_prod_num);
	}

	@Override
	public void modify(SaleProdVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int sale_prod_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(sale_prod_num);
	}

	@Override
	public void deleteAll(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAll(sale_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<SaleProdVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<SaleProdVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
