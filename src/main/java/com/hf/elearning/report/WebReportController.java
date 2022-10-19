package com.hf.elearning.report;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/report")
public class WebReportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value = "/webReportWrite", method = RequestMethod.GET)
	public String webReportWrite(HttpServletRequest request, Model model
			, @ModelAttribute("reportVO") ReportVO reportVO
			, RedirectAttributes redirectAttributes
			) throws Exception {
		
		return "report.errorReportWrite";
	}
	
	@RequestMapping(value = "/webReportWrite", method = RequestMethod.POST)
	public String webReportWriteSubmit(HttpServletRequest request, Model model
			, @ModelAttribute("reportVO") ReportVO reportVO
			, RedirectAttributes redirectAttributes
			) throws Exception {
		
		int result = reportService.insertReport(reportVO);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("write_alert_message", "                      정상적으로 처리되었습니다.");
		}
		
		return "redirect:./webReportWrite";
	}
}
