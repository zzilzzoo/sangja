package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.customer";

	@Override
	public List<CustomerVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	@Override
	public List<CustomerVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listByWhere",strWhere);
	}

	@Override
	public void write(CustomerVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);

	}

	@Override
	public CustomerVO view(int cust_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", cust_num);
	}

	@Override
	public void modify(CustomerVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}
	@Override
	public void modifyVisitYmd(int cust_num, String last_visit_ymd) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("cust_num", cust_num);
		data.put("last_visit_ymd", last_visit_ymd);
		sql.update(namespace + ".modifyVisitYmd", data);
		
	}
	@Override
	public void delete(int cust_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", cust_num);
	}

	@Override
	public int count(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".count",strWhere);
	}

	@Override
	public List<CustomerVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomerVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public void deletemodify(int cust_num) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".deletemodify", cust_num);
	}

	@Override
	public List<CustomerVO> listForUser(int mng_user_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listForUser", mng_user_num);
	}

	@Override
	public void modifyMngUser(int mng_user_num, int cust_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("mng_user_num", mng_user_num);
		data.put("cust_num", cust_num);

		sql.update(namespace + ".modifyMngUser", data);
	}

	
	

}
