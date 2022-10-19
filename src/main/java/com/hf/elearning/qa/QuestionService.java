package com.hf.elearning.qa;

import java.util.List;
import javax.annotation.Resource;

import com.hf.elearning.notice.BoardFileVO;

import org.springframework.stereotype.Service;

@Service("questionService")
public class QuestionService implements QuestionDao{

	@Resource(name = "questionDao")
	private QuestionDao questionDao;
	
	public List<QuestionVO> selectQuestionList(QuestionVO searchVO){
		return questionDao.selectQuestionList(searchVO);
	}
	
	public int selectQuestionListCnt(QuestionVO searchVO){
		return questionDao.selectQuestionListCnt(searchVO);
	}
	
	public List<QuestionVO> selectQnAList(QuestionVO searchVO){
		return questionDao.selectQnAList(searchVO);
	}
	
	public int selectQnAListCnt(QuestionVO searchVO){
		return questionDao.selectQnAListCnt(searchVO);
	}
	
	@Override
	public List<QuestionVO> selectQuestionListByUserSeq(QuestionVO questionVO) {
		return questionDao.selectQuestionListByUserSeq(questionVO);
	}
	
	public QuestionVO selectQuestionDetail(QuestionVO questionVO) {
		return questionDao.selectQuestionDetail(questionVO);
	}
	
	public int insertQuestion(QuestionVO questionVO) {
		return questionDao.insertQuestion(questionVO);
	}
	
	public int insertAnswer(QuestionVO questionVO) {
		return questionDao.insertAnswer(questionVO);
	}
	
	@Override
	public QuestionVO selectReply(QuestionVO questionVO) {
		return questionDao.selectReply(questionVO);
	}
	
	@Override
	public int updateReplyYN(QuestionVO questionVO) {
		return questionDao.updateReplyYN(questionVO);
	}

	@Override
	public int uploadBoardImage(BoardFileVO boardFileVO) {
		return questionDao.uploadBoardImage(boardFileVO);
	}
}

