package com.hf.elearning.educontents;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("eduContentsDao")
public interface EduContentsDao {
	
	public abstract int selectEduContentsListCnt(EduContentsVO searchVO);
	
	public abstract List<EduContentsVO> selectEduContentsList(EduContentsVO searchVO);

	public abstract int insertEduContents(EduContentsVO eduContentsVO);
	
	public abstract int updateEduContents(EduContentsVO eduContentsVO);
	
	public abstract EduContentsVO selectEduContentsDetail(EduContentsVO eduContentsVO);
	
	public abstract int deleteEduContents(EduContentsVO eduContentsVO);
	
	public abstract int delEduContentsSeqs(List<Integer> seqs);
	
	public abstract List<EduContentsVO> webEduContentsList(EduContentsVO searchVO);
	
	public abstract List<MyContentsVO> selectMyContentsList(int userSeq);
	
	public abstract List<EduContentsVO> selectMyEduContentsList(EduContentsVO searchVO);
	
	public abstract int selectMyEduContentsListCnt(int userSeq);
	
	public abstract List<EduContentsVO> selectLikeContentsList(EduContentsVO searchVO);
	
	public abstract int selectLikeContentsListCnt(int userSeq);
	
	public abstract int selectLikeContents(@Param("userSeq") int userSeq, @Param("seq") int boardSeq);
	
	public abstract int selectIsMyContent(@Param("userSeq") int userSeq, @Param("seq") int boardSeq);
	
	public abstract int selectIsMyCart(@Param("userSeq") int userSeq, @Param("seq") int boardSeq);
	
	public abstract int insertMyContent(MyContentsVO myContentsVO);
	
	
	///////첨부파일 관련/////
	
	public abstract int registerEduFile(EduMediaVO eduMediaVO);
	
	public abstract EduMediaVO selectEduFile(EduMediaVO eduMediaVO);
	
	public abstract int deleteEduMedia(EduMediaVO eduMediaVO);
	
	public abstract int selectEduFileCnt(EduMediaVO eduMediaVO);
	
}
