package com.hf.elearning.progress;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class ProgressController {

	private static final Logger logger = LoggerFactory.getLogger(ProgressController.class);

	@Resource(name = "progressService")
	private ProgressService progressService;
	
	@RequestMapping(value = "/progressList", method = RequestMethod.GET)
	public String progressList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") ProgressVO searchVO) throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		
		// 진도 목록 count
		int totalCount = progressService.selectProgressListCnt(searchVO);
		
		// 진도 목록
		List<ProgressVO> progressList = progressService.selectProgressList(searchVO);

		if (!progressList.isEmpty()) {
			model.addAttribute("progressList", progressList);
		}
		model.addAttribute("dataCount", totalCount);
		
		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
					+ "&q=" + humanfUtil.urlEncode(searchVO.getQ())
					+ "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param
							, searchVO.getPageIndex()
							, totalCount
							, searchVO.getPageUnit()
							, searchVO.getBlockSize()
							, request.getContextPath()));

		return "progress.progressList";
	}
	
	@RequestMapping(value = "/progressDetail", method = RequestMethod.GET)
	public String progressDetail(HttpServletRequest request, Model model,
			@ModelAttribute("progressVO") ProgressVO progressVO) throws UnsupportedEncodingException {
		
		model.addAttribute("progressVO", progressService.selectProgressDetail(progressVO));
		
		return "progress.progressDetail";
	}
	
}
