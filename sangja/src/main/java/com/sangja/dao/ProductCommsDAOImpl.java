package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.ProductCommsVO;

@Repository
public class ProductCommsDAOImpl implements ProductCommsDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.productcomms";

	@Override
	public List<ProductCommsVO> list(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list", prd_mng_num);
	}

	@Override
	public void write(ProductCommsVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);

	}

	@Override
	public ProductCommsVO view(int prd_mng_num, int user_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("prd_mng_num", prd_mng_num);
		data.put("user_num", user_num);

		return sql.selectOne(namespace + ".view", data);
	}

	@Override
	public void modify(ProductCommsVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int prd_mng_num, int user_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("prd_mng_num", prd_mng_num);
		data.put("user_num", user_num);

		sql.delete(namespace + ".delete", data);
	}

}
