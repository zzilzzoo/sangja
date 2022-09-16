package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.UserMenuDAO;
import com.sangja.domain.UserMenuVO;

@Service
public class UserMenuServiceImpl implements UserMenuService {

	@Inject
	private UserMenuDAO dao;

	@Override
	public List<UserMenuVO> list(int user_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(user_num);
	}

	@Override
	public void write(UserMenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public UserMenuVO view(int user_num, int menu_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(user_num, menu_num);
	}

	@Override
	public void modify(UserMenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int user_num, int menu_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(user_num, menu_num);
	}

	@Override
	public void deleteAll(int user_num) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAll(user_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<UserMenuVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<UserMenuVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(searchType, keyword);
	}

}
