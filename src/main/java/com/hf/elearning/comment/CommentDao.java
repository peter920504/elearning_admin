package com.hf.elearning.comment;

import java.util.List;



import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commentDao")
public interface CommentDao {

	public abstract List<CommentVO> selectCommentList(CommentVO searchVO);
	
	public abstract int selectCommentListCnt(CommentVO searchVO);
	
	public abstract int insertComment(CommentVO CommentVO);
	
	public abstract CommentVO selectCommentDetail(CommentVO CommentVO);
	
	public abstract int updateComment(CommentVO CommentVO);
	
	public abstract int deleteComment(CommentVO CommentVO);

	public abstract int insertMyComment(CommentVO CommentVO);
	
	//후기 존재 여부
	public abstract int commentYN(CommentVO commentVO);
}


