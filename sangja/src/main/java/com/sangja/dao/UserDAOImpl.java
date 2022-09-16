package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.user";

	@Override
	public List<UserVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	
	@Override
	public List<UserVO> listbyWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listByWhere",strWhere);
	}

	@Override
	public void write(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public UserVO view(int user_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", user_num);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int user_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", user_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public List<UserVO> listForProduct(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listForProduct", prd_mng_num);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".login", vo);		
	}

	@Override
	public int idCheck(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".idcheck",user_id);
	}

	

}
