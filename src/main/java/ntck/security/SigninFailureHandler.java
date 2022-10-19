package ntck.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class SigninFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	public static String DEFAULT_TARGET_PARAMETER = "spring-security-redirect-login-failure";
	private String targetUrlParameter = DEFAULT_TARGET_PARAMETER;

	public String getTargetUrlParameter() {
		return targetUrlParameter;
	}

	public void setTargetUrlParameter(String targetUrlParameter) {
		this.targetUrlParameter = targetUrlParameter;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {

		logger.debug("onAuthenticationFailure");

		String redirectUrl = request.getParameter(this.targetUrlParameter);
		if (redirectUrl != null) {
			logger.debug("Found redirect URL: " + redirectUrl);
			getRedirectStrategy().sendRedirect(request, response, redirectUrl);
		} else {
			super.onAuthenticationFailure(request, response, exception);
		}

	}
}
