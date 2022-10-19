package com.hf.elearning.user;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.hf.elearning.blike.BoardLikeVO;
import com.hf.elearning.educontents.EduContentsService;
import com.hf.elearning.educontents.EduContentsVO;
import com.hf.elearning.educontents.MyContentsVO;

import ntck.service.util.SendMailUtil;
import ntck.util.EncodeUtils;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/account")
public class WebUserController {

	private static final Logger logger = LoggerFactory.getLogger(WebUserController.class);
	private static final String SESSION_ID = "sessionId";
	private static final String SESSION_FIND_ID = "sessionFindId";
	private static final String SESSION_CODE = "sessionCode";
	private static final String SAVE_PATH = "D:/data/ntckDB/data";

//	@Autowired
//	private JwtUtil jwtUtil;
//	@Autowired
//	private CookieUtil cookieUtil;
//    @Autowired
//    private RedisUtil redisUtil;

	@Resource(name = "userService")
	private UserService userService;

	@Autowired
	private EduContentsService eduContentsService;

	@Autowired
//	private KakaoService kakaoService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLoginPage() throws Exception {
		return "front.login";
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	@ResponseBody
	public int getLoginCheck(@RequestParam("id") String id, @RequestParam("pw") String pw) throws Exception {
//		logger.info("id는:" + id);
//		logger.info("pw는:" + pw);
		String salt = userService.selectSaltById(id);
		pw = EncodeUtils.shaPasswordEncoderWithSalt(pw, salt);

		return userService.loginCheck(id, pw);
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String getLogin(Model model, @ModelAttribute("searchVO") UserVO searchVO, @RequestParam(value="referer", required=false) String referer, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
//		logger.info(">>>>>넘어온 email값: " + searchVO.getId());
//		logger.info(">>>>>>>>넘어온 비밀번호값: " + searchVO.getPw());
		String destURI = "";
		String preURI = referer;
		UserVO userVO = userService.getUserById(searchVO.getId());
//		System.out.println(userVO);
//		if (userVO.getId() != null) {
//			model.addAttribute("userVO", userService.selectUserDetail(userVO));
//		}
		if (userVO != null) {
			// 로그인 성공 처리
			// 세션이 있으면 있는 세션 반환, 없으면 신규 세션 생성
			HttpSession session = req.getSession();

			// 세션에 로그인 회원 정보 보관
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600); // 세션 유지기간 60분
			destURI = (String) session.getAttribute("destination");
			session.removeAttribute("destination");
			if (destURI == null) {
				return "redirect:" + preURI;
			}
//			logger.info("destURI:" + destURI);
		}

		/*
		 * jwt 토큰 발행부분 final String token = jwtUtil.generateToken(searchVO); final
		 * String refreshJwt = jwtUtil.generateRefreshToken(searchVO); Cookie
		 * accessToken = cookieUtil.createCookie(JwtUtil.ACCESS_TOKEN_NAME, token);
		 * Cookie refreshToken = cookieUtil.createCookie(JwtUtil.REFRESH_TOKEN_NAME,
		 * refreshJwt); // redisUtil.setDataExpire(refreshJwt, searchVO.getId(),
		 * JwtUtil.REFRESH_TOKEN_VALIDATION_SECOND); res.addCookie(accessToken);
		 * res.addCookie(refreshToken); logger.info(token); // return new
		 * Response("success", "로그인에 성공했습니다.", token);
		 */

		return "redirect:" + destURI;
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getLogout(HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null || session != null) {
//			logger.info(">>>>>>>> 세션정보는: " + session.getAttribute(SESSION_ID));
			session.invalidate();
//			logger.info(">>>>>>>>>> 로그아웃 되었습니다.");
		}

		return "redirect:/";
	}

	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(HttpServletRequest req) throws Exception {
		return "front.signUp";
	}

	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpSubmit(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws Exception {
//		logger.info("넘어온 userVO: " + userVO);

		int resultCnt = 0;
		int duplIdCnt = userService.duplUserId(userVO.getId());
		int duplNickCnt = userService.duplNickName(userVO.getNickName());

//		logger.info("dryrain>>>>>>컨트롤러 아이디중복체크결과 값: " + duplIdCnt);
//		logger.info("dryrain>>>>>>컨트롤러 닉네임중복체크결과 값: " + duplNickCnt);

		if (duplIdCnt == 0 && duplNickCnt == 0) {
			String salt = EncodeUtils.Salt();
//			logger.info(">>>>>> 생성된 salt값: " + salt);
			userVO.setSalt(salt);

			String inputPassword = userVO.getPw();
			String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(userVO.getPw(), salt);
//			logger.info("dryrain>>>>>>>암호화된 비밀번호: " + hashedPassword);
			userVO.setPw(hashedPassword);
			resultCnt = userService.insertUser(userVO);
//			logger.info("dryrain>>>>>>>resultCnt는: " + resultCnt);
		}

		if (resultCnt > 0) {
			// 세션에 로그인 회원 정보 보관
			userVO = userService.getUserById(userVO.getId());
			HttpSession session = req.getSession();
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600); // 세션 유지기간 60분

			redirectAttributes.addFlashAttribute("write_ok_message", "회원가입이 완료되었습니다!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "정상적으로 처리되지않았습니다.");
		}
		return "redirect:/";
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

	@RequestMapping(value = "/pwCheck", method = RequestMethod.GET)
	@ResponseBody
	public int pwCheck(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		String salt = userService.selectSaltById(id);
		pw = EncodeUtils.shaPasswordEncoderWithSalt(pw, salt);

		return userService.loginCheck(id, pw);
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/findPW", method = RequestMethod.GET)
	public String findPassword(HttpServletRequest req) throws Exception {

		return "front.findPW";
	}
	
	// 비밀번호 찾기(메일로 인증번호 발급)
	@RequestMapping(value = "/findPW2", method = RequestMethod.POST)
	public String findPassword2(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req) throws Exception {
		int pwCode = ThreadLocalRandom.current().nextInt(100000, 1000000);
		SendMailUtil sendMail = new SendMailUtil();
//		if(userVO.getId().contains("gmail.com")) {
//			sendMail.sendGoogleMail(userVO.getId(), pwCode);
//		} else if(userVO.getId().contains("naver.com")) {
//			sendMail.sendNaverMail(userVO.getId(), pwCode);
//		} else {
//			sendMail.sendGoogleMail(userVO.getId(), pwCode);
//		}
		sendMail.sendGoogleMail(userVO.getId(), pwCode);
		HttpSession session = req.getSession();

		// 세션에 로그인 회원 정보 보관
		session.setAttribute(SESSION_CODE, pwCode);
		session.setAttribute(SESSION_FIND_ID, userVO.getId());
		session.setMaxInactiveInterval(300); // 세션 유지기간 5분
		
		return "front.findPW2";
	}
	
	// 비밀번호 찾기(인증번호 체크 후 새 비밀번호 입력창 이동)
	@RequestMapping(value = "/findPW3", method = RequestMethod.POST)
	public String findPassword3(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		if(session.getAttribute(SESSION_FIND_ID) != null) {
			session.removeAttribute(SESSION_CODE);
			session.setMaxInactiveInterval(3600); //세션 유지기간 60분
			return "front.findPW3";
		}
		else {
			return "/";
		}
	}
	
	// 비밀번호 찾기(비밀번호 유효성 체크 후 성공 시 로그인 페이지로 이동)
	@RequestMapping(value = "/findPW4", method = RequestMethod.POST)
	public String findPassword4(HttpServletRequest req, RedirectAttributes redirectAttributes) throws Exception {
		
		HttpSession session = req.getSession();
		UserVO userVO = new UserVO();
		userVO.setId((String)session.getAttribute(SESSION_FIND_ID));
		String salt = EncodeUtils.Salt();
		userVO.setSalt(salt);
		String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(req.getParameter("pw"), salt);
		userVO.setPw(hashedPassword);
		
		int resultCnt = userService.updateUserPw(userVO);
		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "비밀번호 변경이 완료되었습니다!");
			return "redirect:/";
			
		} else {
			return "front.findPW3";
		}
	}

	// kakao로그인 요청을 처리한다.
	@RequestMapping(value = "/kakao_callback", method = RequestMethod.POST)
	public String loginWithKakao(@ModelAttribute UserVO formUser, @RequestParam(value="referer", required=false)String referer, HttpSession session) throws IOException {
		
//		logger.info("dryrain>>>>>>>>>>>카카오 로그인 인증정보:" + formUser);
		
		if (userService.getUserById(formUser.getId()) == null) {
//			logger.info("dryrain>>>>>>>>>>>>>>>>>> 카카오로 회원가입");
			formUser.setTypeCode("01");
			formUser.setIsSocial("Y");
			userService.insertUser(formUser);
		}
		
		// 일치하는 socialId가 있으면 멤버객체에 담음.
//		logger.info("dryrain>>>>>>>>>>>>>>>>>>>카카오로 로그인");
		UserVO userVO = userService.getUserById(formUser.getId());
		String preURI = referer;
		String destURI = "";
		
		if (userVO != null) {
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600);
			destURI = (String) session.getAttribute("destination");
			session.removeAttribute("destination");
			if (destURI == null) {
				return "redirect:" + preURI;
			}
//			logger.info("destURI:" + destURI);
			
		}
		return "redirect:" + destURI;
	}

	// 내 강의보기
	@RequestMapping(value = "/my-courses", method = RequestMethod.GET)
	public String myCourseList(HttpServletRequest req, Model model, @ModelAttribute("searchVO") EduContentsVO searchVO)
			throws Exception {

		// 임시pagenation (추후 페이징처리 후 변경 필요)
		if(searchVO.getPageUnit() == 20) {
			searchVO.setPageUnit(15);
		};

		// 로그인 유저 수강정보 조회
//		List<MyContentsVO> myContentsList = new ArrayList<MyContentsVO>();
		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			// 교육컨텐츠 목록
			searchVO.setUserSeq(user.getSeq());
			List<EduContentsVO> MyeduContentsList = eduContentsService.selectMyEduContentsList(searchVO);
			List<EduContentsVO> likeContentsList = eduContentsService.selectLikeContentsList(searchVO);
			
			if (MyeduContentsList != null) {
				model.addAttribute("MyeduContentsList", MyeduContentsList);
				model.addAttribute("likeContentsList", likeContentsList);
			}

//			내 교육컨텐츠 목록 count
			int totalCount = eduContentsService.selectMyEduContentsListCnt(user.getSeq());
			model.addAttribute("dataCount", totalCount);

//			 페이징처리모듈
			searchVO.setTotalRecordCount(totalCount);
			String param = "qw=" + humanfUtil.urlEncode(searchVO.getQw()) + "&q="
					+ humanfUtil.urlEncode(searchVO.getQ()) + "&searchCate1="
					+ humanfUtil.urlEncode(searchVO.getSearchCate1()) + "&searchCate2="
					+ humanfUtil.urlEncode(searchVO.getSearchCate2()) + "&searchCate3="
					+ humanfUtil.urlEncode(searchVO.getSearchCate3()) + "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder();

			model.addAttribute("RenderPagination", PageNavigator.getBootstrapPagingFront(param, searchVO.getPageIndex(),
					totalCount, searchVO.getPageUnit(), searchVO.getBlockSize(), req.getContextPath()));
		}

		return "front.userContentList";
	}

	// 좋아요 보기
	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public String myLikesList(HttpServletRequest req, Model model, @ModelAttribute("searchVO") EduContentsVO searchVO)
			throws Exception {

		// 임시pagenation (추후 페이징처리 후 변경 필요)
		if(searchVO.getPageUnit() == 20) {
			searchVO.setPageUnit(15);
		};

		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			searchVO.setUserSeq(user.getSeq());

			// 좋아요 목록
			List<EduContentsVO> likeContentsList = eduContentsService.selectLikeContentsList(searchVO);
			List<MyContentsVO> myContentsList = new ArrayList<MyContentsVO>();
			myContentsList = eduContentsService.selectMyContentsList(user.getSeq());

			if (likeContentsList != null) {
				model.addAttribute("likeContentsList", likeContentsList);
			}

			if (myContentsList != null) {
				model.addAttribute("myContentsList", myContentsList);
			}

			// 좋아요 목록 count
			int totalCount = eduContentsService.selectLikeContentsListCnt(user.getSeq());
			model.addAttribute("dataCount", totalCount);

			// 페이징처리모듈
			searchVO.setTotalRecordCount(totalCount);
			String param = "qw=" + humanfUtil.urlEncode(searchVO.getQw()) + "&q="
					+ humanfUtil.urlEncode(searchVO.getQ()) + "&searchCate1="
					+ humanfUtil.urlEncode(searchVO.getSearchCate1()) + "&searchCate2="
					+ humanfUtil.urlEncode(searchVO.getSearchCate2()) + "&searchCate3="
					+ humanfUtil.urlEncode(searchVO.getSearchCate3()) + "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder();

			model.addAttribute("RenderPagination", PageNavigator.getBootstrapPagingFront(param, searchVO.getPageIndex(),
					totalCount, searchVO.getPageUnit(), searchVO.getBlockSize(), req.getContextPath()));
		}
		return "front.userLikeContentList";
	}

	// 좋아요 등록
	@RequestMapping(value = "/addWish", method = RequestMethod.POST)
	@ResponseBody
	public int addWish(HttpServletRequest req, @RequestParam("conSeq") String conSeq) throws Exception {

		HttpSession session = req.getSession(false);
		BoardLikeVO blike = new BoardLikeVO();
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
	
			blike.setUserSeq(user.getSeq());
			blike.setBoardType("컨텐츠");
			blike.setBoardSeq(Integer.parseInt(conSeq));
		}
		return userService.addWishList(blike);
	}

	// 좋아요 삭제
	@RequestMapping(value = "/delWish", method = RequestMethod.POST)
	@ResponseBody
	public int delWish(HttpServletRequest req, @RequestParam("conSeq") String conSeq) throws Exception {

		HttpSession session = req.getSession(false);
		BoardLikeVO blike = new BoardLikeVO();
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
	
			blike.setUserSeq(user.getSeq());
			blike.setBoardSeq(Integer.parseInt(conSeq));
		}

		return userService.delWishList(blike);
	}
	
	// 장바구니 등록
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	@ResponseBody
	public int addCart(HttpServletRequest req, @RequestParam("conSeq") String conSeq) throws Exception {

		HttpSession session = req.getSession(false);
		MyCartVO cartVO = new MyCartVO();
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
	
			cartVO.setUserSeq(user.getSeq());
			cartVO.setContentsSeq(Integer.parseInt(conSeq));
		}
		return userService.addCart(cartVO);
	}
	
	// 내 수강바구니
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String myCartList(HttpServletRequest req, Model model, @ModelAttribute("searchVO") EduContentsVO searchVO) throws Exception {
		
		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			
			// 내 장바구니 목록
			List<EduContentsVO> cartContentsList = userService.selectCartContentsList(user.getSeq());
			
			if (cartContentsList != null) {
				model.addAttribute("cartContentsList", cartContentsList);
			}
		}
		return "front.userCartList";
	}

	// 프로필
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String myProfile(HttpServletRequest req) throws Exception {

		return "front.profile";
	}

	// 프로필 업데이트1
	@RequestMapping(value = "/updateProfile1", method = RequestMethod.POST)
	public String myProfileUpdate1(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			MultipartHttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {

		// 등록된 파일 관리하기
		MultipartFile file = request.getFile("file");
//		logger.info("넘어온 userVO: " + userVO);

		int userImageCnt = userService.selectImageFileCnt(userVO.getSeq());
		if (!file.isEmpty()) {
			if (userImageCnt != 0) {
				String imageFilePath = userService.selectImageFilePath(userVO.getSeq());
				File imageFile = new File(imageFilePath.replace("data", SAVE_PATH));
//				logger.info("dryrain>>>>>>>>>>>>>>>>imageFile: " + imageFile);
				if (imageFile.exists()) {
					imageFile.delete();
//					logger.info(imageFile + "이 삭제되었습니다.");
				}
				userService.deleteImage(userVO.getSeq());
			}
			imageUpload(file, userVO);
		}

		int resultCnt = userService.updateProfile1(userVO);

		if (resultCnt > 0) {
			HttpSession session = req.getSession();
			userVO = userService.getUserById(userVO.getId());
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600);

			redirectAttributes.addFlashAttribute("write_ok_message", "수정되었습니다!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "실패하었습니다!");
		}

		return "redirect:./profile";
	}

	// 프로필 업데이트2
	@RequestMapping(value = "/updateProfile2", method = RequestMethod.POST)
	public String myProfileUpdate2(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws Exception {

//		logger.info("넘어온 userVO: " + userVO);
		String salt = EncodeUtils.Salt();
		userVO.setSalt(salt);
		String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(userVO.getPw(), salt);
		userVO.setPw(hashedPassword);

		int resultCnt = userService.updateProfile2(userVO);

		if (resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "수정되었습니다!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "실패하었습니다!");
		}

		return "redirect:./profile";
	}

	// 프로필 업데이트2
	@RequestMapping(value = "/updateProfile3", method = RequestMethod.POST)
	public String myProfileUpdate3(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws Exception {

//		logger.info("넘어온 userVO: " + userVO);

		int resultCnt = userService.updateProfile3(userVO);

		if (resultCnt > 0) {
			HttpSession session = req.getSession();
			userVO = userService.getUserById(userVO.getId());
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600);
			redirectAttributes.addFlashAttribute("write_ok_message", "수정되었습니다!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "실패하었습니다!");
		}

		return "redirect:./profile";
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
