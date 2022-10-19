package com.hf.elearning.blike;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardLikeDao")
public interface BoardLikeDao {
	
	// 좋아요 글 목록 조회
	public abstract List<BoardLikeVO> selectBoardLikeList(BoardLikeVO searchVO);
	
	// 좋아요 글 목록 리스트 카운트
	public abstract int selectBoardLikeListCnt(BoardLikeVO searchVO);
	
	// 좋아요 글 목록 조회
	public abstract BoardLikeStatVO selectBoardLikeStatCountVO(BoardLikeVO searchVO);
	
}
