package br.com.projeto.configuracao;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.sun.org.apache.xerces.internal.parsers.SecurityConfiguration;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[]{AppWebConfiguration.class};
		/*return new Class[]{SecurityConfiguration.class, AppWebConfiguration.class, JPAConfiguration.class};*/
	}	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		/*return new Class[]{};*/
		return new Class[]{};
	}

	@Override
	protected String[] getServletMappings() {
//		return new String[] {"/", "/dwr/*"};
		return new String[] {"/dwr/*","/"};
	}

	   @Override
	    protected Filter[] getServletFilters() {
	        Filter [] singleton = { new CORSFilter(), new CsrfHeaderFilter() };
		   /*Filter [] singleton = { new CORSFilter() };*/
	        return singleton;
	    }	

}
