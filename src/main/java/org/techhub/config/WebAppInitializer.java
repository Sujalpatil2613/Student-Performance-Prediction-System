package org.techhub.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class WebAppInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();

        // ROOT CONFIG
        ctx.register(DBConfig.class);
        servletContext.addListener(new ContextLoaderListener(ctx));

        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();

        // MVC CONFIG
        context.register(WebMVCConfig.class);

        DispatcherServlet dispatcherServlet = new DispatcherServlet(context);

        ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);

        servlet.setLoadOnStartup(1);

        servlet.addMapping("/");
    }
}