package com.sangja.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.CustSalePriceDAO;
import com.sangja.domain.CustSalePriceVO;

@Service
public class CustSalePriceServiceImpl implements CustSalePriceService {

	@Inject
	private CustSalePriceDAO dao;
	
	@Override
	public List<CustSalePriceVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(CustSalePriceVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public CustSalePriceVO view(int cust_num, int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(cust_num, prd_mng_num);
	}

	@Override
	public void delete(int cust_num, int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		System.out.print((new Date().toString()) + "cust_num:" + cust_num + "\n");
		System.out.print((new Date().toString()) + "prd_mng_num:" + prd_mng_num + "\n");
		dao.delete(cust_num, prd_mng_num);
	}

}
