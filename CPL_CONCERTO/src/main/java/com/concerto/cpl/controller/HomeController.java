package com.concerto.cpl.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.concerto.cpl.dto.LoginRequestDto;

@Controller
public class HomeController {
	
	@GetMapping({"/","index"})
	public String renderHomePage() {
		return "index";
	}
	
	
	@GetMapping("/login")
	public String renderLoginPage() {
		return "login";
	}
	
	@PostMapping("/login")
	public String processLoginForm(LoginRequestDto loginRequestDto,HttpSession session)
	{
		if(loginRequestDto.getEmail().equals("admin@gmail.com") && loginRequestDto.getPassword().equals("admin"))
		{
			session.setAttribute("admin", "admin");
			return "redirect:homepage";
		}
		return "redirect:login?msg=Invalid Credentails";
		}
	
	@GetMapping("/homepage")
	public String homePage(HttpSession session) {
		if(session.getAttribute("admin")!=null) {
			
			return "homepage";
		}
		return "redirect:login";
	}
	
}
