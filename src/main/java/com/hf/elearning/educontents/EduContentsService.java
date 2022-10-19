package com.hf.elearning.educontents;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("eduContentsService")
public class EduContentsService implements EduContentsDao{
	
	@Resource(name = "eduContentsDao")
	private EduContentsDao eduContentsDao;
	
	public int selectEduContentsListCnt(EduContentsVO searchVO) {
		return eduContentsDao.selectEduContentsListCnt(searchVO);
	}
	
	public List<EduContentsVO> selectEduContentsList(EduContentsVO searchVO) {
		return eduContentsDao.selectEduContentsList(searchVO);
	}
	
	public int insertEduContents(EduContentsVO eduContentsVO)  {
		return eduContentsDao.insertEduContents(eduContentsVO);
	}
	
	public int updateEduContents(EduContentsVO eduContentsVO) {
		return eduContentsDao.updateEduContents(eduContentsVO);
	}
	
	public EduContentsVO selectEduContentsDetail(EduContentsVO eduContentsVO) {
		return eduContentsDao.selectEduContentsDetail(eduContentsVO);
	}
	
	public int deleteEduContents(EduContentsVO eduContentsVO) {
		return eduContentsDao.deleteEduContents(eduContentsVO);
	}
	
	public int delEduContentsSeqs(List<Integer> seqs) {
		return eduContentsDao.delEduContentsSeqs(seqs);
	}
	
	public List<EduContentsVO> webEduContentsList(EduContentsVO searchVO) {
		return eduContentsDao.webEduContentsList(searchVO);
	}
	
	public List<MyContentsVO> selectMyContentsList(int userSeq) {
		return eduContentsDao.selectMyContentsList(userSeq);
	}
	
	public List<EduContentsVO> selectMyEduContentsList(EduContentsVO searchVO) {
		return eduContentsDao.selectMyEduContentsList(searchVO);
	}
	
	public int selectMyEduContentsListCnt(int userSeq) {
		return eduContentsDao.selectMyEduContentsListCnt(userSeq);
	}
	
	public List<EduContentsVO> selectLikeContentsList(EduContentsVO searchVO) {
		return eduContentsDao.selectLikeContentsList(searchVO);
	}
	
	public int selectLikeContentsListCnt(int userSeq) {
		return eduContentsDao.selectLikeContentsListCnt(userSeq);
	}
	
	public int selectLikeContents(int userSeq, int boardSeq) {
		return eduContentsDao.selectLikeContents(userSeq, boardSeq);
	}
	
	public int selectIsMyContent(int userSeq, int boardSeq) {
		return eduContentsDao.selectIsMyContent(userSeq, boardSeq);
	}
	
	public int selectIsMyCart(int userSeq, int boardSeq) {
		return eduContentsDao.selectIsMyCart(userSeq, boardSeq);
	}
	
	public int insertMyContent(MyContentsVO myContentsVO) {
		return eduContentsDao.insertMyContent(myContentsVO);
	}
	
	
	/////////////첨부파일관련/////////////
	public int registerEduFile(EduMediaVO eduMediaVO) {
		return eduContentsDao.registerEduFile(eduMediaVO);
	};
	
	public EduMediaVO selectEduFile(EduMediaVO eduMediaVO) {
		return eduContentsDao.selectEduFile(eduMediaVO);
	}
	
	public int deleteEduMedia(EduMediaVO eduMediaVO) {
		return eduContentsDao.deleteEduMedia(eduMediaVO);
	}
	
	public int selectEduFileCnt(EduMediaVO eduMediaVO) {
		return eduContentsDao.selectEduFileCnt(eduMediaVO);
	}
	
}
