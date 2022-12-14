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
//		logger.info("id???:" + id);
//		logger.info("pw???:" + pw);
		String salt = userService.selectSaltById(id);
		pw = EncodeUtils.shaPasswordEncoderWithSalt(pw, salt);

		return userService.loginCheck(id, pw);
	}

	// ?????????
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String getLogin(Model model, @ModelAttribute("searchVO") UserVO searchVO, @RequestParam(value="referer", required=false) String referer, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
//		logger.info(">>>>>????????? email???: " + searchVO.getId());
//		logger.info(">>>>>>>>????????? ???????????????: " + searchVO.getPw());
		String destURI = "";
		String preURI = referer;
		UserVO userVO = userService.getUserById(searchVO.getId());
//		System.out.println(userVO);
//		if (userVO.getId() != null) {
//			model.addAttribute("userVO", userService.selectUserDetail(userVO));
//		}
		if (userVO != null) {
			// ????????? ?????? ??????
			// ????????? ????????? ?????? ?????? ??????, ????????? ?????? ?????? ??????
			HttpSession session = req.getSession();

			// ????????? ????????? ?????? ?????? ??????
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600); // ?????? ???????????? 60???
			destURI = (String) session.getAttribute("destination");
			session.removeAttribute("destination");
			if (destURI == null) {
				return "redirect:" + preURI;
			}
//			logger.info("destURI:" + destURI);
		}

		/*
		 * jwt ?????? ???????????? final String token = jwtUtil.generateToken(searchVO); final
		 * String refreshJwt = jwtUtil.generateRefreshToken(searchVO); Cookie
		 * accessToken = cookieUtil.createCookie(JwtUtil.ACCESS_TOKEN_NAME, token);
		 * Cookie refreshToken = cookieUtil.createCookie(JwtUtil.REFRESH_TOKEN_NAME,
		 * refreshJwt); // redisUtil.setDataExpire(refreshJwt, searchVO.getId(),
		 * JwtUtil.REFRESH_TOKEN_VALIDATION_SECOND); res.addCookie(accessToken);
		 * res.addCookie(refreshToken); logger.info(token); // return new
		 * Response("success", "???????????? ??????????????????.", token);
		 */

		return "redirect:" + destURI;
	}

	// ????????????
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getLogout(HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null || session != null) {
//			logger.info(">>>>>>>> ???????????????: " + session.getAttribute(SESSION_ID));
			session.invalidate();
//			logger.info(">>>>>>>>>> ???????????? ???????????????.");
		}

		return "redirect:/";
	}

	// ????????????
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(HttpServletRequest req) throws Exception {
		return "front.signUp";
	}

	// ????????????
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpSubmit(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws Exception {
//		logger.info("????????? userVO: " + userVO);

		int resultCnt = 0;
		int duplIdCnt = userService.duplUserId(userVO.getId());
		int duplNickCnt = userService.duplNickName(userVO.getNickName());

//		logger.info("dryrain>>>>>>???????????? ??????????????????????????? ???: " + duplIdCnt);
//		logger.info("dryrain>>>>>>???????????? ??????????????????????????? ???: " + duplNickCnt);

		if (duplIdCnt == 0 && duplNickCnt == 0) {
			String salt = EncodeUtils.Salt();
//			logger.info(">>>>>> ????????? salt???: " + salt);
			userVO.setSalt(salt);

			String inputPassword = userVO.getPw();
			String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(userVO.getPw(), salt);
//			logger.info("dryrain>>>>>>>???????????? ????????????: " + hashedPassword);
			userVO.setPw(hashedPassword);
			resultCnt = userService.insertUser(userVO);
//			logger.info("dryrain>>>>>>>resultCnt???: " + resultCnt);
		}

		if (resultCnt > 0) {
			// ????????? ????????? ?????? ?????? ??????
			userVO = userService.getUserById(userVO.getId());
			HttpSession session = req.getSession();
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600); // ?????? ???????????? 60???

			redirectAttributes.addFlashAttribute("write_ok_message", "??????????????? ?????????????????????!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "??????????????? ???????????????????????????.");
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
	
	// ???????????? ??????
	@RequestMapping(value = "/findPW", method = RequestMethod.GET)
	public String findPassword(HttpServletRequest req) throws Exception {

		return "front.findPW";
	}
	
	// ???????????? ??????(????????? ???????????? ??????)
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

		// ????????? ????????? ?????? ?????? ??????
		session.setAttribute(SESSION_CODE, pwCode);
		session.setAttribute(SESSION_FIND_ID, userVO.getId());
		session.setMaxInactiveInterval(300); // ?????? ???????????? 5???
		
		return "front.findPW2";
	}
	
	// ???????????? ??????(???????????? ?????? ??? ??? ???????????? ????????? ??????)
	@RequestMapping(value = "/findPW3", method = RequestMethod.POST)
	public String findPassword3(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		if(session.getAttribute(SESSION_FIND_ID) != null) {
			session.removeAttribute(SESSION_CODE);
			session.setMaxInactiveInterval(3600); //?????? ???????????? 60???
			return "front.findPW3";
		}
		else {
			return "/";
		}
	}
	
	// ???????????? ??????(???????????? ????????? ?????? ??? ?????? ??? ????????? ???????????? ??????)
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
			redirectAttributes.addFlashAttribute("write_ok_message", "???????????? ????????? ?????????????????????!");
			return "redirect:/";
			
		} else {
			return "front.findPW3";
		}
	}

	// kakao????????? ????????? ????????????.
	@RequestMapping(value = "/kakao_callback", method = RequestMethod.POST)
	public String loginWithKakao(@ModelAttribute UserVO formUser, @RequestParam(value="referer", required=false)String referer, HttpSession session) throws IOException {
		
//		logger.info("dryrain>>>>>>>>>>>????????? ????????? ????????????:" + formUser);
		
		if (userService.getUserById(formUser.getId()) == null) {
//			logger.info("dryrain>>>>>>>>>>>>>>>>>> ???????????? ????????????");
			formUser.setTypeCode("01");
			formUser.setIsSocial("Y");
			userService.insertUser(formUser);
		}
		
		// ???????????? socialId??? ????????? ??????????????? ??????.
//		logger.info("dryrain>>>>>>>>>>>>>>>>>>>???????????? ?????????");
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

	// ??? ????????????
	@RequestMapping(value = "/my-courses", method = RequestMethod.GET)
	public String myCourseList(HttpServletRequest req, Model model, @ModelAttribute("searchVO") EduContentsVO searchVO)
			throws Exception {

		// ??????pagenation (?????? ??????????????? ??? ?????? ??????)
		if(searchVO.getPageUnit() == 20) {
			searchVO.setPageUnit(15);
		};

		// ????????? ?????? ???????????? ??????
//		List<MyContentsVO> myContentsList = new ArrayList<MyContentsVO>();
		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			// ??????????????? ??????
			searchVO.setUserSeq(user.getSeq());
			List<EduContentsVO> MyeduContentsList = eduContentsService.selectMyEduContentsList(searchVO);
			List<EduContentsVO> likeContentsList = eduContentsService.selectLikeContentsList(searchVO);
			
			if (MyeduContentsList != null) {
				model.addAttribute("MyeduContentsList", MyeduContentsList);
				model.addAttribute("likeContentsList", likeContentsList);
			}

//			??? ??????????????? ?????? count
			int totalCount = eduContentsService.selectMyEduContentsListCnt(user.getSeq());
			model.addAttribute("dataCount", totalCount);

//			 ?????????????????????
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

	// ????????? ??????
	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public String myLikesList(HttpServletRequest req, Model model, @ModelAttribute("searchVO") EduContentsVO searchVO)
			throws Exception {

		// ??????pagenation (?????? ??????????????? ??? ?????? ??????)
		if(searchVO.getPageUnit() == 20) {
			searchVO.setPageUnit(15);
		};

		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			searchVO.setUserSeq(user.getSeq());

			// ????????? ??????
			List<EduContentsVO> likeContentsList = eduContentsService.selectLikeContentsList(searchVO);
			List<MyContentsVO> myContentsList = new ArrayList<MyContentsVO>();
			myContentsList = eduContentsService.selectMyContentsList(user.getSeq());

			if (likeContentsList != null) {
				model.addAttribute("likeContentsList", likeContentsList);
			}

			if (myContentsList != null) {
				model.addAttribute("myContentsList", myContentsList);
			}

			// ????????? ?????? count
			int totalCount = eduContentsService.selectLikeContentsListCnt(user.getSeq());
			model.addAttribute("dataCount", totalCount);

			// ?????????????????????
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

	// ????????? ??????
	@RequestMapping(value = "/addWish", method = RequestMethod.POST)
	@ResponseBody
	public int addWish(HttpServletRequest req, @RequestParam("conSeq") String conSeq) throws Exception {

		HttpSession session = req.getSession(false);
		BoardLikeVO blike = new BoardLikeVO();
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
	
			blike.setUserSeq(user.getSeq());
			blike.setBoardType("?????????");
			blike.setBoardSeq(Integer.parseInt(conSeq));
		}
		return userService.addWishList(blike);
	}

	// ????????? ??????
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
	
	// ???????????? ??????
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
	
	// ??? ???????????????
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String myCartList(HttpServletRequest req, Model model, @ModelAttribute("searchVO") EduContentsVO searchVO) throws Exception {
		
		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			
			// ??? ???????????? ??????
			List<EduContentsVO> cartContentsList = userService.selectCartContentsList(user.getSeq());
			
			if (cartContentsList != null) {
				model.addAttribute("cartContentsList", cartContentsList);
			}
		}
		return "front.userCartList";
	}

	// ?????????
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String myProfile(HttpServletRequest req) throws Exception {

		return "front.profile";
	}

	// ????????? ????????????1
	@RequestMapping(value = "/updateProfile1", method = RequestMethod.POST)
	public String myProfileUpdate1(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			MultipartHttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {

		// ????????? ?????? ????????????
		MultipartFile file = request.getFile("file");
//		logger.info("????????? userVO: " + userVO);

		int userImageCnt = userService.selectImageFileCnt(userVO.getSeq());
		if (!file.isEmpty()) {
			if (userImageCnt != 0) {
				String imageFilePath = userService.selectImageFilePath(userVO.getSeq());
				File imageFile = new File(imageFilePath.replace("data", SAVE_PATH));
//				logger.info("dryrain>>>>>>>>>>>>>>>>imageFile: " + imageFile);
				if (imageFile.exists()) {
					imageFile.delete();
//					logger.info(imageFile + "??? ?????????????????????.");
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

			redirectAttributes.addFlashAttribute("write_ok_message", "?????????????????????!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "?????????????????????!");
		}

		return "redirect:./profile";
	}

	// ????????? ????????????2
	@RequestMapping(value = "/updateProfile2", method = RequestMethod.POST)
	public String myProfileUpdate2(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws Exception {

//		logger.info("????????? userVO: " + userVO);
		String salt = EncodeUtils.Salt();
		userVO.setSalt(salt);
		String hashedPassword = EncodeUtils.shaPasswordEncoderWithSalt(userVO.getPw(), salt);
		userVO.setPw(hashedPassword);

		int resultCnt = userService.updateProfile2(userVO);

		if (resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "?????????????????????!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "?????????????????????!");
		}

		return "redirect:./profile";
	}

	// ????????? ????????????2
	@RequestMapping(value = "/updateProfile3", method = RequestMethod.POST)
	public String myProfileUpdate3(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest req,
			RedirectAttributes redirectAttributes) throws Exception {

//		logger.info("????????? userVO: " + userVO);

		int resultCnt = userService.updateProfile3(userVO);

		if (resultCnt > 0) {
			HttpSession session = req.getSession();
			userVO = userService.getUserById(userVO.getId());
			session.setAttribute(SESSION_ID, userVO);
			session.setMaxInactiveInterval(3600);
			redirectAttributes.addFlashAttribute("write_ok_message", "?????????????????????!");
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "?????????????????????!");
		}

		return "redirect:./profile";
	}

	// ????????? ?????? ????????? ??????????????? ?????????
	public void imageUpload(MultipartFile file, UserVO userVO) throws Exception {

		// ????????? ??????(??????????????? ?????? ???????????????)??? ????????? ??????(??????????????? ?????? ???????????????) ???????????? ?????????
		if (file != null && !file.isEmpty()) {
			File fileDir = new File(SAVE_PATH);
			// license ????????? ????????? ??????
			if (!fileDir.exists()) {
				fileDir.mkdirs();
			}

			String originFileName = file.getOriginalFilename();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String nowDate = sdf.format(new Date());

			// ?????????????????? ???????????? - ??????????????? ????????? ????????? ????????? ??????
			String saveFileName = String.format("%s_%s_%s", userVO.getId(), nowDate, originFileName);
			File saveFile = new File(SAVE_PATH, saveFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// ?????? ?????? ?????? ??????
			if (saveFile.exists()) {
//				logger.info(saveFileName + "?????? ?????? ??????");
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
