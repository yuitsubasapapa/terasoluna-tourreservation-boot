package org.terasoluna.tourreservation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.terasoluna.gfw.security.web.logging.UserIdMDCPutFilter;
import org.terasoluna.gfw.web.logging.mdc.MDCClearFilter;
import org.terasoluna.gfw.web.logging.mdc.XTrackMDCPutFilter;

@SpringBootApplication
@ImportResource(locations = { "classpath*:/META-INF/spring/*.xml" })
public class TerasolunaTourreservationBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(TerasolunaTourreservationBootApplication.class, args);
	}
	
	@Bean
	public FilterRegistrationBean getMDCClearFilter(){
		FilterRegistrationBean bean = new FilterRegistrationBean();
		MDCClearFilter filter = new MDCClearFilter();
		bean.setFilter(filter);
		return bean;
	}
	
	@Bean
	public FilterRegistrationBean getXTrackMDCPutFilter(){
		FilterRegistrationBean bean = new FilterRegistrationBean();
		XTrackMDCPutFilter filter = new XTrackMDCPutFilter();
		bean.setFilter(filter);
		return bean;
	}
	
	@Bean
	public FilterRegistrationBean getCharacterEncodingFilter(){
		FilterRegistrationBean bean = new FilterRegistrationBean();
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		bean.setFilter(filter);
		return bean;
	}
	
	@Bean
	public FilterRegistrationBean getHiddenHttpMethodFilter(){
		FilterRegistrationBean bean = new FilterRegistrationBean();
		HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
		bean.setFilter(filter);
		return bean;
	}
	
	@Bean
	public FilterRegistrationBean getUserIdMDCPutFilter(){
		FilterRegistrationBean bean = new FilterRegistrationBean();
		UserIdMDCPutFilter filter = new UserIdMDCPutFilter();
		bean.setFilter(filter);
		return bean;
	}
	
//	@Bean
	public FilterRegistrationBean getSpringSecurityFilterChain(){
		FilterRegistrationBean bean = new FilterRegistrationBean();
		DelegatingFilterProxy filter = new DelegatingFilterProxy();
		bean.setFilter(filter);
		return bean;
	}
}
