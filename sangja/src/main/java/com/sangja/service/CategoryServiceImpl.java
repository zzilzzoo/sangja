package com.sangja.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sangja.dao.CategoryDAO;
import com.sangja.domain.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	private CategoryDAO dao;

	@Override
	public List<CategoryVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public CategoryVO view(int ctgry_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(ctgry_mng_num);
	}

	@Override
	public void modify(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int ctgry_mng_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(ctgry_mng_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

	@Override
	public List<CategoryVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<CategoryVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
