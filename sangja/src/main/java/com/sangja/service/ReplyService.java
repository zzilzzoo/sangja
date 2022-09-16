package com.sangja.service;

import java.util.List;

import com.sangja.domain.ReplyVO;

public interface ReplyService {
	// 댓글 조회
	public List<ReplyVO> list(int bno) throws Exception;

	// 댓글 조회
	public void write(ReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(ReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(int rno) throws Exception;

	public void deleteBno(int bno) throws Exception;
}
