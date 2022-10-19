package com.hf.elearning.notice;

import java.util.Date;
import java.util.List;
import java.io.File;
import java.text.SimpleDateFormat;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import ntck.service.SvcsUserService;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	private static final String SESSION_ID = "sessionId";
	private static final String SAVE_PATH ="/Users/kwon-yeonjin/개발/e-Learning/data";

	@Autowired
	private SvcsUserService svcsUserService;
	
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") NoticeVO searchVO,
			RedirectAttributes redirectAttributes
			) throws Exception {
		
		int totalCount = noticeService.selectNoticeListCnt(searchVO);
		List<NoticeVO> noticeList = noticeService.selectNoticeList(searchVO);
		
		model.addAttribute("dataCount", totalCount);
		model.addAttribute("noticeList", noticeList);
		
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
		return "notice.noticeList";
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite(HttpServletRequest request, Model model,
			@ModelAttribute("noticeVO") NoticeVO noticeVO,
			RedirectAttributes redirectAttributes
			) throws Exception {
		
		if(noticeVO.getSeq() != 0) {
			model.addAttribute("noticeVO", noticeService.selectNoticeDetail(noticeVO));
		}
		return "notice.noticeWrite";
	}
	
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String noticeWriteSubmit(HttpServletRequest request, Model model
			, @ModelAttribute("noticeVO") NoticeVO noticeVO
			, RedirectAttributes redirectAttributes
			, MultipartHttpServletRequest mtfRequest
			) throws Exception {
		int result = 0;
		
		// 관리자 seq변경 필요
		noticeVO.setManagerSeq(81);
		System.out.println(">>>>>>>>>>> noticeVO : "+ noticeVO);
		if(noticeVO.getSeq() == 0) {
			result = noticeService.insertNotice(noticeVO);
		}else {
			result = noticeService.updateNotice(noticeVO);
		}

		MultipartFile file = mtfRequest.getFile("file");
		imageUpload(file, noticeVO);
		
		
		if(result == 1) {
			redirectAttributes.addFlashAttribute("write_alert_message", "                      정상적으로 처리되었습니다.");
		}
		return "redirect:./noticeWrite";
	}
	
	public void imageUpload(MultipartFile file, NoticeVO noticeVO) throws Exception {
		
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
			boardFileVO.setBoardSeq(noticeVO.getSeq());
			boardFileVO.setReference(1);
			boardFileVO.setOriginFileName(originFileName);
			boardFileVO.setSaveFileName(saveFileName);
			boardFileVO.setFileSize(Long.toString(file.getSize()));
			boardFileVO.setFileType(file.getContentType());
			boardFileVO.setFilePath("/data/" + originFileName);
			
			noticeService.uploadBoardFile(boardFileVO);
		}
		
	}

}
