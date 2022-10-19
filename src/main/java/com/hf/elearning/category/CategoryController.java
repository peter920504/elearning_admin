package com.hf.elearning.category;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ntck.model.AjaxResultVO;

@Controller
@RequestMapping(value = "/admin")
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Resource(name = "categoryService")
	private CategoryService categoryService;
	
	@RequestMapping(value = "/categoryList", method = RequestMethod.GET)
	public String categoryList(HttpServletRequest request, Model model,
			@ModelAttribute("searchVO") CategoryVO searchVO) throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		
		// 카테고리관리 메뉴에 들어올 수 있는 권한 보유 여부 확인
			
		// 대분류 목록
		List<CategoryVO> categoryList = categoryService.selectCategoryLv1();

		if (categoryList != null) {
			model.addAttribute("categoryList", categoryList);
		}

		return "category.categoryList";
	}
	
	@RequestMapping(value = "/categoryAjax", method = RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> categoryAjax(
			HttpServletRequest request, 
			CategoryVO categoryVO){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("dataList", categoryService.getCateList(categoryVO));
		
		return map;
	}
	
	@RequestMapping(value = "/categoryWrite", method = RequestMethod.GET)
	public String categoryWrite(HttpServletRequest request, Model model,
			@ModelAttribute("categoryVO") CategoryVO categoryVO) throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		
		// 카테고리관리 메뉴에 들어올 수 있는 권한 보유 여부 확인
		
		// 등록 or 수정 판단
		if(categoryVO.getSeq() != 0) {
			categoryVO = categoryService.selectCategoryDetail(categoryVO);
			model.addAttribute("lv1", categoryService.selectPTitle(categoryVO.getpSeq()));
			model.addAttribute("lv2", categoryService.selectPTitle(categoryVO.getSeq()));
			model.addAttribute("categoryVO", categoryVO);
		}
		
		// 대분류 목록
		model.addAttribute("cate1List", categoryService.selectCategoryLv1());
		
			
		return "category.categoryWrite";
	}
	
	@RequestMapping(value = "/categoryWrite", method = RequestMethod.POST)
	public String categoryWriteSubmit(HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,
			@ModelAttribute("categoryVO") CategoryVO categoryVO) throws UnsupportedEncodingException {
		
		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";
		
		// 카테고리관리 메뉴에 들어올 수 있는 권한 보유 여부 확인
		
		// 등록 or 수정 판단
		if(categoryVO.getSeq() != 0) {
			int cnt = categoryService.updateCategory(categoryVO);
			if(cnt > 0) {
				redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
				redirectAttributes.addFlashAttribute("categoryVO", categoryVO);
			}
		}else {
			int cnt = categoryService.insertCategory(categoryVO);
			if(cnt > 0) {
				if(categoryVO.getLevel() == 1) {
					categoryVO.setpSeq(categoryVO.getSeq());
					categoryService.updatePSeq(categoryVO);
				}
				redirectAttributes.addFlashAttribute("write_ok_message", "정상적으로 처리되었습니다.");
				redirectAttributes.addFlashAttribute("categoryVO", categoryVO);
			}
		}
		// 대분류 목록
		model.addAttribute("cate1List", categoryService.selectCategoryLv1());
		
		
		return "redirect:./categoryWrite";
	}
	
	@RequestMapping(value="/getSubCateList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> getSubCateList(HttpServletRequest request, Model model) {
		String key = request.getParameter("key");
		String level = request.getParameter("level");
		
		CategoryVO p_cate = new CategoryVO();
		/*
		p_cate.setSeq(Integer.parseInt(key));
		p_cate = categoryService.selectCategoryDetail(p_cate);
		
		p_cate.setLevel(p_cate.getLevel()+1);
		*/
		
		System.out.println(">>>key: " + key);
		
		if(!key.isEmpty()) {
			p_cate.setLevel(Integer.parseInt(level));
			p_cate.setpSeq(Integer.parseInt(key));
		}
		
		List<CategoryVO> subCateList = categoryService.getSubCateList(p_cate);
		
		if(subCateList.isEmpty()) {
			CategoryVO nullCate = new CategoryVO();
			nullCate.setLevel(0);
			subCateList.add(nullCate);
		}
		
		return subCateList;
	}
	
	@RequestMapping(value = "/checkRowLevel", method = RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> checkRowLevel(
			HttpServletRequest request, 
			int seq){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int chkCnt = categoryService.chkRowLevelData(seq);
		
		map.put("chkCnt", chkCnt);
		
		return map;
	}
	
	@RequestMapping(value = "/categoryDeleteIds", produces = AjaxResultVO.PRODUCE_JSON)
	@ResponseBody
	public AjaxResultVO categoryDeleteIds(@RequestParam("ids[]") String[] ids) {
		AjaxResultVO resVO = new AjaxResultVO();
		try {
			categoryService.deleteRecord(ids);
		} catch (Exception ex) {
			ex.printStackTrace();
			resVO.setSuccess(false);
			resVO.setMessage("처리중 오류발생 (오류원인: "+ex.getMessage()+")");
		}
		return resVO;
	}
	
}
