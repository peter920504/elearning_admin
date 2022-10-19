package com.hf.elearning.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hf.elearning.blike.BoardLikeVO;
import com.hf.elearning.educontents.EduContentsVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userDao")
public interface UserDao {

	// 사용자 정보 목록 조회
	public abstract List<UserVO> selectUserList(UserVO searchVO);

	// 사용자 목록 리스트 카운트
	public abstract int selectUserListCnt(UserVO searchVO);

	// 사용자 정보 단일 조회
	public abstract UserVO selectUserDetail(UserVO searchVO);

	// 사용자 정보 등록
	public abstract int insertUser(UserVO userVO);

	// 사용자 아이디 중복 체크
	public abstract int duplUserId(String id);

	// 사용자 닉네임 중복 체크
	public abstract int duplNickName(String nickName);

	// 사용자 정보 수정
	public abstract int updateUser(UserVO userVO);

	// 사용자 정보 삭제
	public abstract int deleteUser(UserVO userVO);

	// 체크박스 선택한 번호의 이미지파일 개수 count
	public abstract int selectImageFileCnt(int seq);

	// 체크박스 선택한 번호의 이미지파일경로 가져오기
	public abstract String selectImageFilePath(int seq);

	// 체크박스 선택 유저 삭제
	public abstract int delUserSeqs(List<Integer> seqs);

	// 대표이미지 데이터 업로드
	public abstract int uploadImage(UserImageVO userImageVO);

	// 대표이미지 데이터 삭제
	public abstract int deleteImage(int seq);

	// seq로 ID값 가져오기
	public abstract String selectIdBySeq(int seq);

	/* ---------------------웹서비스 파트------------------------- */

	// id로 salt값 가져오기
	public abstract String selectSaltById(String id);

	// id와 pw로 해당 사용자 맞는지 검증
	public abstract int loginCheck(@Param("id") String id, @Param("pw") String pw);

	// id로 해당 사용자 정보 가져오기
	public abstract UserVO getUserById(String id);
	
	// 비밀번호 찾기로 유저 비밀번호 변경
	public abstract int updateUserPw(UserVO userVO);

	// profile section1내용 업데이트
	public abstract int updateProfile1(UserVO userVO);

	// profile section2내용 업데이트
	public abstract int updateProfile2(UserVO userVO);

	// profile section3내용 업데이트
	public abstract int updateProfile3(UserVO userVO);

	// addWishList
	public abstract int addWishList(BoardLikeVO blike);

	// delWishList
	public abstract int delWishList(BoardLikeVO blike);
	
	// addCart
	public abstract int addCart(MyCartVO cartVO);
	
	// 내 장바구니 목록 가져오기
	public abstract List<EduContentsVO> selectCartContentsList(int userSeq);
}
