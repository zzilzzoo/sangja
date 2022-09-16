package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.SaleVO;

@Repository
public class SaleDAOImpl implements SaleDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.sale";

	@Override
	public List<SaleVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	
	@Override
	public List<SaleVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listByWhere",strWhere);
	}

	@Override
	public void write(SaleVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public SaleVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", sale_num);
	}

	@Override
	public void modify(SaleVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void modifyPayAmt(String sale_num, double pay_amt, String pay_ymdt) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> updata = new HashMap<String, Object>();
		updata.put("sale_num", sale_num);
		updata.put("tot_pay_amt", pay_amt);
		updata.put("last_pay_ymdt", pay_ymdt);

		System.out.println(sale_num);
		System.out.println(pay_amt);
		System.out.println(pay_ymdt);

		System.out.println("=================================");

		System.out.println(updata.get("sale_num"));
		System.out.println(updata.get("tot_pay_amt"));
		System.out.println(updata.get("last_pay_ymdt"));

		sql.update(namespace + ".modifyPayAmt", updata);
	}

	@Override
	public void delete(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", sale_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SaleVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaleVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public String getSaleNum(String SaleType) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getsalenum", SaleType);
	}

	@Override
	public int countByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".countByWhere", strWhere);
	}

	
}
