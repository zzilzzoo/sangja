package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.PackingVO;

@Repository
public class PackingDAOImpl implements PackingDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.packing";
	
	@Override
	public List<PackingVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public List<PackingVO> listByWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listByWhere",strWhere);
	}

	@Override
	public void write(PackingVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);

	}

	@Override
	public PackingVO view(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", sale_num);
	}

	@Override
	public void modify(PackingVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
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
	public List<PackingVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PackingVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
