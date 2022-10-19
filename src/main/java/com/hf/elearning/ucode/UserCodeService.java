package com.hf.elearning.ucode;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("userCodeService")
public class UserCodeService implements UserCodeDao {

	@Resource(name = "userCodeDao")
	private UserCodeDao userCodeDao;

	// 사용자 코드유형 목록 조회
	public List<UserCodeVO> selectUserCodeList(UserCodeVO searchVO) {
		return userCodeDao.selectUserCodeList(searchVO);
	}

	// 코드유형 조회
	public List<CodeListVO> selectCodeList(CodeListVO codeListVO) {
		return userCodeDao.selectCodeList(codeListVO);
	}

	// 사용자 코드유형 상세목록 조회
	public UserCodeVO selectUserCodeDetail(UserCodeVO userCodeVO) {
		return userCodeDao.selectUserCodeDetail(userCodeVO);
	}

	// 사용자 코드유형 등록
	public int insertUserCode(UserCodeVO userCodeVO) {
		return userCodeDao.insertUserCode(userCodeVO);
	}

	// 사용자 코드유형 수정
	public int updateUserCode(UserCodeVO userCodeVO) {
		return userCodeDao.updateUserCode(userCodeVO);
	}

	// 사용자 코드유형 삭제
	public int deleteUserCode(UserCodeVO userCodeVO) {
		return userCodeDao.deleteUserCode(userCodeVO);
	}
	
	// 코드값 중복체크
	public int duplTypeCode(UserCodeVO userCodeVO) {
		return userCodeDao.duplTypeCode(userCodeVO);
	}
	
}
