package ntck.controller;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ntck.security.AdminUserDetailsHelper;
import ntck.security.AdminUserVO;

@Controller
public class AdminController {
	
//	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
	public String home(Model model) {
		
		AdminUserVO adminUserVO= AdminUserDetailsHelper.getAuthenticatedAdminVO();
		
		if (adminUserVO == null)
			return "login.loginForm";
		
		model.addAttribute("adminUserVO", adminUserVO);
		
		return "admin.home";
	}
	
}
