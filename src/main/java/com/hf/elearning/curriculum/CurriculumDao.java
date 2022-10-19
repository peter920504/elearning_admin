package com.hf.elearning.curriculum;

import java.util.HashMap;
import java.util.List;

import com.hf.elearning.educontents.EduContentsVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("curriculumDao")
public interface CurriculumDao {
	
	public abstract int selectCurriculumListCnt(CurriculumVO searchVO);
	
	public abstract List<CurriculumVO> selectCurriculumList(CurriculumVO searchVO);
	
	public abstract CurriculumVO selectCurriculumDetail(CurriculumVO curriculumVO);
	
	//교육과정 등록시 컨텐츠 목록 검색(조회)
	public abstract int getContentsByNameCnt(CurriculumVO searchVO);
	public abstract List<EduContentsVO> getContentsByName(CurriculumVO searchVO);
	
	//교육과정 등록
	public abstract int insertCurriculum(CurriculumVO curriculumVO);
	
	//교육과정 수정
	public abstract int updateCurriculum(CurriculumVO curruculumVO);
	
	//교육과정 삭제
	public abstract int deleteCurriculum(CurriculumVO curriculumVO);
	
	//교육과정 다중삭제
	public abstract int delCurriculumSeqs(List<Integer> seqs);
	
	//등록된 교육과정 개수 불러오기
	public abstract int getCurrentCount(CurriculumVO curriculumVO);
	
	//등록된 예정강의수 불러오기
	public abstract int getClassCount(CurriculumVO curriculumVO);
	
	//이미 등록된 강의차수인지 확인
	public abstract int checkClassCount(CurriculumVO curriculumVO);
	
	//강의 영상 내 재생목록 
	public abstract List<CurriculumVO> selectCurriculumReplayList(HashMap<String, Object> searchMap);
	
	//completeYN 포함된 교육과정 목록
	public abstract List<CurriculumVO> selectCompleteCuriList(HashMap<String, Object> map);
	
	//completeYN 개수
	public abstract int completeCount(HashMap<String, Object> map);
}
