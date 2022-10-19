package com.hf.elearning.ucode;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ntck.service.SvcsUserService;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class UserCodeController {

	private static final Logger logger = LoggerFactory.getLogger(UserCodeController.class);

	@Autowired
	private SvcsUserService svcsUserService;

	@Resource(name = "userCodeService")
	private UserCodeService userCodeService;

	@RequestMapping(value = "/userCodeList", method = RequestMethod.GET)
	public String userCodeList(HttpServletRequest request, Model model, 
			@ModelAttribute("searchVO") UserCodeVO searchVO)
			throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		CodeListVO codeListVO = new CodeListVO();
		List<CodeListVO> CodeList = userCodeService.selectCodeList(codeListVO);
		if (CodeList != null) {
			model.addAttribute("codeList", CodeList);
		}
		
		// 사용자 목록
		List<UserCodeVO> userCodeList = userCodeService.selectUserCodeList(searchVO);
		if (userCodeList != null) {
			model.addAttribute("userCodeList", userCodeList);
		}

		return "user.userCodeList";
	}

	@RequestMapping(value = "/userCodeWrite", method = RequestMethod.GET)
	public String userCodeWriteForm(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userCodeVO") UserCodeVO userCodeVO) throws Exception {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();		
//		if (adminUserVO == null)
//		return "login.loginForm";

		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인
		int seq = userCodeVO.getSeq();
		if (userCodeVO.getTypeCode() != null) {
			userCodeVO = userCodeService.selectUserCodeDetail(userCodeVO);
			userCodeVO.setSeq(seq);
			model.addAttribute("userCodeVO", userCodeVO);
		}
		return "user.userCodeWrite";
	}

	@RequestMapping(value = "/userCodeWrite", method = RequestMethod.POST)
	public String userCodeWriteSubmit(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userCodeVO") UserCodeVO userCodeVO, 
			@RequestParam(value="oriTypeCode", required=false) String oriTypeCode) throws Exception {

		int resultCnt = 0;
		int duplTypeCodeCnt = userCodeService.duplTypeCode(userCodeVO); 
		
		// seq 판단 (수정 or 등록)
		if (userCodeVO.getSeq() == 0 && duplTypeCodeCnt == 0) {
			resultCnt = userCodeService.insertUserCode(userCodeVO);
		} else if(userCodeVO.getSeq() != 0 && oriTypeCode.equals(userCodeVO.getTypeCode())) {
			resultCnt = userCodeService.updateUserCode(userCodeVO);
		}

		if (resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
			redirectAttributes.addFlashAttribute("userCodeVO", userCodeVO);
		} else {
			redirectAttributes.addFlashAttribute("write_not_ok_message", "정상적으로 처리되지않았습니다.");
		}
		redirectAttributes.addFlashAttribute("popupClose", "1");
		String encodedParam = URLEncoder.encode(userCodeVO.getDataType(), "UTF-8");
		
		return "redirect:./userCodeWrite";
	}

	@RequestMapping(value = "/userCodeDelete", method = RequestMethod.POST)
	public String userCodeDeleteSubmit(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userCodeVO") UserCodeVO userCodeVO) throws Exception {

		int resultCnt = 0;
		// seq 판단 (수정 or 등록)
		
		if (userCodeVO.getTypeCode() != null) {
			model.addAttribute("userCodeVO", userCodeService.deleteUserCode(userCodeVO));
		}

		return "redirect:./userCodeList";
	}
	

}
