package com.sangja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sangja.domain.SalePayRecVO;
import com.sangja.domain.SaleVO;

@Repository
public class SalePayRecDAOImpl implements SalePayRecDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.sangja.mappers.salepayrec";

	@Override
	public List<SalePayRecVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public List<SalePayRecVO> salepaylist(String sale_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listBysalenum", sale_num);
	}
	@Override
	public List<SalePayRecVO> salepaylistBysalenums(List<SaleVO> sale_list) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listBysalenums", sale_list);
	}
	@Override
	public void write(SalePayRecVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.selectList(namespace + ".write", vo);

	}

	@Override
	public SalePayRecVO view(int pay_num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(SalePayRecVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int pay_num) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SalePayRecVO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SalePayRecVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
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
