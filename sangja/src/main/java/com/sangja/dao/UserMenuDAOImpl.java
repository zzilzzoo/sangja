package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.UserMenuVO;

@Repository
public class UserMenuDAOImpl implements UserMenuDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.usermenu";

	@Override
	public List<UserMenuVO> list(int user_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list", user_num);
	}

	@Override
	public void write(UserMenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public UserMenuVO view(int user_num, int menu_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("user_num", user_num);
		data.put("menu_num", menu_num);
		
		return sql.selectOne(namespace + ".view",data);
	}

	@Override
	public void modify(UserMenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int user_num, int menu_num) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("user_num", user_num);
		data.put("menu_num", menu_num);		

		sql.delete(namespace + ".delete", data);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserMenuVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserMenuVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
	public void deleteAll(int user_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteAll", user_num);

	}

}
