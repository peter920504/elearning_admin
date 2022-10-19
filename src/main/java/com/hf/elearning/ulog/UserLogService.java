package com.hf.elearning.ulog;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("userLogService")
public class UserLogService implements UserLogDao{

	@Resource(name = "userLogDao")
	private UserLogDao userLogDao;
	
	// 사용자로그 정보 목록 조회
	public List<UserLogVO> selectUserLogList(UserLogVO searchVO){
		return userLogDao.selectUserLogList(searchVO);
	}
	
	// 사용자로그 목록 리스트 개수 카운트
	public int selectUserLogListCnt(UserLogVO searchVO){
		return userLogDao.selectUserLogListCnt(searchVO);
	}
	
	// 사용자 정보 단일 조회
//	public UserLogVO selectUserLogDetail(UserLogVO searchVO) {
//		return UserLogDao.selectUserLogDetail(searchVO);
//	}
	
	// 사용자로그 정보 삭제
	public int deleteUserLog(UserLogVO userLogVO) {
		return userLogDao.deleteUserLog(userLogVO);
	}
	
	// 사용자로그 정보 엑셀 목록 조회
	public List<UserLogVO> selectUserLogExcelList() {
		return userLogDao.selectUserLogExcelList();
	}

}
