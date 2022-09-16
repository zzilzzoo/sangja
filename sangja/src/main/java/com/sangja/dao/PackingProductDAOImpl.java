package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.PackingProductVO;

@Repository
public class PackingProductDAOImpl implements PackingProductDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.packingproduct";
	@Override
	public List<PackingProductVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list");
	}

	@Override
	public List<PackingProductVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listByWhere",strWhere);
	}

	@Override
	public void write(PackingProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);

	}

	@Override
	public PackingProductVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(PackingProductVO vo) throws Exception {
		// TODO Auto-generated method stub

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
	public List<PackingProductVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PackingProductVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
