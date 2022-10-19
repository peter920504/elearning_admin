package com.hf.elearning.ulog;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userLogDao")
public interface UserLogDao {

	// 사용자 정보 목록 조회
	public abstract List<UserLogVO> selectUserLogList(UserLogVO searchVO);

	// 사용자 목록 리스트 카운트
	public abstract int selectUserLogListCnt(UserLogVO searchVO);

	// 사용자 정보 단일 조회
//	public abstract UserLogVO selectUserDetail(UserLogVO searchVO);

	// 사용자 정보 삭제
	public abstract int deleteUserLog(UserLogVO userLogVO);

	// 사용자 정보 목록 조회
	public abstract List<UserLogVO> selectUserLogExcelList();

}
