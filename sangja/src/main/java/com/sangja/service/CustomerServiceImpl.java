package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.CustomerDAO;
import com.sangja.domain.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Inject
	private CustomerDAO dao;

	@Override
	public List<CustomerVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	@Override
	public List<CustomerVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listByWhere(strWhere);
	}
	@Override
	public void write(CustomerVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public CustomerVO view(int cust_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(cust_num);
	}

	@Override
	public void modify(CustomerVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}
	@Override
	public void modifyVisitYmd(int cust_num, String last_visit_ymd) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyVisitYmd(cust_num, last_visit_ymd);
	}
	@Override
	public void deletemodify(int cust_num) throws Exception {
		// TODO Auto-generated method stub
		dao.deletemodify(cust_num);
	}

	@Override
	public void delete(int cust_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(cust_num);
	}

	@Override
	public int count(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(strWhere);
	}

	@Override
	public List<CustomerVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<CustomerVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public List<CustomerVO> listForUser(int mng_user_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.listForUser(mng_user_num);
	}

	@Override
	public void modifyMngUser(int mng_user_num, int cust_num) throws Exception {
		// TODO Auto-generated method stub
		dao.modifyMngUser(mng_user_num, cust_num);
	}

	

	

}
