package com.hf.elearning.user;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hf.elearning.educontents.EduContentsVO;
import com.hf.elearning.educontents.EduMediaVO;

import ntck.model.AjaxResultVO;
import ntck.service.SvcsUserService;
import ntck.util.EncodeUtils;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	private static final String SAVE_PATH = "D:/data/ntckDB/data";

	@Autowired
	private SvcsUserService svcsUserService;

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, Model model, @ModelAttribute("searchVO") UserVO searchVO)
			throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";

		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인

		// 사용자 목록 count
		int totalCount = userService.selectUserListCnt(searchVO);

		// 사용자 목록
		List<UserVO> userList = userService.selectUserList(searchVO);

		if (userList != null) {
			model.addAttribute("userList", userList);
		}
		model.addAttribute("dataCount", totalCount);

		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param = "qw=" + humanfUtil.urlEncode(searchVO.getQw()) + "&q=" + humanfUtil.urlEncode(searchVO.getQ())
				+ "&sortField=" + searchVO.getSortField() + "&sortOrder=" + searchVO.getSortOrder();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param, searchVO.getPageIndex(),
				totalCount, searchVO.getPageUnit(), searchVO.getBlockSize(), request.getContextPath()));

		return "user.userList";
	}

	@RequestMapping(value = "/userDetail", method = RequestMethod.GET)
	public String userDetail(HttpServletRequest request, Model model, @ModelAttribute("userVO") UserVO searchVO)
			throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";

		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인

		// 사용자 목록
		UserVO userVO = userService.selectUserDetail(searchVO);
		if (userVO != null) {
			model.addAttribute("userVO", userVO);
		}

		return "user.userDetail";
	}

	@RequestMapping(value = "/userWrite", method = RequestMethod.GET)
	public String userWriteForm(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userVO") UserVO userVO) throws Exception {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();		
//		if (adminUserVO == null)
//		return "login.loginForm";

		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인

//		logger.info(">>>>" + userVO.getSeq());
		// seq 판단 (수정 or 등록)
		if (userVO.getSeq() != 0) {
			model.addAttribute("userVO", userService.selectUserDetail(userVO));
		}

		return "user.userWrite";
	}

	@RequestMapping(value = "/userWrite", method = RequestMethod.POST)
	public String userWriteSubmit(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userVO") UserVO userVO, MultipartHttpServletRequest request) throws Exception {

		// 등록된 파일 관리하기
		MultipartFile file = request.getFile("file");
		logger.info("넘어온 userVO: " + userVO);
		
		int resultCnt = 0;
		int duplIdCnt = userService.duplUserId(userVO.getId());
		int duplNickCnt = userService.duplNickName(userVO.getNickName());
//		logger.info(">>>>>>아이디중복체크결과 값: "+duplIdCnt);
//		logger.info(">>>>>>닉네임중복체크결과 값: "+duplNickCnt);
		// seq 판단 (수정 or 등록)
		if (userVO.getSeq() == 0 && duplIdCnt == 0 && duplNickCnt == 0) {
//			// 비밀번호 암호화(spring-security Bcrypt)
//			// 디비에 저장할 비밀번호 암호화
//	        String encrypted = BCrypt.hashpw(userVO.getPw(), BCrypt.gensalt());
//	        String originalPW = userVO.getPw();
//			userVO.setPw(encrypted);
			String salt = EncodeUtils.Salt();
//			logger.info(">>>>>> 생성된 salt값: " + salt);
			userVO.setSalt(salt);
			
			String inputPassword = userVO.getPw();
			String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(userVO.getPw(), salt);
//			logger.info(">>>> 암호화된 비밀번호: " + hashedPassword);
			userVO.setPw(hashedPassword);
			//나중에 로그인 할때는, 멤버ID로 salt값을 먼저 가져온다음, 그 값+입력한 비밀번호로 디비에 저장된 비밀번호와 비교
			String hashedPassword2 = EncodeUtils.shaPasswordEncoderWithSalt(inputPassword, salt);
			if(hashedPassword.equals(hashedPassword2)) {
//				logger.info(">>>>>비밀번호 검증 성공");
			} else {
//				logger.info(">>>>>비밀번호 검증 실패");
			}
			
			resultCnt = userService.insertUser(userVO);
			// 로그인시 디비에 저장된 암호화된 문자열과 사용자가 입력한 비밀번호로 checkpw 검증
//			logger.info(">>>>>>비밀번호 검증결과: " + BCrypt.checkpw(originalPW, encrypted)); //추후에 로그인에 사용하기 위해 테스트
			imageUpload(file, userVO);
		} else {
			//사용자수정에서 ID값(개발자도구에서 강제로)변경할시 체크하는부분 
			String checkId = userService.selectIdBySeq(userVO.getSeq());
//			logger.info(">>>>>>>>>>>checkId는: "+checkId);
//			logger.info(">>>>>>>>>>inputId는 : "+userVO.getId());
			if(checkId.equals(userVO.getId())) {
				int userImageCnt = userService.selectImageFileCnt(userVO.getSeq());
				// 대표이미지 변경시 저장소에 있는 이미지 삭제, user_image테이블에서 삭제
				if (!file.isEmpty()) {
					if(userImageCnt != 0) {
						String imageFilePath = userService.selectImageFilePath(userVO.getSeq());
						File imageFile = new File(imageFilePath.replace("data", SAVE_PATH));
						if(imageFile.exists()) {
							imageFile.delete();
//							logger.info(imageFile+"이 삭제되었습니다.");
						}
						userService.deleteImage(userVO.getSeq());
					}
					imageUpload(file, userVO);
				// 대표이미지 있을때, 다른이미지 선택 후 에디터에서 취소 > 저장누를 시 디비의 저장정보+ 파일저장소에서 파일 삭제로직
				} else if(file.isEmpty() && (userVO.getIconFile() == null || userVO.getIconFile().equals(""))) {
					if(userImageCnt != 0) {
						String imageFilePath = userService.selectImageFilePath(userVO.getSeq());
						File imageFile = new File(imageFilePath.replace("data", SAVE_PATH));
						if(imageFile.exists()) {
							imageFile.delete();
//							logger.info(imageFile+"이 삭제되었습니다.");
						}
						userService.deleteImage(userVO.getSeq());
					}
				}
				resultCnt = userService.updateUser(userVO);
			} 
//			logger.info(">>>>>>>>>>>>>resultCnt는: " +resultCnt);
		}
		
		if (resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
			redirectAttributes.addFlashAttribute("userVO", userVO);
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "정상적으로 처리되지않았습니다.");
		}

		return "redirect:./userWrite?seq=" + userVO.getSeq();
	}

	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String userDeleteSubmit(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userVO") UserVO userVO) throws Exception {
		
		int resultCnt = 0;
		// seq 판단 (수정 or 등록)
		if (userVO.getId() != null && userVO.getFilePath() != null) {
			String imageFilePath = userVO.getFilePath();
			File imageFile = new File(imageFilePath.replace("data", SAVE_PATH));
			if(imageFile.exists()) {
				imageFile.delete();
//				logger.info(imageFile+"파일이 삭제되었습니다.");
			}
			userService.deleteImage(userVO.getSeq());
		}
		userService.deleteUser(userVO);
		return "redirect:./userList";
	}

	@RequestMapping(value = "/nickCheck", method = RequestMethod.GET)
	@ResponseBody
	public int nickCheck(@RequestParam("nickName") String nickName) {
		return userService.duplNickName(nickName);
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		return userService.duplUserId(id);
	}

	// 사용자 다중삭제
	@RequestMapping(value = "delUserSeqs", produces = AjaxResultVO.PRODUCE_JSON, method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public AjaxResultVO delUserSeqs(@RequestParam("seqs[]") List<Integer> seqs) throws Exception {

		int result = 0;
		AjaxResultVO resVO = new AjaxResultVO();

		try {
			for (int i = 0; i < seqs.size(); i++) {
				// 첨부파일 확인 후 삭제
//				logger.info(">>>>>>>>>>>>>>>선택한 삭제 번호: " + seqs.get(i));
				String imageFilePath = "";
				int imageFileCnt = userService.selectImageFileCnt(seqs.get(i));
				if (imageFileCnt != 0) {
					imageFilePath = userService.selectImageFilePath(seqs.get(i));
				}

				if (imageFilePath != null) {
					File imageFile = new File(imageFilePath.replace("data", SAVE_PATH));
					if (imageFile.exists()) {
						imageFile.delete();
					}
				}
			}

			userService.delUserSeqs(seqs);
		} catch (Exception ex) {
			ex.printStackTrace();
			resVO.setSuccess(false);
			resVO.setMessage("처리중 오류발생 (오류원인: " + ex.getMessage() + ")");
		}

		return resVO;

	}
	
	// 선택한 파일 경로에 업로드하는 메서드
	public void imageUpload(MultipartFile file, UserVO userVO) throws Exception {

		// 사용자 등록(대표이미지 선택 안했을경우)와 사용자 수정(대표이미지 변경 안했을경우) 파일등록 안되게
		if (file != null && !file.isEmpty()) {
			File fileDir = new File(SAVE_PATH);
			// license 폴더가 없으면 생성
			if (!fileDir.exists()) {
				fileDir.mkdirs();
			}
			
			String originFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String nowDate = sdf.format(new Date());
			
			// 저장파일명을 정의한다 - 파일이름의 중복을 최소화 시키기 위함
			String saveFileName = String.format("%s_%s_%s", userVO.getId(), nowDate, originFileName);
			File saveFile = new File(SAVE_PATH, saveFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 파일 생성 여부 체크
			if (saveFile.exists()) {
//				logger.info(saveFileName + "파일 생성 완료");
			}
			
			UserImageVO userImageVO = new UserImageVO();
			userImageVO.setUserSeq(userVO.getSeq());
			userImageVO.setOriginFileName(originFileName);
			userImageVO.setSaveFileName(saveFileName);
			userImageVO.setFileSize(Long.toString(file.getSize()));
			userImageVO.setFileType(file.getContentType());
			userImageVO.setFilePath("/data/" + saveFileName);
			
			userService.uploadImage(userImageVO);
		}
		
	}

}
