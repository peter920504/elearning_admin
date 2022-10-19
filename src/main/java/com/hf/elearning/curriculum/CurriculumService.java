package com.hf.elearning.curriculum;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hf.elearning.educontents.EduContentsVO;

@Service("curriculumService")
public class CurriculumService implements CurriculumDao{
	
	@Resource(name = "curriculumDao")
	private CurriculumDao curriculumDao;
	
	public int selectCurriculumListCnt(CurriculumVO searchVO) {
		return curriculumDao.selectCurriculumListCnt(searchVO);
	}
	
	public List<CurriculumVO> selectCurriculumList(CurriculumVO searchVO) {
		return curriculumDao.selectCurriculumList(searchVO);
	}
	
	public CurriculumVO selectCurriculumDetail(CurriculumVO curriculumVO) {
		return curriculumDao.selectCurriculumDetail(curriculumVO);
	}
	
	//교육과정 등록시 컨텐츠 목록 검색(조회)
	public int getContentsByNameCnt(CurriculumVO searchVO) {
		return curriculumDao.getContentsByNameCnt(searchVO);
	}
	
	public List<EduContentsVO> getContentsByName(CurriculumVO searchVO) {
		return curriculumDao.getContentsByName(searchVO);
	}
	
	//교육과정 등록
	public int insertCurriculum(CurriculumVO curriculumVO) {
		return curriculumDao.insertCurriculum(curriculumVO);
	};
	
	//교육과정 수정
	public int updateCurriculum(CurriculumVO curriculumVO) {
		return curriculumDao.updateCurriculum(curriculumVO);
	}
	
	//교육과정 삭제
	public int deleteCurriculum(CurriculumVO curriculumVO) {
		return curriculumDao.deleteCurriculum(curriculumVO);
	}
	
	//교육과정 다중삭제
	public int delCurriculumSeqs(List<Integer> seqs) {
		return curriculumDao.delCurriculumSeqs(seqs);
	}
	
	//등록된 교육과정 개수 불러오기
	public int getCurrentCount(CurriculumVO curriculumVO) {
		return curriculumDao.getCurrentCount(curriculumVO);
	}
	
	//등록된 예정강의수 불러오기
	public int getClassCount(CurriculumVO curriculumVO) {
		return curriculumDao.getClassCount(curriculumVO);
	}
	
	//이미 등록된 강의차수인지 확인
	public int checkClassCount(CurriculumVO curriculumVO) {
		return curriculumDao.checkClassCount(curriculumVO);
	}

	@Override
	public List<CurriculumVO> selectCurriculumReplayList(HashMap<String, Object> searchMap) {
		return curriculumDao.selectCurriculumReplayList(searchMap);
	}
	
	//completeYN 포함된 교육과정 목록
	public List<CurriculumVO> selectCompleteCuriList(HashMap<String, Object> map) {
		return curriculumDao.selectCompleteCuriList(map);
	}
	
	//completeYN 개수
	public int completeCount(HashMap<String, Object> map) {
		return curriculumDao.completeCount(map);
	};
	
}
