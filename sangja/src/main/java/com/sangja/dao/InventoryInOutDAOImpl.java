package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.InventoryInOutVO;
import com.sangja.domain.InventoryUserVO;

@Repository
public class InventoryInOutDAOImpl implements InventoryInOutDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.inventoryinout";
	
	@Override
	public List<InventoryInOutVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(InventoryInOutVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public InventoryInOutVO view(int mng_no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", mng_no);
	}

	@Override
	public void delete(int mng_no) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", mng_no);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InventoryInOutVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InventoryInOutVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public List<InventoryUserVO> InvIOUserList(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".InvIOUserList",prd_mng_num);
	}

}
