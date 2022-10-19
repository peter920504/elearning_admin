package com.hf.elearning.blike;

import java.io.UnsupportedEncodingException;
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

import com.hf.elearning.user.UserVO;

import ntck.service.SvcsUserService;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class BoardLikeController {

	private static final Logger logger = LoggerFactory.getLogger(BoardLikeController.class);

	@Autowired
	private SvcsUserService svcsUserService;

	@Resource(name = "boardLikeService")
	private BoardLikeService boardLikeService;

	@RequestMapping(value = "/boardLikeList", method = RequestMethod.GET)
	public String boardLikeList(HttpServletRequest request, Model model, @ModelAttribute("searchVO") BoardLikeVO searchVO)
			throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";

		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인

		// 사용자 목록 count
		int totalCount = boardLikeService.selectBoardLikeListCnt(searchVO);
		
		// 카테고리별 좋아요 갯수 count
		BoardLikeStatVO boardLikeStatVO = boardLikeService.selectBoardLikeStatCountVO(searchVO);
		
		// 사용자 목록
		List<BoardLikeVO> boardLikeList = boardLikeService.selectBoardLikeList(searchVO);

		if (boardLikeList != null) {
			model.addAttribute("boardLikeList", boardLikeList);
			model.addAttribute("boardLikeStatCountVO", boardLikeStatVO);
		}
		model.addAttribute("dataCount", totalCount);

		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param = "qw=" + humanfUtil.urlEncode(searchVO.getQw()) + "&q=" + humanfUtil.urlEncode(searchVO.getQ())
				+ "&sortField=" + searchVO.getSortField() + "&sortOrder=" + searchVO.getSortOrder();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param, searchVO.getPageIndex(),
				totalCount, searchVO.getPageUnit(), searchVO.getBlockSize(), request.getContextPath()));

		return "user.boardLikeList";
	}
	
}
