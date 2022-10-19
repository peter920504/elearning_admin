package com.hf.elearning.educontents;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.hf.elearning.category.CategoryService;
import com.hf.elearning.comment.CommentService;
import com.hf.elearning.comment.CommentVO;
import com.hf.elearning.curriculum.CurriculumService;
import com.hf.elearning.curriculum.CurriculumVO;
import com.hf.elearning.qa.QuestionVO;
import com.hf.elearning.user.UserVO;

import ntck.model.AjaxResultVO;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/edu")
public class WebEduContentsController {

	private static final Logger logger = LoggerFactory.getLogger(WebEduContentsController.class);
	
	private static final String SESSION_ID = "sessionId";
	
	@Autowired
	private EduContentsService eduContentsService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CurriculumService curriculumService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/webEduContentsList", method = RequestMethod.GET)
	public String webEduContentsList(HttpServletRequest req, Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("searchVO") EduContentsVO searchVO) throws Exception {
		
		String sc1 = req.getParameter("sc1");
		String sc2 = req.getParameter("sc2");
		
		if(sc1 != null) {
			searchVO.setSearchCate1(sc1);
		}else if(sc2 != null) {
			searchVO.setSearchCate2(sc2);
		}
		
		//searchVO.setPageIndex(1);
		//searchVO.setPageUnit(15);
		if(searchVO.getPageUnit() == 20) {
			searchVO.setPageUnit(15);
		};
		
		//교육컨텐츠 목록 count
		int totalCount = eduContentsService.selectEduContentsListCnt(searchVO);
				
		//교육컨텐츠 목록
		List<EduContentsVO> eduContentsList = eduContentsService.webEduContentsList(searchVO);
		
		if(eduContentsList != null) {
			model.addAttribute("eduContentsList", eduContentsList);
		}
		model.addAttribute("dataCount", totalCount);
		
		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
					+ "&q=" + humanfUtil.urlEncode(searchVO.getQ())
					+ "&searchCate1=" + humanfUtil.urlEncode(searchVO.getSearchCate1())
					+ "&searchCate2=" + humanfUtil.urlEncode(searchVO.getSearchCate2())
					+ "&searchCate3=" + humanfUtil.urlEncode(searchVO.getSearchCate3())
					+ "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPagingFront(param
							, searchVO.getPageIndex()
							, totalCount
							, searchVO.getPageUnit()
							, searchVO.getBlockSize()
							, req.getContextPath()));
		
		//로그인 유저 수강정보 조회
		List<MyContentsVO> myContentsList = new ArrayList<MyContentsVO>();
		List<EduContentsVO> likeContentsList = new ArrayList<EduContentsVO>();
		//MyContentsVO nullMyCon = new MyContentsVO();
		//myContentsList.add(nullMyCon);
		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			logger.info(">>>>>>>> 세션정보는: " + session.getAttribute(SESSION_ID));
			logger.info(">>>>>>>> 세션: " + session);
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			myContentsList = eduContentsService.selectMyContentsList(user.getSeq());
			searchVO.setUserSeq(user.getSeq());
			likeContentsList = eduContentsService.selectLikeContentsList(searchVO);
			System.out.println("ain>>>>>>>> " + myContentsList);
		}
		model.addAttribute("myContentsList", myContentsList);
		model.addAttribute("likeContentsList", likeContentsList);
		return "front.eduContentList";
	}
	
	@RequestMapping(value="/webEduContent", method = RequestMethod.GET)
	public String webEduContent(Model model, RedirectAttributes redirectAttributes, HttpServletRequest req,
			@ModelAttribute("eduContentsVO") EduContentsVO eduContentsVO) throws Exception {
		
		String seq = req.getParameter("seq");
		
		EduContentsVO edu = new EduContentsVO();
		edu.setSeq(Integer.parseInt(seq));
		
		edu = eduContentsService.selectEduContentsDetail(edu);
		model.addAttribute("eduVO", edu);
		
		//해당 컨텐츠 커리큘럼 조회
		CurriculumVO curi = new CurriculumVO();
		curi.setQw("CONTENTS_SEQ");
		curi.setQ(seq);
		
		List<CurriculumVO> curiList = new ArrayList<CurriculumVO>();
		
		curiList = curriculumService.selectCurriculumList(curi);
		HttpSession session = req.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute(SESSION_ID);
			int resultCnt = eduContentsService.selectLikeContents(user.getSeq(), Integer.parseInt(seq));
			model.addAttribute("resultLike", resultCnt);
			int resultCnt2 = eduContentsService.selectIsMyContent(user.getSeq(), Integer.parseInt(seq));
			model.addAttribute("resultIsMy", resultCnt2);
			int resultCnt3 = eduContentsService.selectIsMyCart(user.getSeq(), Integer.parseInt(seq));
			model.addAttribute("resultCart", resultCnt3);
		}
		
		model.addAttribute("curiList", curiList);
		// 강의 후기 목록 조회 
		CommentVO commentVO = new CommentVO();
		commentVO.setContentsSeq(Integer.parseInt(req.getParameter("seq")));
		List<CommentVO> commentList = commentService.selectCommentList(commentVO);
		model.addAttribute("commentList", commentList);
		
		return "front.eduContent";
		
	}
	
	@RequestMapping(value="insertMyContent", produces = AjaxResultVO.PRODUCE_JSON, method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int insertMyContent(Model model, RedirectAttributes redirectAttributes, HttpServletRequest req,
			@ModelAttribute("myContentsVO") MyContentsVO myContentsVO) throws Exception {
		
		HttpSession session = req.getSession(false);
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute(SESSION_ID);
		
		//String userSeq = req.getParameter("userSeq");
		String conSeq = req.getParameter("conSeq");
		
		MyContentsVO selectCon = new MyContentsVO();
		//selectCon.setUserSeq(Integer.parseInt(userSeq));
		selectCon.setUserSeq(user.getSeq());
		selectCon.setContentsSeq(Integer.parseInt(conSeq));
		
		int resultCnt = eduContentsService.insertMyContent(selectCon);
		
		/*
		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
		}
		*/
		
		return resultCnt;
	}
	
	//front.myEduContent
	@RequestMapping(value="/myEduContent", method = RequestMethod.GET)
	public String myEduContent(Model model, RedirectAttributes redirectAttributes, HttpServletRequest req,
			@ModelAttribute("eduContentsVO") EduContentsVO eduContentsVO,
			@ModelAttribute("commentVO") CommentVO commentVO
			) throws Exception {
		
		HttpSession session = req.getSession(false);
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute(SESSION_ID);
		
		String seq = req.getParameter("seq");
		
		EduContentsVO edu = new EduContentsVO();
		edu.setSeq(Integer.parseInt(seq));
		
		edu = eduContentsService.selectEduContentsDetail(edu);
		model.addAttribute("eduVO", edu);
		
		//해당 컨텐츠 커리큘럼 조회
		CurriculumVO curi = new CurriculumVO();
		curi.setQw("CONTENTS_SEQ");
		curi.setQ(seq);
		
		List<CurriculumVO> curiList = new ArrayList<CurriculumVO>();
		
		HashMap<String, Object> curiSearch = new HashMap<String, Object>();
		curiSearch.put("user", user);
		curiSearch.put("content", edu);
		curiList = curriculumService.selectCompleteCuriList(curiSearch);
		
		model.addAttribute("curiList", curiList);
		
		// 강의 후기 목록 조회 
			commentVO.setContentsSeq(Integer.parseInt(req.getParameter("seq")));
			List<CommentVO> commentList = commentService.selectCommentList(commentVO);
			model.addAttribute("commentList", commentList);
				
		//진도율 계산
		int completeCount = curriculumService.completeCount(curiSearch);
		int classCount = edu.getClassCount();
		
		double progressPercent = (double)((double)completeCount/(double)classCount) * 100;
		
		model.addAttribute("progressPercent", (int)progressPercent);
		model.addAttribute("commentVO", commentVO);
		model.addAttribute("completeCount", completeCount);
		
		//후기작성여부 확인
		if((int)progressPercent >= 80) {
			CommentVO commentSearch = new CommentVO();
			commentSearch.setUserSeq(user.getSeq());
			commentSearch.setContentsSeq(edu.getSeq());
			int commentCount = commentService.commentYN(commentVO);
			if(commentCount >= 1) {
				model.addAttribute("commentYN", 'Y');
			}else {
				model.addAttribute("commentYN", 'N');
			}
		}else {
			model.addAttribute("commentYN", 'Y');
		}
		
		
		return "front.myEduContent";
		
	}
	
	@RequestMapping(value = "/myEduContent", method = RequestMethod.POST)
	public String myEduCommentSubmit(HttpServletRequest request, Model model
			, RedirectAttributes redirectAttributes
			, @ModelAttribute("commentVO") CommentVO commentVO
			) throws Exception {
		HttpSession session = request.getSession(false);
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute(SESSION_ID);
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		commentVO.setContentsSeq(seq);
		commentVO.setUserSeq(user.getSeq());
		
		commentService.insertMyComment(commentVO);
		
		return "front.myEduContent";
	}
	
	@RequestMapping(value = "/commentList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getCommentListBySort(HttpServletRequest request, Model model
			, RedirectAttributes redirectAttributes
			, @ModelAttribute("commentVO") CommentVO commentVO
			) throws Exception {
		//commentVO.setSortField(sortField);
		
		List<CommentVO> commentList = commentService.selectCommentList(commentVO);
		System.out.println("**********yj : commentList " + commentList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("commentList", commentList);
		
		return map;
	}
		
}
