package ntck.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class SigninSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(SigninSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		logger.debug("onAuthenticationSuccess");

		//	작업팀 요청사항으로 기본여람 페이지로 이동
		//super.onAuthenticationSuccess(request, response, auth);
		response.sendRedirect(request.getContextPath() + "/admin");
	}
}