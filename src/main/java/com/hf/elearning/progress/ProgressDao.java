package com.hf.elearning.progress;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("progressDao")
public interface ProgressDao {
	
	public abstract List<ProgressVO> selectProgressList(ProgressVO searchVO);
	
	public abstract int selectProgressListCnt(ProgressVO searchVO);
	
	public abstract ProgressVO selectProgressDetail(ProgressVO progressVO);
	
	public abstract ProgressVO selectProgressRecord(ProgressVO progressVO);
	
	public abstract int selectProgressRecordCnt(ProgressVO progressVO);

	public abstract int insertProgress(ProgressVO progressVO);
	
	public abstract int updateProgressReplayInfo(ProgressVO progressVO);
}
