package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.SaleDAO;
import com.sangja.domain.SaleVO;

@Service
public class SaleServiceImpl implements SaleService {

	@Inject
	private SaleDAO dao;

	@Override
	public List<SaleVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<SaleVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listByWhere(strWhere);
	}
	
	@Override
	public void write(SaleVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public SaleVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(sale_num);
	}

	@Override
	public void modify(SaleVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	// 총결제금액 수정
	@Override
	public void modifyPayAmt(String sale_num, double pay_amt, String pay_ymdt) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(sale_num);
		System.out.println(pay_amt);
		System.out.println(pay_ymdt);
		dao.modifyPayAmt(sale_num, pay_amt, pay_ymdt);
	}
	@Override
	public void delete_backup(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete_backup(sale_num);
	}
	@Override
	public void delete(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(sale_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<SaleVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<SaleVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public String getSaleNum(String SaleType) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSaleNum(SaleType);
	}

	@Override
	public int countByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.countByWhere(strWhere);
	}

	

	

}
