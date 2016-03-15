package br.com.projeto.configuracao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import br.com.projeto.service.UsuarioLogadoDetailService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {


	@Autowired
	private UsuarioLogadoDetailService service;
	
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*http.csrf().disable();*/
		http.authorizeRequests()
			.antMatchers("/webjars/**").permitAll()
			.antMatchers("/assets/**").permitAll()
			.antMatchers("/css/**").permitAll()
			.antMatchers("/js/**").permitAll()
			.antMatchers("/jspl/**").permitAll()
//			.antMatchers("/usuario/form").hasRole("ADMINISTRADOR")
//			.antMatchers("/usuario/").hasRole("USUARIO")
//			.antMatchers("/usuario/").hasRole("ADMINISTRADOR")
//			.antMatchers(HttpMethod.POST,"/usuario").hasRole("ADMINISTRADOR")
//			.antMatchers("/auth/**").permitAll()
			.anyRequest().authenticated()
		.and()
			.formLogin()
			.loginPage("/login")
			.defaultSuccessUrl("/usuario")
			.failureUrl("/login?error=true")
/*			.usernameParameter("j_user")
			.passwordParameter("j_password")*/
			.permitAll()
		.and()
			.exceptionHandling().accessDeniedPage("/denied");
		
	
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(service).passwordEncoder(new BCryptPasswordEncoder());
	}
	
}
