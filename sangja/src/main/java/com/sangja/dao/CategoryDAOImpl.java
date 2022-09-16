package com.sangja.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.category";

	@Override
	public List<CategoryVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public CategoryVO view(int ctgry_mng_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", ctgry_mng_num);
	}

	@Override
	public void modify(CategoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int ctgry_mng_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", ctgry_mng_num);
	}

	@Override
	public void deletemodify(int ctgry_mng_num) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".deletemodify", ctgry_mng_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".count");
	}

	@Override
	public List<CategoryVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CategoryVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);

		return sql.selectList(namespace + ".listPageSearch", data);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword", keyword);

		return sql.selectOne(namespace + ".searchCount", data);
	}

}
