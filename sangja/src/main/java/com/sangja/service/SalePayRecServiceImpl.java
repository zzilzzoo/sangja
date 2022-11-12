package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.SalePayRecDAO;
import com.sangja.domain.SalePayRecVO;
import com.sangja.domain.SaleVO;

@Service
public class SalePayRecServiceImpl implements SalePayRecService {

	@Inject
	private SalePayRecDAO dao;

	@Override
	public List<SalePayRecVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<SalePayRecVO> salepaylist(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.salepaylist(sale_num);
	}
	
	@Override
	public List<SalePayRecVO> salepaylistBysalenum(List<SaleVO> sale_list) throws Exception {
		// TODO Auto-generated method stub
		return dao.salepaylistBysalenums(sale_list);
	}


	@Override
	public void write(SalePayRecVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public SalePayRecVO view(int pay_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(pay_num);
	}

	@Override
	public void modify(SalePayRecVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int pay_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(pay_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<SalePayRecVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<SalePayRecVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(searchType, keyword);
	}

	@Override
	public double salepaySum(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.salepaySum(sale_num);
	}

	
}
