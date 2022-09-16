package com.sangja.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sangja.domain.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Override
	public List<MenuVO> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void write(MenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MenuVO view(int menu_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(MenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int menu_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MenuVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
