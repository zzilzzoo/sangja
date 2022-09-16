package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.UserDAO;
import com.sangja.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public List<UserVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	@Override
	public List<UserVO> listbyWhere(String strWhere) throws Exception {
		// TODO Auto-generated method stub
		return dao.listbyWhere(strWhere);
	}
	@Override
	public void write(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public UserVO view(int user_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(user_num);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int user_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(user_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<UserVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<UserVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(searchType, keyword);
	}

	@Override
	public List<UserVO> listForProduct(int prd_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.listForProduct(prd_mng_num);
	}
	@Override
	public UserVO login(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}
	@Override
	public int idCheck(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(user_id);
	}

	

}
