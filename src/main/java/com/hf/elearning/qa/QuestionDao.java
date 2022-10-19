package com.hf.elearning.qa;

import java.util.List;

import com.hf.elearning.notice.BoardFileVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("questionDao")
public interface QuestionDao {

	public abstract List<QuestionVO> selectQuestionList(QuestionVO searchVO);
	
	public abstract int selectQuestionListCnt(QuestionVO searchVO);
	
	public abstract List<QuestionVO> selectQnAList(QuestionVO searchVO);
	
	public abstract int selectQnAListCnt(QuestionVO searchVO);
	
	public abstract List<QuestionVO> selectQuestionListByUserSeq(QuestionVO searchVO);
	
	public abstract QuestionVO selectQuestionDetail(QuestionVO questionVO);
	
	public abstract QuestionVO selectReply(QuestionVO questionVO);
	
	public abstract int insertQuestion(QuestionVO questionVO);
	
	public abstract int insertAnswer(QuestionVO questionVO);
	
	public abstract int updateReplyYN(QuestionVO questionVO);
	
	public abstract int uploadBoardImage(BoardFileVO boardFileVO);
}
