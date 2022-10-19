package com.hf.elearning.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.hf.elearning.curriculum.CurriculumVO;
import com.hf.elearning.educontents.WebVideoController;

import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/faq")
public class WebFaqController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebVideoController.class);
	private static final String SESSION_ID = "sessionId";
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value = "/webFaqList", method = RequestMethod.GET)
	public String getFaqList(HttpServletRequest request, Model model
			, @ModelAttribute("faqVO") FaqVO searchVO
			) throws Exception {
		
		int totalCount = faqService.selectFaqListCnt(searchVO);
		
		List<FaqVO> faqList = faqService.selectFaqList(searchVO);
		
		model.addAttribute("faqList", faqList);
		
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
		
		return "faq.webFaqList";
	}
	
	@RequestMapping(value = "/webFaqList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getFaqListByType(HttpServletRequest request, Model model
			, RedirectAttributes redirectAttributes
			, @ModelAttribute("faqVO") FaqVO faqVO
			, String faqType) throws Exception {
		
//		System.out.println("**********yj : faqType " + faqType);
		faqVO.setType(faqType);
		List<FaqVO> faqList = faqService.selectFaqListByType(faqVO);
//		System.out.println("**********yj : faqList " + faqList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("faqList", faqList);
		
		return map;
	}
}
