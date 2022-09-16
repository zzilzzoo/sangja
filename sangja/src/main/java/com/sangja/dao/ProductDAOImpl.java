package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.product";

	@Override
	public List<ProductVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	@Override
	public List<ProductVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listByWhere",strWhere);
	}
	@Override
	public void write(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public ProductVO view(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", prd_mng_num);
	}
	@Override
	public ProductVO viewByUpc(String upc_code) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".viewByUpc",upc_code);
	}
	@Override
	public void modify(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", prd_mng_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
