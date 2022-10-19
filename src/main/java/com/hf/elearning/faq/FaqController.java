package com.hf.elearning.faq;

import java.util.List;

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


import ntck.util.PageNavigator;
import ntck.util.humanfUtil;


@Controller
@RequestMapping(value = "/admin")
public class FaqController {

	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String faqList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") FaqVO searchVO) throws Exception {

		int totalCount = faqService.selectFaqListCnt(searchVO);
		List<FaqVO> faqList = faqService.selectFaqList(searchVO);

		model.addAttribute("dataCount", totalCount);
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
		
		return "faq.faqList";
	}

	@RequestMapping(value = "/faqWrite", method = RequestMethod.GET)
	public String faqWrite(HttpServletRequest request, Model model,
			@ModelAttribute("faqVO") FaqVO faqVO,
			RedirectAttributes redirectAttributes
			) throws Exception {
		
		if(faqVO.getSeq() != 0) {
			model.addAttribute("faqVO", faqService.selectFaqDetail(faqVO));
		}
		return "faq.faqWrite";
	}
	
	@RequestMapping(value = "/faqWrite", method = RequestMethod.POST)
	public String faqWriteSubmit(HttpServletRequest request, Model model,
			@ModelAttribute("faqVO") FaqVO faqVO,
			RedirectAttributes redirectAttributes
			) throws Exception {

		// 관리자 seq변경 필요
		faqVO.setManagerSeq(81);
		
		int result = faqService.insertFaq(faqVO);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("write_alert_message", "                      정상적으로 처리되었습니다.");
		}
		return "redirect:./faqWrite";
	}
}
