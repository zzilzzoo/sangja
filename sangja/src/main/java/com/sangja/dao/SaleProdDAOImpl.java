package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.SaleProdVO;
import com.sangja.domain.SaleVO;

@Repository
public class SaleProdDAOImpl implements SaleProdDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.saleprod";

	@Override
	public List<SaleProdVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public List<SaleProdVO> listBySaleNum(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listBysalenum", sale_num);
	}

	@Override
	public List<SaleProdVO> listBySaleNums(List<SaleVO> sale_list) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listBysalenums", sale_list);
	}
	
	@Override
	public void write(SaleProdVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public SaleProdVO view(int sale_prod_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".view", sale_prod_num);
	}

	@Override
	public void modify(SaleProdVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);

	}

	@Override
	public void delete(int sale_prod_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", sale_prod_num);
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
	public List<SaleProdVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SaleProdVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
