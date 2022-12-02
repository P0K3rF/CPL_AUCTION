package com.concerto.cpl.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.concerto.cpl.dto.LoginRequestDto;
import com.concerto.cpl.service.CategoryService;
import com.concerto.cpl.service.TeamService;

@Controller
public class HomeController {

	@Autowired
	TeamService teamService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping({ "/", "index" })
	public String renderHomePage() {
		return "index";
	}

	@GetMapping("/login")
	public String renderLoginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String processLoginForm(LoginRequestDto loginRequestDto, HttpSession session) {
		if (loginRequestDto.getEmail().equals("admin@gmail.com") && loginRequestDto.getPassword().equals("admin")) {
			session.setAttribute("admin", "admin");
			return "redirect:homepage";
		}
		return "redirect:login?msg=Invalid Credentails";
	}

	@GetMapping("/homepage")
	public String homePage(HttpSession session) {
		if (session.getAttribute("admin") != null) {

			return "homepage";
		}
		return "redirect:login";
	}

	@GetMapping("/auctioninfo")
	public String auctionInfo(@RequestParam(required = true, name = "n") String name,
			@RequestParam(required = true, name = "y") String year, HttpSession session, Model m) {
		if (session.getAttribute("admin") != null) {
			m.addAttribute("name", name);
			m.addAttribute("year", year);
			m.addAttribute("teams",this.teamService.getAllTeamsName());
			return "auctioninfo";
		}

		return "redirect:login";
	}

	@GetMapping("/auction")
	public String renderAuctionPage(HttpSession session,Model m) {
		if (session.getAttribute("admin") != null) {
			m.addAttribute("categoryNames",this.categoryService.getCategoryName());
			m.addAttribute("categoryGrade",this.categoryService.getCategoryGrade());
			return "auction";
		}
		return "redirect:login";
	}

}