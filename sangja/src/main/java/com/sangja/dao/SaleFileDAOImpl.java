package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.SaleFileVO;
import com.sangja.domain.SaleVO;

@Repository
public class SaleFileDAOImpl implements SaleFileDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.salefile";
	
	@Override
	public List<SaleFileVO> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaleFileVO> listBySaleNum(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaleFileVO> listBySaleNums(List<SaleVO> sale_list) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void write(SaleFileVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public SaleFileVO view(String file_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", file_num);
	}
	
	@Override
	public SaleFileVO viewBySaleNum(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".viewbysalenum", sale_num);
	}

	@Override
	public void modify(SaleFileVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String file_num) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAll(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteAll", sale_num);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SaleFileVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaleFileVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
