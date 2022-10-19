package ntck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { "/admin" })
public class LoginController {

	@RequestMapping(value = { "/login" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request, Model model) {
		String referrer = request.getHeader("Referer");
		System.out.println("junk : check : login");
		
		if (referrer != null) {
			request.getSession().setAttribute("url_prior_login", referrer);
		}
			
		return "login.loginForm";
	}

	@RequestMapping(value = { "/login/loginFail" }, method = RequestMethod.GET)
	public String loginFail(HttpServletRequest request, Model model) {
		model.addAttribute("fail", true);
		String url = "";
		HttpSession session = request.getSession(false);
		if (session != null) {
			url = (String) request.getSession().getAttribute("url_prior_login");
		}
		model.addAttribute("url", url );

		return "login.loginForm";
	}

	@RequestMapping(value = { "/login/loginSuccess" }, method = RequestMethod.GET)
	public String loginSuccess(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			request.getSession().getAttribute("url_prior_login");
		}
		
		return "main.admin.home";
	}

	

}
