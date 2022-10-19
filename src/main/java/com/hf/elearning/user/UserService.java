package com.hf.elearning.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hf.elearning.blike.BoardLikeVO;
import com.hf.elearning.educontents.EduContentsVO;
import com.hf.elearning.educontents.EduMediaVO;

@Service("userService")
public class UserService implements UserDao {

	@Resource(name = "userDao")
	private UserDao userDao;

	// 사용자 정보 목록 조회
	public List<UserVO> selectUserList(UserVO searchVO) {
		return userDao.selectUserList(searchVO);
	}

	// 사용자 목록 리스트 개수 카운트
	public int selectUserListCnt(UserVO searchVO) {
		return userDao.selectUserListCnt(searchVO);
	}

	// 사용자 정보 단일 조회
	public UserVO selectUserDetail(UserVO searchVO) {
		return userDao.selectUserDetail(searchVO);
	}

	// 사용자 정보 등록
	public int insertUser(UserVO userVO) {
		return userDao.insertUser(userVO);
	}

	// 사용자 아이디 중복 체크
	public int duplUserId(String id) {
		return userDao.duplUserId(id);
	}

	// 사용자 닉네임 중복 체크
	public int duplNickName(String nickName) {
		return userDao.duplNickName(nickName);
	}

	// 사용자 정보 수정
	public int updateUser(UserVO userVO) {
		return userDao.updateUser(userVO);
	}

	// 사용자 정보 삭제
	public int deleteUser(UserVO userVO) {
		return userDao.deleteUser(userVO);
	}

	// 체크박스 선택한 번호의 이미지파일 개수 count
	public int selectImageFileCnt(int seq) {
		return userDao.selectImageFileCnt(seq);
	}

	// 체크박스 선택한 번호의 이미지파일경로 가져오기
	public String selectImageFilePath(int seq) {
		return userDao.selectImageFilePath(seq);
	}

	// 체크박스 선택 유저 삭제
	public int delUserSeqs(List<Integer> seqs) {
		return userDao.delUserSeqs(seqs);
	}

	// 대표이미지 데이터 업로드
	public int uploadImage(UserImageVO userImageVO) {
		return userDao.uploadImage(userImageVO);
	}

	// 대표이미지 데이터 삭제
	public int deleteImage(int seq) {
		return userDao.deleteImage(seq);
	}

	// seq로 ID값 가져오기
	public String selectIdBySeq(int seq) {
		return userDao.selectIdBySeq(seq);
	}

	/* ---------------------웹서비스 파트------------------------- */

	// id로 salt값 가져오기
	public String selectSaltById(String id) {
		return userDao.selectSaltById(id);
	}

	// id와 pw로 해당 사용자 맞는지 검증
	public int loginCheck(String id, String pw) {
		return userDao.loginCheck(id, pw);
	}

	// id로 해당 사용자 정보 가져오기
	public UserVO getUserById(String id) {
		return userDao.getUserById(id);
	}
	
	// 비밀번호 찾기로 유저 비밀번호 변경
	public int updateUserPw(UserVO userVO) {
		return userDao.updateUserPw(userVO);
	}

	// profile section1내용 업데이트
	public int updateProfile1(UserVO userVO) {
		return userDao.updateProfile1(userVO);
	}

	// profile section2내용 업데이트
	public int updateProfile2(UserVO userVO) {
		return userDao.updateProfile2(userVO);
	}

	// profile section3내용 업데이트
	public int updateProfile3(UserVO userVO) {
		return userDao.updateProfile3(userVO);
	}

	// addWishList
	public int addWishList(BoardLikeVO blike) {
		return userDao.addWishList(blike);
	}

	// deleteWishList
	public int delWishList(BoardLikeVO blike) {
		return userDao.delWishList(blike);
	}
	
	// addCart
	public int addCart(MyCartVO cartVO) {
		return userDao.addCart(cartVO);
	}
	
	// 내 장바구니 목록 가져오기
	public List<EduContentsVO> selectCartContentsList(int userSeq) {
		return userDao.selectCartContentsList(userSeq);
	}
}
