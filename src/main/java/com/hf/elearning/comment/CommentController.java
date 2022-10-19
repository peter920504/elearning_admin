package com.hf.elearning.comment;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hf.elearning.user.UserService;

import ntck.service.SvcsUserService;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class CommentController {

	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Autowired
	private SvcsUserService svcsUserService;
	
	@Resource(name = "commentService")
	private CommentService commentService;
	
	@RequestMapping(value = "/commentList", method = RequestMethod.GET)
	public String commentList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") CommentVO searchVO) throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		
		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인
		
		logger.info("commentList 접속");
		// 관리자계정 목록 count
		int totalCount = commentService.selectCommentListCnt(searchVO);
		// 후기 목록
		List<CommentVO> commentList = commentService.selectCommentList(searchVO);
		
		if (commentList != null) {
			model.addAttribute("commentList", commentList);
		}
		model.addAttribute("dataCount", totalCount);
//		
//		// 페이징처리모듈
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

		return "comment.commentList";
	}
	
	@RequestMapping(value = "/commentDelete", method = RequestMethod.POST)
	public String commentDelete(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("commentVO") CommentVO commentVO) throws Exception {
		
		
		if (commentVO.getSeq() != 0) {
			model.addAttribute("commentVO", commentService.deleteComment(commentVO));
		}
		
		return "redirect:./commentList";
	}
	

	
}
