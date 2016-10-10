package org.terasoluna.tourreservation;

import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewInterceptor;
import org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.terasoluna.gfw.web.codelist.CodeListInterceptor;
import org.terasoluna.gfw.web.logging.TraceLoggingInterceptor;
import org.terasoluna.gfw.web.token.transaction.TransactionTokenContextHandlerMethodArgumentResolver;
import org.terasoluna.gfw.web.token.transaction.TransactionTokenInterceptor;

@Configuration
@ComponentScan(basePackages = { "org.terasoluna.tourreservation.app" })
public class MvcConfigurer extends WebMvcConfigurerAdapter {

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(new PageableHandlerMethodArgumentResolver());
		argumentResolvers.add(new TransactionTokenContextHandlerMethodArgumentResolver());
		argumentResolvers.add(new AuthenticationPrincipalArgumentResolver());
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
				.addResourceLocations("/resources/", "classpath:/META-INF/resources/").setCachePeriod(60 * 60);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new TraceLoggingInterceptor()).addPathPatterns("/**");
		registry.addInterceptor(new TransactionTokenInterceptor()).addPathPatterns("/**");
		{
			LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
			interceptor.setParamName("locale");
			registry.addInterceptor(interceptor).addPathPatterns("/**");
		}
		{
			CodeListInterceptor interceptor = new CodeListInterceptor();
			interceptor.setCodeListIdPattern(Pattern.compile("CL_.+"));
			interceptor.setFallbackTo(new Locale("en"));
			registry.addInterceptor(interceptor).addPathPatterns("/**");
		}
		{
			OpenEntityManagerInViewInterceptor interceptor = new OpenEntityManagerInViewInterceptor();
			registry.addWebRequestInterceptor(interceptor).addPathPatterns("/**").excludePathPatterns("/resources/**");
		}
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("login/form");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.beanName();
		registry.tiles();
		registry.jsp("/WEB-INF/views/", null);
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions("/WEB-INF/tiles/tiles-definitions.xml");
		return tilesConfigurer;
	}
}
