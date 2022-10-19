package com.hf.elearning.ulog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
public class UserLogController {

	private static final Logger logger = LoggerFactory.getLogger(UserLogController.class);

	@Autowired
	private SvcsUserService svcsUserService;

	@Resource(name = "userLogService")
	private UserLogService userLogService;

	@RequestMapping(value = "/userLogList", method = RequestMethod.GET)
	public String userLogList(HttpServletRequest request, Model model, @ModelAttribute("searchVO") UserLogVO searchVO)
			throws UnsupportedEncodingException {

		// 로그인 여부 확인
//		AdminUserVO adminUserVO = AdminUserDetailsHelper.getAuthenticatedAdminVO();
//		if (adminUserVO == null)
//			return "login.loginForm";

		// 관리자계정 메뉴에 들어올 수 있는 권한 보유 여부 확인

		// 사용자 목록 count
		int totalCount = userLogService.selectUserLogListCnt(searchVO);

		// 사용자 목록
		List<UserLogVO> userLogList = userLogService.selectUserLogList(searchVO);

		if (userLogList != null) {
			model.addAttribute("userLogList", userLogList);
		}
		model.addAttribute("dataCount", totalCount);

		// 페이징처리모듈
		searchVO.setTotalRecordCount(totalCount);
		String param = "qw=" + humanfUtil.urlEncode(searchVO.getQw()) + "&q=" + humanfUtil.urlEncode(searchVO.getQ())
				+ "&sortField=" + searchVO.getSortField() + "&sortOrder=" + searchVO.getSortOrder();

		model.addAttribute("RenderPagination", PageNavigator.getBootstrapPaging(param, searchVO.getPageIndex(),
				totalCount, searchVO.getPageUnit(), searchVO.getBlockSize(), request.getContextPath()));

		return "user.userLogList";
	}


	@RequestMapping(value = "/userLogDelete", method = RequestMethod.POST)
	public String userLogDelete(Model model, RedirectAttributes redirectAttributes,
			@ModelAttribute("userLogVO") UserLogVO userLogVO) throws Exception {

		int resultCnt = 0;
//		System.out.println(">>>>" + userLogVO.getSeq());
		// seq 판단 (수정 or 등록)
		// seq 판단 (수정 or 등록)
		if (userLogVO.getSeq() != 0) {
			model.addAttribute("userLogVO", userLogService.deleteUserLog(userLogVO));
		}

		return "redirect:./userLogList";
	}
	
	@RequestMapping(value = "/downloadExcel", method = RequestMethod.POST)
	public ResponseEntity<InputStreamResource> downloadExcel(HttpServletRequest request) throws Exception {
		try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("유저로그 전체목록");
            int rowNo = 0;
 
            CellStyle headStyle = workbook.createCellStyle();
            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = workbook.createFont();
            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
            font.setFontHeightInPoints((short) 13);
            headStyle.setFont(font);
 
            Row headerRow = sheet.createRow(rowNo++);
            headerRow.createCell(0).setCellValue("번호");
            headerRow.createCell(1).setCellValue("사용자로그인ID");
            headerRow.createCell(2).setCellValue("활동시간");
            headerRow.createCell(3).setCellValue("활동구분코드명");
            for(int i=0; i<=3; i++){
                headerRow.getCell(i).setCellStyle(headStyle);
            }
 
            List<UserLogVO> userLogList = userLogService.selectUserLogExcelList();
            for (UserLogVO userLogVO : userLogList) {
                Row row = sheet.createRow(rowNo++);
                row.createCell(0).setCellValue(userLogVO.getSeq());
                row.createCell(1).setCellValue(userLogVO.getId());
                row.createCell(2).setCellValue(userLogVO.getActionDate());
                row.createCell(3).setCellValue(userLogVO.getTypeName());
            }
 
            sheet.setColumnWidth(0, 3000);
            sheet.setColumnWidth(1, 3000);
            sheet.setColumnWidth(2, 4000);
            sheet.setColumnWidth(3, 8000);
 
            File tmpFile = File.createTempFile("TMP~", ".xlsx");
            try (OutputStream fos = new FileOutputStream(tmpFile);) {
                workbook.write(fos);
            }
            InputStream res = new FileInputStream(tmpFile) {
                @Override
                public void close() throws IOException {
                    super.close();
                    if (tmpFile.delete()) {
//                        logger.info("임시 파일 삭제 완료");
                    }
                }
            };
 
            return ResponseEntity.ok() 
                    .contentLength(tmpFile.length()) 
                    .contentType(MediaType.APPLICATION_OCTET_STREAM) 
                    .header("Content-Disposition", "attachment;filename=userLogList.xlsx") 
                    .body(new InputStreamResource(res));
 
        }
	}
	
}
