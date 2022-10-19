package com.hf.elearning.notice;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/notice")
public class WebNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebNoticeController.class);
	private static final String SESSION_ID = "sessionId";
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/webNoticeList", method = RequestMethod.GET)
	public String webNoticeList(HttpServletRequest request, Model model
			, @ModelAttribute("searchVO") NoticeVO searchVO
			) throws Exception {

		int totalCount = noticeService.selectNoticeListCnt(searchVO);
		List<NoticeVO> noticeList = noticeService.selectNoticeList(searchVO);
//		System.out.println("**********yj : noticeList " + noticeList);
		model.addAttribute("noticeList", noticeList);
		
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
		return "notice.webNoticeList";
		
	}
	
	@RequestMapping(value = "/webNoticeDetail", method = RequestMethod.GET)
	public String webNoticeDetail(HttpServletRequest request, Model model
			, @ModelAttribute("noticeVO") NoticeVO noticeVO
			) throws Exception {

		int seq = Integer.parseInt(request.getParameter("seq"));
		noticeVO.setSeq(seq);
		noticeVO = noticeService.selectNoticeDetail(noticeVO);
//		System.out.println("**********yj : noticeVO Detail " + noticeVO);
		model.addAttribute("notice", noticeVO);
		noticeService.updateNoticeViewCnt(noticeVO);
		
		return "notice.webNoticeDetail";
		
	}
	
	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	public void fileDownload(HttpServletResponse response
			, HttpServletRequest request) {
		
//		String serverFilePath = (String) params.get("serverFilePath"); // 다운로드 받을 파일경로 (서버 임시저장파일 전체경로)
//        String clientFileName = (String) params.get("clientFileName"); // 다운로드 받을 때 저장할 파일명 (클라이언트가 보는)
//		String boardSeq = request.getParameter("boardSeq");
		String fileName = request.getParameter("fileName");
		String filePath = "/Users/kwon-yeonjin/개발/e-Learning/data";
		String contentType = "application/pdf";
        //response.setContentType("application/octet-stream;");
        //File file = new File(serverFilePath);
        
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		//response.setHeader("Content-Length", fileLength;
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
	}
}
