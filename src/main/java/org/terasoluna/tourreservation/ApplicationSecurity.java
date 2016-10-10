package org.terasoluna.tourreservation;

import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.access.DelegatingAccessDeniedHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.csrf.InvalidCsrfTokenException;
import org.springframework.security.web.csrf.MissingCsrfTokenException;
import org.terasoluna.gfw.security.web.redirect.RedirectAuthenticationHandler;

@Configuration
@EnableWebSecurity(debug=true)
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class ApplicationSecurity extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		provider.setPasswordEncoder(passwordEncoder);
		auth.authenticationProvider(provider);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		SimpleUrlAuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();
		failureHandler.setDefaultFailureUrl("/login?error=true");
		failureHandler.setUseForward(true);
		RedirectAuthenticationHandler redirectHandler = new RedirectAuthenticationHandler();

		DelegatingAccessDeniedHandler accessDeniedHandler = null;
		{
			LinkedHashMap<Class<? extends AccessDeniedException>, AccessDeniedHandler> handlers = new LinkedHashMap<>();
			{
				AccessDeniedHandlerImpl handlerImpl = new AccessDeniedHandlerImpl();
				handlerImpl.setErrorPage("/WEB-INF/views/common/error/csrf-error.jsp");
				handlers.put(InvalidCsrfTokenException.class, handlerImpl);
			}
			{
				AccessDeniedHandlerImpl handlerImpl = new AccessDeniedHandlerImpl();
				handlerImpl.setErrorPage("/WEB-INF/views/common/error/missing-csrf-token-error.jsp");
				handlers.put(MissingCsrfTokenException.class, handlerImpl);
			}
			AccessDeniedHandlerImpl accessDeniedHandlerImpl = new AccessDeniedHandlerImpl();
			accessDeniedHandlerImpl.setErrorPage("/WEB-INF/views/common/error/access-denied-error.jsp");
			accessDeniedHandler = new DelegatingAccessDeniedHandler(handlers, accessDeniedHandlerImpl);
		}

		http.formLogin().loginPage("/login").defaultSuccessUrl("/", false).failureHandler(failureHandler)
				.successHandler(redirectHandler);
		http.logout().logoutUrl("/logout").logoutSuccessUrl("/").deleteCookies("JSESSIONID")
				.invalidateHttpSession(true);
		http.rememberMe().key("terasoluna-tourreservation-km/ylnHv").tokenValiditySeconds(2419200);
		http.sessionManagement();
		http.csrf();
		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler);
		http.headers();
	}
}
