package com.hf.elearning.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ntck.service.SvcsUserService;
import ntck.util.EncodeUtils;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

	@Autowired
	private SvcsUserService svcsUserService;
	
	@Resource(name = "managerService")
	private ManagerService managerService;
	
//	@RequestMapping(value = "/managerList", method = RequestMethod.GET)
//	public String managerList(HttpServletRequest request, Model model,
//			@ModelAttribute("searchVO") ManagerVO searchVO) throws UnsupportedEncodingException {
//
//		// 로그인 여부 확인
////		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
////		if (adminUserVO == null)
////			return "login.loginForm";
//		
//		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인
//			
//		// 관리자계정 목록 count
//		int totalCount = managerService.selectManagerListCnt(searchVO);
//		
//		// 관리자계정 목록
//		List<ManagerVO> managerList = managerService.selectManagerList(searchVO);
//
//		if (managerList != null) {
//			model.addAttribute("managerList", managerList);
//		}
//		model.addAttribute("dataCount", totalCount);
//		
//		// 페이징처리모듈
//		searchVO.setTotalRecordCount(totalCount);
//		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
//					+ "&q=" + humanfUtil.urlEncode(searchVO.getQ())
//					+ "&sortField=" + searchVO.getSortField()
//					+ "&sortOrder=" + searchVO.getSortOrder();
//
//		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param
//							, searchVO.getPageIndex()
//							, totalCount
//							, searchVO.getPageUnit()
//							, searchVO.getBlockSize()
//							, request.getContextPath()));
//		
//		return "manager.managerList";
//	}
	
	@RequestMapping(value = "/managerList", method = RequestMethod.GET)
	public String managerList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") ManagerVO searchVO,
			RedirectAttributes redirectAttributes
			) throws Exception {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		
		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인
		String actYN = request.getParameter("actYN");
		if(actYN == null) {
			actYN = "Y";
		}
//		System.out.println("*****yj : deact"+map.get("deact"));	
		System.out.println("*****yj : actYN : "+ actYN);
		
		searchVO.setListActYN(actYN);
		System.out.println("*****yj : searchVO : "+ searchVO);
		// 관리자계정 목록 count
		int totalCount = managerService.selectManagerListCnt(searchVO);
				
		// 관리자계정 목록
		List<ManagerVO> managerList = managerService.selectManagerList(searchVO);
		redirectAttributes.addFlashAttribute("searchVO", searchVO);
		
		if (managerList != null) {
			model.addAttribute("managerList", managerList);
		}
		model.addAttribute("dataCount", totalCount);
		
		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
					+ "&q=" + humanfUtil.urlEncode(searchVO.getQ())
					+ "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder()
					+ "&actYN=" + searchVO.getListActYN();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param
							, searchVO.getPageIndex()
							, totalCount
							, searchVO.getPageUnit()
							, searchVO.getBlockSize()
							, request.getContextPath()));
		
		return "manager.managerList";
	}
	
//	@RequestMapping(value = "/managerList", method = RequestMethod.POST)
//	public String managerListPost(HttpServletRequest request, Model model,
//			@ModelAttribute("searchVO") ManagerVO searchVO
//			) throws Exception {
//		String actYN = request.getParameter("actYN");
//		System.out.println("*****yj : actYN : "+ actYN);
//		System.out.println("*****yj : searchVO : "+ searchVO);
//		
//				return "manager.managerList";
//	}
	
	@RequestMapping(value = "/managerWrite", method = RequestMethod.GET)
	public String managerWriteForm(Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("managerVO") ManagerVO managerVO,
			HttpServletResponse response) throws Exception  { 
		
		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();		
//		if (adminUserVO == null)  
//		return "login.loginForm";
		
		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인
		//seq 판단 (수정 or 등록)
		System.out.println("*****yj managerVO : "+ managerVO);
		if(managerVO.getSeq() != 0) {
			model.addAttribute("managerVO", managerService.selectManagerDetail(managerVO));
			System.out.println("*****yj managerVO Detail: "+ managerService.selectManagerDetail(managerVO));
			
		}
//		System.out.println("*****yj managerVO : "+ managerVO);
		response.setHeader("Cache-Control","no-store");
		
		return "manager.managerWrite";
	}
	
	@RequestMapping(value = "/managerWrite", method = RequestMethod.POST)
	public String managerWriteSubmit(Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("managerVO") ManagerVO managerVO,
			HttpServletResponse response) throws Exception  {

		int resultCnt = 0;
		// DB 계정 정보 불러오기 
		ManagerVO managerInfo = managerService.selectManagerDetailPwd(managerVO);

		// seq 판단 (수정 or 등록)
		if(managerVO.getSeq() == 0) {
			//비밀번호 암호화
			String salt = EncodeUtils.Salt();
			String hashedPw = EncodeUtils.shaPasswordEncoderWithSalt(managerVO.getPassword(), salt);
			managerVO.setPassword(hashedPw);
			managerVO.setSalt(salt);
			
			resultCnt = managerService.insertManager(managerVO);
			
			System.out.println("*****yj : resultCnt : "+ resultCnt);
			System.out.println("*****yj : seq : "+ managerVO.getSeq());
			
			managerVO.setActionType("R");
		}else {
			String hashedPwd = EncodeUtils.shaPasswordEncoderWithSalt(managerVO.getPassword(), managerInfo.getSalt());
			// 계정 수정하기 
			if(hashedPwd.equals(managerInfo.getPassword())) {
				resultCnt = managerService.updateManager(managerVO);
				
				managerVO.setActionType("M");
			}else {
				redirectAttributes.addFlashAttribute("write_alert_message", "                      비밀번호를 확인하세요.");
				redirectAttributes.addFlashAttribute("managerVO", managerVO);
			}
		}
		managerService.insertManagerLog(managerVO);

		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_alert_message", "                      정상적으로 처리되었습니다.");
			redirectAttributes.addFlashAttribute("managerVO", managerVO);
		}
		
		response.setHeader("Cache-Control","no-store");
//		response.setHeader("Pragma","no-cache");
//		response.setHeader(HttpHeaders.CACHE_CONTROL, "no-cache, no-store, max-age=0, must-revalidate");
		return "redirect:./managerWrite";
	}
	

	@RequestMapping(value = "/managerUpdatePwd", method = RequestMethod.GET)
	public String managerUpdatePwdForm(Model model,
						RedirectAttributes redirectAttributes,
						@ModelAttribute("managerVO") ManagerVO managerVO) throws Exception  { 
		

		if(managerVO.getSeq() != 0) {
			model.addAttribute("managerVO", managerService.selectManagerDetail(managerVO));
		}
		
		return "manager.managerUpdatePwd";
	}
	
	@RequestMapping(value = "/managerUpdatePwd", method = RequestMethod.POST)
	public String managerUpdatePwdSubmit(Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("managerVO") ManagerVO managerVO) throws Exception  {

		int resultCnt = 0;
		
		//기존 DB 정보
		ManagerVO managerInfo = managerService.selectManagerDetailPwd(managerVO);
		
		String exPwd = managerInfo.getPassword(); // 암호화 된 DB pwd
		String exInputPwd = managerVO.getPassword(); // 입력한 기존 pwd
		String newPwd = managerVO.getNewPassword(); // 입력한 새 pwd
		String exHashedPwd = EncodeUtils.shaPasswordEncoderWithSalt(exInputPwd, managerInfo.getSalt()); // 입력한 기존 pwd 암호화
		String salt = EncodeUtils.Salt();
		String newHashedPwd = EncodeUtils.shaPasswordEncoderWithSalt(newPwd, salt);
		
		System.out.println("*****yj : managerVO : "+ managerVO);
		if(exHashedPwd.equals(exPwd)){
			
			System.out.println("*****yj : newHashedPwd : "+ newHashedPwd);
			managerInfo.setPassword(newHashedPwd);
			System.out.println("*****yj : salt : "+ salt);
			managerInfo.setSalt(salt);
			managerService.updateManagePwd(managerInfo);
			managerInfo.setActionType("M");
			managerInfo.setActionDesc("비밀번호 수정");
			managerService.insertManagerLog(managerInfo);
			redirectAttributes.addFlashAttribute("write_alert_message", "                      정상적으로 처리되었습니다.");
			redirectAttributes.addFlashAttribute("managerVO", managerVO);
			
		}else {
			redirectAttributes.addFlashAttribute("write_alert_message", "                    기존 비밀번호를 확인하세요.");
			redirectAttributes.addFlashAttribute("managerVO", managerVO);
			return "redirect:./managerUpdatePwd";
		}
		
		return "redirect:./managerWrite";
	}
	

	@RequestMapping(value = "/managerIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> managerIdCheck(Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("managerVO") ManagerVO managerVO,
			String id
			) throws Exception  {
		
//		System.out.println("*****yj : managerIdCheck");	
//		System.out.println("*****yj : id :" + id);	
//		System.out.println("*****yj : managerVO :" + managerVO.getId());	
		int idDuplCheck = managerService.idDuplCheck(managerVO);
		Map<String, String> map = new HashMap<>();
		System.out.println("*****yj : idDuplCheck :" + idDuplCheck);	
		if(idDuplCheck == 0) {
			map.put("idCheck", "checked");
			
		}else {
			map.put("idCheck", "unchecked");
		}
		
		return map; 
	}
	
	
	@RequestMapping(value = "/managerAccInactivate", method = RequestMethod.GET)
	public String managerAccInactivateFom(Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("managerVO") ManagerVO managerVO) throws Exception  { 
		
		if(managerVO.getSeq() != 0) {
			model.addAttribute("managerVO", managerService.selectManagerDetail(managerVO));
		}
		return "manager.managerAccInactivate";
	}
	
	@RequestMapping(value = "/managerAccInactivate", method = RequestMethod.POST)
	public String managerAccInactivateSubmit(Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("managerVO") ManagerVO managerVO) throws Exception  {
		
		ManagerVO managerInfo = managerService.selectManagerDetailPwd(managerVO);
		System.out.println("*****yj managerVO : "+ managerVO);
		System.out.println("*****yj managerInfo : "+ managerInfo);
		System.out.println("*****yj boolean : "+ managerVO.getActivateYN().equals("Y"));
		
//		if(managerVO.getPassword().equals(managerInfo.getPassword())) {
//			if(managerVO.getActivateYN().equals("Y")) {
//				managerService.deactUpdate(managerVO);
//				managerVO.setActionType("D");
//				redirectAttributes.addFlashAttribute("write_alert_message", "                     계정이 비활성화되었습니다.");
//			}else {
//				managerService.actUpdate(managerVO);
//				managerVO.setActionType("A");
//				redirectAttributes.addFlashAttribute("write_alert_message", "                     계정이 활성화되었습니다.");
//			}
//			managerService.insertManagerLog(managerVO);
//			redirectAttributes.addFlashAttribute("managerVO", managerVO);
//		}else {
//			redirectAttributes.addFlashAttribute("write_alert_message", "                     비밀번호를 확인하세요.");
//			redirectAttributes.addFlashAttribute("managerVO", managerVO);
//			return "redirect:./managerAccInactivate";
//		}
		if(managerVO.getActivateYN().equals("Y")) {
			managerService.deactUpdate(managerVO);
			managerVO.setActionType("D");
			redirectAttributes.addFlashAttribute("write_alert_message", "                     계정이 비활성화되었습니다.");
		}else {
			managerService.actUpdate(managerVO);
			managerVO.setActionType("A");
			redirectAttributes.addFlashAttribute("write_alert_message", "                     계정이 활성화되었습니다.");
		}
		managerService.insertManagerLog(managerVO);
		redirectAttributes.addFlashAttribute("managerVO", managerVO);
		
		return "redirect:./managerWrite";
	}
	
	@RequestMapping(value = "/managerLogList", method = RequestMethod.GET)
	public String managerLogList(HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("searchVO") ManagerVO searchVO) throws Exception  {
		
		// 관리자계정 목록
		String q = searchVO.getQ();
		System.out.println("*****yj qqqqqqq :"+ q+"----");
		System.out.println("*****yj searchVO : "+ searchVO);
		System.out.println("*****yj searchVO.getQw : "+ searchVO.getQw() );
		System.out.println("*****yj searchVO.getQw : "+ searchVO.getQw().equals("action_type"));
		System.out.println("*****yj : keyWord"+ searchVO.getKeyWord());
		System.out.println("*****yj : qqqqqYN"+ "등록".contains(q));
		System.out.println("*****yj : qqqqqYN"+ "등록".contains(""));
		if(!searchVO.getQw().equals("id") && q != "") {
			if("등록".contains(q)) {	searchVO.setKeyWord("R");}
			else if("수정".contains(q)) { 	searchVO.setKeyWord("M");}
			else if("활성화".contains(q)) { searchVO.setKeyWord("A");}
			else if("비활성화".contains(q)) { searchVO.setKeyWord("D");}
		}
		
		System.out.println("*****yj : keyWord"+ searchVO.getKeyWord());
		
		int totalCount = managerService.managerLogListCnt(searchVO);
		List<ManagerVO> managerLogList = managerService.managerLogList(searchVO);
		redirectAttributes.addFlashAttribute("searchVO", searchVO);
		
		if (managerLogList != null) {
			model.addAttribute("managerLogList", managerLogList);
		}
		System.out.println("*****yj managerLogList : "+ managerLogList);
		model.addAttribute("dataCount", totalCount);
		
		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
					+ "&q=" + humanfUtil.urlEncode(searchVO.getQ())
					+ "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder()
					+ "&actYN=" + searchVO.getActivateYN();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param
							, searchVO.getPageIndex()
							, totalCount
							, searchVO.getPageUnit()
							, searchVO.getBlockSize()
							, request.getContextPath()));
		
		
		return "manager.managerLogList";
	}

}
