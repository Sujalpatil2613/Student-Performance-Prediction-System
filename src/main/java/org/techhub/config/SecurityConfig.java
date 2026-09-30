package org.techhub.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	 http
    	    .csrf().disable()
    	    .authorizeRequests()

    	        // ✅ PUBLIC PAGES
    	    .antMatchers("/", "/login", "/doLogin", "/saveContact").permitAll()

    	        // ✅ ADMIN
    	        .antMatchers("/admin/**").hasRole("ADMIN")

    	        // ✅ TEACHER & STUDENT → ALLOW WITHOUT ADMIN LOGIN
    	        .antMatchers("/teacher/**", "/student/**").permitAll() // admin protected
            .anyRequest().authenticated()
        .and()
        .formLogin()
            .loginPage("/AdminLogin")          
            .loginProcessingUrl("/login")      
            .defaultSuccessUrl("/admin/dashboard", true) 
            .failureUrl("/AdminLogin?error=true")
            .permitAll()
        .and()
        .logout()
            .logoutUrl("/logout")
            .logoutSuccessUrl("/")
            .permitAll();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
        .inMemoryAuthentication()
        .passwordEncoder(NoOpPasswordEncoder.getInstance())
        .withUser("Sujal")
        .password("12345")
        .roles("ADMIN");
   }
}



//Rushi123@gmail.com
//00000 teacher
//sujalp7796@gmail.com
//11111 student