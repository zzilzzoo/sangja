package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.CustSalePriceVO;

@Repository
public class CustSalePriceDAOImpl implements CustSalePriceDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.custsaleprice";
	
	@Override
	public List<CustSalePriceVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(CustSalePriceVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public CustSalePriceVO view(int cust_num, int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("cust_num", cust_num);
		data.put("prd_mng_num", prd_mng_num);
		
		return sql.selectOne(namespace + ".view", data);
	}

	@Override
	public void delete(int cust_num, int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("cust_num", cust_num);
		data.put("prd_mng_num", prd_mng_num);
		
		sql.delete(namespace + ".delete", data);
	}

}
