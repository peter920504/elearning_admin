package com.hf.elearning.qa;

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

import ntck.service.SvcsUserService;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class QuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private SvcsUserService svcsUserService;
	
	@Resource(name = "questionService")
	private QuestionService questionService;

	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public String questionList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") QuestionVO searchVO) throws Exception {

		int totalCount = questionService.selectQuestionListCnt(searchVO);
		
		// 1:1문의 목록
		List<QuestionVO> questionList = questionService.selectQuestionList(searchVO);
		
		
		if (questionList != null) {
			model.addAttribute("questionList", questionList);
		}
		
		model.addAttribute("dataCount", totalCount);
		
		
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
		
		return "qa.questionList";
	}
	
	@RequestMapping(value = "/answerWrite", method = RequestMethod.GET)
	public String answerWrite(HttpServletRequest request, Model model,
			@ModelAttribute("questionVO") QuestionVO questionVO) throws Exception {
//		model.addAttribute("seq", seq);
//		if (questionVO.getSeq() != 0) {
//			model.addAttribute("questionVO", questionService.selectQuestionDetail(questionVO));
//		}
		return "qa.answerWrite";
	}
	
	@RequestMapping(value = "/answerWrite", method = RequestMethod.POST)
	public String answerWriteSubmit(HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("questionVO") QuestionVO questionVO) throws Exception {

		int qSeq = questionService.selectQuestionDetail(questionVO).getqSeq();
		int result = 0;
		
		questionVO.setqSeq(qSeq);
		// 관리자 seq변경 필요
		questionVO.setManagerSeq(71);
		
		result = questionService.insertAnswer(questionVO);
		
		if(result == 1) {
			questionService.updateReplyYN(questionVO);
			redirectAttributes.addFlashAttribute("write_alert_message", "                      정상적으로 처리되었습니다.");
		}
		return "redirect:./answerWrite";
	}
	
}
