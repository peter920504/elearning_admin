package ntck.controller;

//import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hf.elearning.category.CategoryService;
import com.hf.elearning.category.CategoryVO;

import ntck.security.AdminUserDetailsHelper;
import ntck.security.AdminUserVO;

@ControllerAdvice
public class AdviceController {

//		private static final Logger logger = LoggerFactory.getLogger(AdviceController.class);
        
    	@Autowired
    	private CategoryService categoryService;

        @SuppressWarnings("deprecation")
		@ModelAttribute("requestURI")
        public String getRequestURI(HttpServletRequest request) {
                if(StringUtils.isBlank(request.getQueryString()))
                        return request.getRequestURI();
                else
                        return request.getRequestURI()+"?"+java.net.URLDecoder.decode(request.getQueryString());
        }

        @ModelAttribute("adminUserVO")
        public AdminUserVO getLoginVO() {
                return AdminUserDetailsHelper.getAuthenticatedAdminVO();
        }
        
        @ModelAttribute("headerCate")
        public List<CategoryVO> headerCate() {
        	return categoryService.selectAllCategoryList();
        }
}
