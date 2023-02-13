package com.phmth.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/template/**").addResourceLocations("/template/");
		registry.addResourceHandler("/template/web/css/**").addResourceLocations("/template/web/css/");
		registry.addResourceHandler("/template/web/js/**").addResourceLocations("/template/web/js/");
		registry.addResourceHandler("/template/admin/css/**").addResourceLocations("/template/admin/css/");
		registry.addResourceHandler("/template/admin/js/**").addResourceLocations("/template/admin/js/");
	}

}
