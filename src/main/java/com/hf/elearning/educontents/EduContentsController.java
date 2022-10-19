package com.hf.elearning.educontents;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hf.elearning.category.CategoryService;
import com.hf.elearning.category.CategoryVO;

import ntck.model.AjaxResultVO;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;


@Controller
@RequestMapping(value = "/admin")
public class EduContentsController {

	private static final Logger logger = LoggerFactory.getLogger(EduContentsController.class);
	
	@Autowired
	private EduContentsService eduContentsService;
	
	@Autowired
	private CategoryService categoryService;
	
	private static final String SAVE_PATH = "D:/data/ntckDB/data";
	
	@RequestMapping(value = "/eduContentsList", method = RequestMethod.GET)
	public String eduContentstList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") EduContentsVO searchVO) throws Exception {
		
		//교육컨텐츠 목록 count
		int totalCount = eduContentsService.selectEduContentsListCnt(searchVO);
		
		//교육컨텐츠 목록
		List<EduContentsVO> eduContentsList = eduContentsService.selectEduContentsList(searchVO);
		
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

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param
							, searchVO.getPageIndex()
							, totalCount
							, searchVO.getPageUnit()
							, searchVO.getBlockSize()
							, request.getContextPath()));
		
		CategoryVO category = new CategoryVO();
		category.setPageUnit(categoryService.selectCategoryListCnt(category));
		List<CategoryVO> categoryList = categoryService.selectCategoryList(category);
		model.addAttribute("categoryList", categoryList);
		
		return "eduContents.eduContentsList";
	}
	
	@RequestMapping(value = "/eduContentsWrite", method = RequestMethod.GET)
	public String eduContentsWrite(Model model, RedirectAttributes redirectAttributes, 
								@ModelAttribute("eduContentsVO") EduContentsVO eduContentsVO) throws Exception {
		
		CategoryVO category = new CategoryVO();
		category.setPageUnit(categoryService.selectCategoryListCnt(category));
		List<CategoryVO> categoryList = categoryService.selectCategoryList(category);
		model.addAttribute("categoryList", categoryList);
		
		EduMediaVO eduMedia = new EduMediaVO();
		//seq 판단(수정or등록)
		if(eduContentsVO.getSeq() != 0) { //수정
			EduContentsVO selectContents = eduContentsService.selectEduContentsDetail(eduContentsVO);
			model.addAttribute("eduContentsVO", selectContents);
			
			eduMedia.setContentsSeq(selectContents.getSeq());
			eduMedia.setReference("0");
			eduMedia = eduContentsService.selectEduFile(eduMedia);
			
		}else { //등록
			EduContentsVO nullContents = new EduContentsVO();
			model.addAttribute("eduContentsVO", nullContents);
		}
		
		
		if(eduMedia != null && eduMedia.getSeq() != 0) { //첨부파일 유무
			model.addAttribute("eduMediaName", eduMedia.getOriginFileName());			
			model.addAttribute("eduMediaSeq", eduMedia.getSeq());
		}else {
			model.addAttribute("eduMediaName", "");
			model.addAttribute("eduMediaSeq", "0");
		}
		
		return "eduContents.eduContentsWrite";
	}
	
	@RequestMapping(value="/eduContentsWrite", method = RequestMethod.POST)
	public String eduContentsWriteAct(Model model, RedirectAttributes redirectAttributes,
									@ModelAttribute("eduContentsVO") EduContentsVO eduContentsVO,
									@ModelAttribute("mediaDelYN") String mediaDelYN, 									
									MultipartHttpServletRequest mtfRequest) throws Exception {
		
		List<MultipartFile> eduFileList = mtfRequest.getFiles("file");
		if(eduFileList.size() > 1) { //파일리스트가 1 이상인 경우 에러
			redirectAttributes.addFlashAttribute("write_error_message", "파일은 1개만 첨부하실 수 있습니다.");
		}
		int resultCnt = 0;
		
		//seg 판단 (수정or등록)
		if(eduContentsVO.getSeq() == 0) { //등록
			resultCnt = eduContentsService.insertEduContents(eduContentsVO);
			
			if(eduFileList.get(0).isEmpty() != true ) { //파일리스트 없는 경우 제외
				MultipartFile eduFile = eduFileList.get(0);
				mediaUpload(eduFile, eduContentsVO);
			}
			
		}else { //수정
			resultCnt = eduContentsService.updateEduContents(eduContentsVO);
			
			if(mediaDelYN.equals("Y")) { //첨부파일 변경또는 삭제된 경우 (N -> 변경x)
				EduMediaVO delMedia = new EduMediaVO();
				delMedia.setContentsSeq(eduContentsVO.getSeq());
				delMedia.setReference("0");
				int delMediaCnt = eduContentsService.selectEduFileCnt(delMedia);
				if(delMediaCnt != 0) {
					delMedia = eduContentsService.selectEduFile(delMedia);
				}
				
				if (delMedia.getSeq() != 0 && delMedia.getFilePath() != null) {
					String contextPath = delMedia.getFilePath();
					File mediaFile = new File(contextPath);
					if(mediaFile.exists()) {
						mediaFile.delete();
					}
					eduContentsService.deleteEduMedia(delMedia);
				}
				
				if(eduFileList.get(0).isEmpty() != true) { //첨부파일 변경된 case
					MultipartFile eduFile = eduFileList.get(0);
					mediaUpload(eduFile, eduContentsVO);
				}
			}
			
		}
		
		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
		}
		
		String redirectUrl = "";
		redirectUrl = "redirect:./eduContentsWrite?seq="+eduContentsVO.getSeq();
		
		return redirectUrl;
	}
	
	public int mediaUpload(MultipartFile media, EduContentsVO contents) throws Exception {
		
		File fileDir = new File(SAVE_PATH);
		// license 폴더가 없으면 생성
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}

		String originFileName = media.getOriginalFilename();
		
		//대체파일명 날짜 저장용
		SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMdd_HHmmss");
		Calendar now = Calendar.getInstance();
		String stored_file_name = formatter.format(now.getTime())+"_"+originFileName;
		File saveFile = new File(SAVE_PATH, stored_file_name);
		try {
			media.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		EduMediaVO upload = new EduMediaVO();
		upload.setContentsSeq(contents.getSeq());
		upload.setReference("0"); //0: 교육컨텐츠, 1: 교육과정
		upload.setOriginFileName(originFileName);
		upload.setStoredFileName(stored_file_name);
		upload.setFileSize(Long.toString(media.getSize()));
		upload.setFileType(media.getContentType());
		upload.setFilePath("/data/" + stored_file_name);
		
		int result =eduContentsService.registerEduFile(upload);
		
		return result;
	}
	
	
	//컨텐츠 삭제
	@RequestMapping(value="eduContentsDelete", method = RequestMethod.GET)
	public String deleteEduContents(EduContentsVO eduContentsVO, HttpSession session, HttpServletRequest request) throws Exception {
		
		EduMediaVO delMedia = new EduMediaVO();
		delMedia.setContentsSeq(eduContentsVO.getSeq());
		delMedia.setReference("0");
		int delMediaCnt = eduContentsService.selectEduFileCnt(delMedia);
		if(delMediaCnt != 0) {
			delMedia = eduContentsService.selectEduFile(delMedia);
		}
		
		if (delMedia.getSeq() != 0 && delMedia.getFilePath() != null) {
			String contextPath = delMedia.getFilePath();
			File mediaFile = new File(contextPath.replace("data", SAVE_PATH));
			if(mediaFile.exists()) {
				mediaFile.delete();
			}
			eduContentsService.deleteEduMedia(delMedia);
		}
		
		eduContentsService.deleteEduContents(eduContentsVO);
		
		return "redirect:/admin/eduContentsList";
	}
	
	//컨텐츠 다중삭제
	@RequestMapping(value="delEduContentsSeqs", produces = AjaxResultVO.PRODUCE_JSON, method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public AjaxResultVO delEduContentsSeqs(@RequestParam("seqs[]") List<Integer> seqs) throws Exception {
		
		AjaxResultVO resVO = new AjaxResultVO();
		
		try {
			for (int i = 0; i < seqs.size(); i++) {
				//첨부파일 확인 후 삭제
				EduMediaVO delMedia = new EduMediaVO();
				delMedia.setContentsSeq(seqs.get(i));
				delMedia.setReference("1");
				int delMediaCnt = eduContentsService.selectEduFileCnt(delMedia);
				if(delMediaCnt != 0) {
					delMedia = eduContentsService.selectEduFile(delMedia);
				}
				
				if(delMedia.getSeq() != 0 && delMedia.getFilePath() != null) {
					String contextPath = delMedia.getFilePath();
					File mediaFile = new File(contextPath.replace("data", SAVE_PATH));
					if(mediaFile.exists()) {
						mediaFile.delete();
					}
					eduContentsService.deleteEduMedia(delMedia);
				}
			}
			
			eduContentsService.delEduContentsSeqs(seqs);
		} catch (Exception ex) {
			ex.printStackTrace();
			resVO.setSuccess(false);
			resVO.setMessage("처리중 오류발생 (오류원인: "+ex.getMessage()+")");
		}
		
		return resVO;
		
	}
	
}
