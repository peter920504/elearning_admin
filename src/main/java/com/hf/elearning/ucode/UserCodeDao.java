package com.hf.elearning.ucode;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userCodeDao")
public interface UserCodeDao {

	// 사용자 정보 목록 조회
	public abstract List<UserCodeVO> selectUserCodeList(UserCodeVO searchVO);

	// 사용자 코드 목록 조회
	public abstract List<CodeListVO> selectCodeList(CodeListVO codeListVO);

	// 사용자 코드유형 상세목록 조회
	public abstract UserCodeVO selectUserCodeDetail(UserCodeVO userCodeVO);

	// 사용자 코드유형 등록
	public abstract int insertUserCode(UserCodeVO userCodeVO);

	// 사용자 코드유형 수정
	public abstract int updateUserCode(UserCodeVO userCodeVO);

	// 사용자 코드유형 삭제
	public abstract int deleteUserCode(UserCodeVO userCodeVO);

	// 코드값 중복체크
	public abstract int duplTypeCode(UserCodeVO userCodeVO);
}
