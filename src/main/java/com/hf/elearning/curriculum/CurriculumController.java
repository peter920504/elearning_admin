package com.hf.elearning.curriculum;

import static org.mockito.Matchers.intThat;

import java.io.File;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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

import com.hf.elearning.educontents.EduContentsService;
import com.hf.elearning.educontents.EduContentsVO;
import com.hf.elearning.educontents.EduMediaVO;

import ntck.model.AjaxResultVO;
import ntck.util.PageNavigator;
import ntck.util.humanfUtil;

@Controller
@RequestMapping(value = "/admin")
public class CurriculumController {
	
	private static final Logger logger = LoggerFactory.getLogger(CurriculumController.class);
	
	@Autowired
	private CurriculumService curriculumService;
	
	@Autowired
	private EduContentsService eduContentsService;
	
	private static final String SAVE_PATH = "D:/data/ntckDB/data";
	
	@RequestMapping(value="/curriculumList", method = RequestMethod.GET)
	public String curriculumList(HttpServletRequest request, Model model,
							@ModelAttribute("searchVO") CurriculumVO searchVO) throws Exception {
		
		//커리큘럼 목록 count
		int totalCount = curriculumService.selectCurriculumListCnt(searchVO);
		
		//커리큘럼 목록
		List<CurriculumVO> curriculumList = curriculumService.selectCurriculumList(searchVO);
		
		if(curriculumList != null) {
			model.addAttribute("curriculumList", curriculumList);
		}
		model.addAttribute("dataCount", totalCount);
		
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
		
		return "curriculum.curriculumList";
	}
	
	//교육과정 수정
	@RequestMapping(value = "/curriculumEdit", method = RequestMethod.GET)
	public String curriculumEdit(Model model, RedirectAttributes redirectAttributes,
						@ModelAttribute("curriculumVO") CurriculumVO curriculumVO) throws Exception {
		
		EduMediaVO eduMedia = new EduMediaVO();
		
		if(curriculumVO.getSeq() != 0) {
			CurriculumVO selectCurriculum = curriculumService.selectCurriculumDetail(curriculumVO);
			model.addAttribute("curriculumVO", selectCurriculum);
			
			model.addAttribute("originStep", selectCurriculum.getStep());
			
			eduMedia.setContentsSeq(selectCurriculum.getSeq());
			eduMedia.setReference("1");
			eduMedia = eduContentsService.selectEduFile(eduMedia);
		}
		
		if(eduMedia != null && eduMedia.getSeq() != 0) {
			model.addAttribute("eduMediaName", eduMedia.getOriginFileName());			
		}else {
			model.addAttribute("eduMediaName", "");
		}
		
		return "curriculum.curriculumEdit";
	}
	
	@RequestMapping(value = "/curriculumEdit", method = RequestMethod.POST)
	public String curriculumEditAct(Model model, RedirectAttributes redirectAttributes,
						@ModelAttribute("curriculumVO") CurriculumVO curriculumVO,
						@ModelAttribute("mediaDelYN") String mediaDelYN, 									
						MultipartHttpServletRequest mtfRequest) throws Exception {
			
		int resultCnt = curriculumService.updateCurriculum(curriculumVO);
		
		List<MultipartFile> eduFileList = mtfRequest.getFiles("file");
		if(eduFileList.size() > 1) { //파일리스트가 1 이상인 경우 에러
			//에러처리
		}
		
		if(mediaDelYN.equals("Y")) { //첨부파일 변경또는 삭제된 경우 (N -> 변경x)
			EduMediaVO delMedia = new EduMediaVO();
			delMedia.setContentsSeq(curriculumVO.getSeq());
			delMedia.setReference("1");
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
				mediaUpload(eduFile, curriculumVO);
			}
		}
		
		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
		}
		
		String redirectUrl = "";
		redirectUrl = "redirect:./curriculumEdit?seq="+curriculumVO.getSeq();
		
		
		return redirectUrl;
	}
	
	//교육과정 작성
	@RequestMapping(value = "/curriculumWrite", method = RequestMethod.GET)
	public String curriculumWrite(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request,
				@ModelAttribute("curriculumVO") CurriculumVO curriculumVO) throws Exception {
			
		
		//이전 URL 가져와서 파라미터 이용하기 위한 코드
		String old_url_String = request.getHeader("referer");
		
		if(old_url_String.contains("CONTENTS_SEQ")) {
			URL old_url = new URL(old_url_String);
			Map<String, String> map = getQueryMap(old_url.getQuery());
			
			if(map != null && map.get("qw").equals("CONTENTS_SEQ")) {
				int contentsSeq = Integer.parseInt(map.get("q"));
				EduContentsVO contents = new EduContentsVO();
				contents.setSeq(contentsSeq);
				contents = eduContentsService.selectEduContentsDetail(contents);
				
				CurriculumVO curriculum = new CurriculumVO();
				curriculum.setContentsSeq(contentsSeq);
				int currentCount = curriculumService.getCurrentCount(curriculum);
				int classCount = curriculumService.getClassCount(curriculum);
				
				model.addAttribute("classCount", classCount);
				model.addAttribute("currentCount", currentCount);
				model.addAttribute("contentsSeq", contentsSeq);
				model.addAttribute("contentsTitle", contents.getTitle());
			}
			
		}
		
			
		if(curriculumVO.getSeq() != 0) {
		CurriculumVO selectCurriculum = curriculumService.selectCurriculumDetail(curriculumVO);
		model.addAttribute("curriculumVO", selectCurriculum);
		}
		
		return "curriculum.curriculumWrite";
	}
	
	public static Map<String, String> getQueryMap(String query) {
		
		if (query==null) return null;
		
		int pos1 = query.indexOf("?");
		if(pos1 >= 0) {
			query = query.substring(pos1 + 1);
		}
		
		String[] params = query.split("&");
		Map<String, String> map = new HashMap<String, String>();
		
		for(String param : params) {
			String name = param.split("=")[0];
			String value = param.split("=")[1];
			map.put(name, value);
		}
		
		return map;
	}
	
	// curriculumWrite페이지 내 컨텐츠 검색
	@RequestMapping(value = "/contentsKeyword", method = RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> searchContentsKeyword(HttpServletRequest request, CurriculumVO searchVO){

		
		Map<String, Object> map = new HashMap<String, Object>();
		searchVO.setPageUnit(10);
		map.put("dataList", curriculumService.getContentsByName(searchVO));
		
		//페이징처리 모듈
		int totalCount = curriculumService.getContentsByNameCnt(searchVO);
		searchVO.setTotalRecordCount(totalCount);
		String param= "qw=" + humanfUtil.urlEncode(searchVO.getQw())
		+ "&sortField=" + searchVO.getSortField()
		+ "&sortOrder=" + searchVO.getSortOrder();

		map.put("RenderPagination", PageNavigator.getAjaxPaging("searchRecord"
					, param
					, searchVO.getPageIndex()
					, totalCount
					, searchVO.getPageUnit()
					, searchVO.getBlockSize()
					, request.getContextPath()));
		map.put("searchVO", searchVO);
		
		return map;
	}
	
	//선택된 컨텐츠의 등록 강의 수 불러오기
	@RequestMapping(value = "/contentsStep", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Integer> contentsStep(HttpServletRequest request, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		String contentsSeq = request.getParameter("contentsSeq");
		
		//등록된 강의 수 불러오기
		CurriculumVO curriculum = new CurriculumVO();
		curriculum.setContentsSeq(Integer.parseInt(contentsSeq));
		int currentCount = curriculumService.getCurrentCount(curriculum);
		
		//예정강의수 불러오기
		int classCount = curriculumService.getClassCount(curriculum);
		
		map.put("classCount", classCount);
		map.put("currentCount", currentCount);
		
		return map;
	}
	
	//강의차수 입력시 현재 등록된 강의차수인지 확인
	@RequestMapping(value="checkClassCount", method = RequestMethod.GET)
	@ResponseBody
	public String checkClassCount(HttpServletRequest request, Model model) {
		String checkResult = "";
		
		String contentsSeq = request.getParameter("contentsSeq");
		String inputCount = request.getParameter("inputCount");
		
		CurriculumVO curriculum = new CurriculumVO();
		curriculum.setContentsSeq(Integer.parseInt(contentsSeq));
		curriculum.setStep(Integer.parseInt(inputCount));
		
		int checkCount = curriculumService.checkClassCount(curriculum);
		
		System.out.println(">>>>checkCount: " + checkCount);
		System.out.println(">>>>curriculumStep: " + curriculum.getStep());
		
		if(inputCount == "0") {
			checkResult = "false";
		} else {
			if(checkCount == 0) {
				checkResult = "true";
			}else {
				checkResult = "false";
			}
		}
		
		return checkResult;
	}
	
 	
	
	//교육과정 작성
	@RequestMapping(value = "/curriculumWrite", method = RequestMethod.POST)
	public String curriculumWriteAct(Model model, RedirectAttributes redirectAttributes,
				@ModelAttribute("curriculumVO") CurriculumVO curriculumVO,
				MultipartHttpServletRequest mtfRequest) throws Exception {
			
		int resultCnt = curriculumService.insertCurriculum(curriculumVO);
		
		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
		}
		
		List<MultipartFile> eduFileList = mtfRequest.getFiles("file");
		if(eduFileList.size() > 1) {
			//파일 리스트가 0 또는 1이 아닌 경우 에러 반환
		}
		
		if(eduFileList.get(0).isEmpty() != true) {
			MultipartFile eduFile = eduFileList.get(0);
			mediaUpload(eduFile, curriculumVO);
		}
		
		if(resultCnt > 0) {
			redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
		}
		
		String redirectUrl = "";
		redirectUrl = "redirect:./curriculumEdit?seq="+curriculumVO.getSeq();
		
		
		return redirectUrl;
	}
	
	public int mediaUpload(MultipartFile media, CurriculumVO contents) throws Exception {
		
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
	
	//커리큘럼 삭제
	@RequestMapping(value="curriculumDelete", method = RequestMethod.GET)
	public String deleteCurriculum(CurriculumVO curriculumVO, HttpSession session, HttpServletRequest request) throws Exception {
		
		EduMediaVO delMedia = new EduMediaVO();
		delMedia.setContentsSeq(curriculumVO.getSeq());
		delMedia.setReference("1");
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
		
		curriculumService.deleteCurriculum(curriculumVO);
		
		return "redirect:/admin/curriculumList";
	}
	
	//커리큘럼 다중삭제
	@RequestMapping(value="delCurriculumSeqs", produces = AjaxResultVO.PRODUCE_JSON, method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public AjaxResultVO delCurriculumSeqs(@RequestParam("seqs[]") List<Integer> seqs) throws Exception {
		
		int result = 0;
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
			
			curriculumService.delCurriculumSeqs(seqs);
		} catch (Exception ex) {
			ex.printStackTrace();
			resVO.setSuccess(false);
			resVO.setMessage("처리중 오류발생 (오류원인: "+ex.getMessage()+")");
		}
		
		return resVO;
		
	}
	
	
}
