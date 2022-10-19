package com.hf.elearning.comment;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentService implements CommentDao {

	@Resource(name = "commentDao")
	private CommentDao commentDao;
	
	public List<CommentVO> selectCommentList(CommentVO searchVO){
		return commentDao.selectCommentList(searchVO);
	}
	
	public int selectCommentListCnt(CommentVO searchVO){
		return commentDao.selectCommentListCnt(searchVO);
	}
	
	public int insertComment(CommentVO commentVO) {
		return commentDao.insertComment(commentVO);
	}
	
	public CommentVO selectCommentDetail(CommentVO commentVO) {
		return commentDao.selectCommentDetail(commentVO);
	}
	
	public int updateComment(CommentVO commentVO) {
		return commentDao.updateComment(commentVO);
	}
	
	public int deleteComment(CommentVO commentVO) {
		return commentDao.deleteComment(commentVO);
	}
	
	public int insertMyComment(CommentVO commentVO) {
		return commentDao.insertMyComment(commentVO);
	}
	
	//후기 존재 여부
	public int commentYN(CommentVO commentVO) {
		return commentDao.commentYN(commentVO);
	}
}
