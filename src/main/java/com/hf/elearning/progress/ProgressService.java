package com.hf.elearning.progress;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hf.elearning.category.CategoryDao;

@Service("progressService")
public class ProgressService implements ProgressDao{

	@Resource(name = "progressDao")
	private ProgressDao progressDao;
	
	@Resource(name = "categoryDao")
	private CategoryDao categoryDao;

	@Override
	public List<ProgressVO> selectProgressList(ProgressVO searchVO) {
		return progressDao.selectProgressList(searchVO);
	}

	@Override
	public int selectProgressListCnt(ProgressVO searchVO) {
		return progressDao.selectProgressListCnt(searchVO);
	}
	
	public ProgressVO selectProgressDetail(ProgressVO progressVO) {
		progressVO = progressDao.selectProgressDetail(progressVO);
		progressVO.getContentsVO().setCate1Name(categoryDao.getTitleBySeq(progressVO.getContentsVO().getCate1()));
		progressVO.getContentsVO().setCate2Name(categoryDao.getTitleBySeq(progressVO.getContentsVO().getCate2()));
		progressVO.getContentsVO().setCate3Name(categoryDao.getTitleBySeq(progressVO.getContentsVO().getCate3()));
		
		System.out.println("junk : "+progressVO.getContentsVO());
		
		return progressVO;
	}
	
	@Override
	public ProgressVO selectProgressRecord(ProgressVO progressVO) {
		return progressDao.selectProgressRecord(progressVO);
	}
	
	@Override
	public int selectProgressRecordCnt(ProgressVO progressVO) {
		return progressDao.selectProgressRecordCnt(progressVO);
	}

	@Override
	public int insertProgress(ProgressVO progressVO) {
		return progressDao.insertProgress(progressVO);
	}
	
	@Override
	public int updateProgressReplayInfo(ProgressVO progressVO) {
		return progressDao.updateProgressReplayInfo(progressVO);
	}

	
	
}
