package com.hf.elearning.blike;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("boardLikeService")
public class BoardLikeService implements BoardLikeDao{

	@Resource(name = "boardLikeDao")
	private BoardLikeDao boardLikeDao;
	
	// 좋아요 글 목록 조회
	public List<BoardLikeVO> selectBoardLikeList(BoardLikeVO searchVO){
		return boardLikeDao.selectBoardLikeList(searchVO);
	}
	
	// 좋아요 목록 개수 조회
	public int selectBoardLikeListCnt(BoardLikeVO searchVO){
		return boardLikeDao.selectBoardLikeListCnt(searchVO);
	}
	
	// 좋아요 글 목록 조회
	public BoardLikeStatVO selectBoardLikeStatCountVO(BoardLikeVO searchVO) {
		return boardLikeDao.selectBoardLikeStatCountVO(searchVO);
	}


}
