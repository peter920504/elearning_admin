package com.hf.elearning.qa;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hf.elearning.notice.BoardFileVO;
import com.hf.elearning.user.UserVO;

import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/qna")
public class WebQnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebQnaController.class);
	private static final String SESSION_ID = "sessionId";
	private static final String SAVE_PATH ="/Users/kwon-yeonjin/개발/e-Learning/data";
	@Autowired
	private QuestionService questionService;
	
	
	@RequestMapping(value = "/webQnaList", method = RequestMethod.GET)
	public String webQnaList(HttpServletRequest request, Model model
			, @ModelAttribute("searchVO") QuestionVO searchVO
			) throws Exception {
		
		int totalCount = questionService.selectQnAListCnt(searchVO);
		List<QuestionVO> questionList = questionService.selectQnAList(searchVO);
		
		model.addAttribute("questionList", questionList);
		
		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
					+ "&q=" + humanfUtil.urlEncode(searchVO.getQ())
					+ "&sortField=" + searchVO.getSortField()
					+ "&sortOrder=" + searchVO.getSortOrder();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPagingFront(param
							, searchVO.getPageIndex()
							, totalCount
							, searchVO.getPageUnit()
							, searchVO.getBlockSize()
							, request.getContextPath()));
		return "qna.qnaList";
	}
	
	@RequestMapping(value = "/webQnaList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getFaqListByType(HttpServletRequest request, Model model
			, RedirectAttributes redirectAttributes
			, @ModelAttribute("questionVO") QuestionVO questionVO
			) throws Exception {
		
		// 사용자 정보 받아오기
		UserVO user = new UserVO();
		HttpSession session = request.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			session.getAttribute(SESSION_ID);
			user = (UserVO) session.getAttribute(SESSION_ID);
			questionVO.setUserSeq(user.getSeq());
		}
		List<QuestionVO> questionList = questionService.selectQuestionListByUserSeq(questionVO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("questionList", questionList);
		
		return map;
	}
	
	@RequestMapping(value = "/webQnaWrite", method = RequestMethod.GET)
	public String webQnaWrite(HttpServletRequest request, Model model
			, @ModelAttribute("questionVO") QuestionVO searchVO
			, RedirectAttributes redirectAttributes
			) throws Exception {
		
		
		return "qna.qnaWrite";
	}
	
	@RequestMapping(value = "/webQnaWrite", method = RequestMethod.POST)
	public String webQnaWriteSubmit(HttpServletRequest request, Model model
			, @ModelAttribute("questionVO") QuestionVO questionVO
			, RedirectAttributes redirectAttributes
			, MultipartHttpServletRequest mtfRequest
			) throws Exception {
		
		// 사용자 정보 받아오기
		UserVO user = new UserVO();
		HttpSession session = request.getSession(false);
		if (session.getAttribute(SESSION_ID) != null) {
			session.getAttribute(SESSION_ID);
			user = (UserVO) session.getAttribute(SESSION_ID);
			questionVO.setUserSeq(user.getSeq());
		}else {
			questionVO.setUserSeq(0);
		}
				
		questionService.insertQuestion(questionVO);
		
		MultipartFile file = mtfRequest.getFile("file");
		imageUpload(file, questionVO);
		
		return "redirect:./webQnaList";
	}
	
	@RequestMapping(value = "/webQnaDetail", method = RequestMethod.GET)
	public String webQnaDetail(HttpServletRequest request, Model model
			, @ModelAttribute("questionVO") QuestionVO questionVO
			, RedirectAttributes redirectAttributes
			) throws Exception {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		questionVO.setSeq(seq);
		questionVO = questionService.selectQuestionDetail(questionVO);
//		System.out.println("**********yj : questionVO Detail " + questionVO);
		model.addAttribute("question", questionVO);
//		questionService.updateNoticeViewCnt(questionVO);
		
		QuestionVO replay = questionService.selectReply(questionVO);
		if(replay != null) {
			model.addAttribute("replay", replay);
		}
		return "qna.qnaDetail";
	}
	
	public void imageUpload(MultipartFile file, QuestionVO questionVO) throws Exception {
			
		if(file != null && !file.isEmpty()) {
			File fileDir = new File(SAVE_PATH);
			// 폴더가 없으면 생성
			if (!fileDir.exists()) {
				fileDir.mkdirs();
			}
			
			String originFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String nowDate = sdf.format(new Date());
			
			// 저장파일명
			String saveFileName = String.format("%s_%s", nowDate, originFileName);
			File saveFile = new File(SAVE_PATH, saveFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setBoardSeq(questionVO.getSeq());
			boardFileVO.setReference(1);
			boardFileVO.setOriginFileName(originFileName);
			boardFileVO.setSaveFileName(saveFileName);
			boardFileVO.setFileSize(Long.toString(file.getSize()));
			boardFileVO.setFileType(file.getContentType());
			boardFileVO.setFilePath("/data/" + originFileName);
			
			questionService.uploadBoardImage(boardFileVO);
		}
		
	}
}
