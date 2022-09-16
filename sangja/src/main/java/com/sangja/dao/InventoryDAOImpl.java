package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.InventoryVO;
import com.sangja.domain.ProductInventoryVO;

@Repository
public class InventoryDAOImpl implements InventoryDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.inventory";
	
	@Override
	public List<InventoryVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public List<ProductInventoryVO> PrdInvList() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".PrdInvList");
	}

	@Override
	public void write(InventoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public InventoryVO view(int prd_mng_num,int user_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("prd_mng_num", prd_mng_num);
		data.put("user_num", user_num);
		
		return sql.selectOne(namespace + ".view", data);
	}

	@Override
	public ProductInventoryVO PrdInvView(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".PrdInvView", prd_mng_num);
	}

	@Override
	public void modify(InventoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int prd_mng_num,int user_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("prd_mng_num", prd_mng_num);
		data.put("user_num", user_num);
		sql.delete(namespace + ".delete", data);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InventoryVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InventoryVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
