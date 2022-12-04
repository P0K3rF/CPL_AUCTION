package com.concerto.cpl.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.concerto.cpl.dto.CategoryAndPageDto;
import com.concerto.cpl.dto.LoginRequestDto;
import com.concerto.cpl.entity.Category;
import com.concerto.cpl.entity.Player;
import com.concerto.cpl.mapper.BeanMapper;
import com.concerto.cpl.service.CategoryService;
import com.concerto.cpl.service.PlayerService;
import com.concerto.cpl.service.TeamService;

@Controller
public class HomeController {

	@Autowired
	TeamService teamService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	PlayerService playerService;

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
			m.addAttribute("teams", this.teamService.getAllTeamsName());
			return "auctioninfo";
		}

		return "redirect:login";
	}

	@GetMapping("/auction")
	public String renderAuctionPage(HttpSession session, Model m) {
		if (session.getAttribute("admin") != null) {
			m.addAttribute("categoryNames", this.categoryService.getCategoryName());
			m.addAttribute("categoryGrade", this.categoryService.getCategoryGrade());
			m.addAttribute("teams", this.teamService.getAllTeamsName());
			return "auction";
		}
		return "redirect:login";
	}

	@PostMapping("/playerdata")
	public @ResponseBody Map<String, Object> getPlayerData(@RequestBody CategoryAndPageDto categoryAndPageDto) {
		Map<String, Object> map=new HashMap<>();
		try {
			Category category = this.categoryService.getCategoryByNameAndGrade(categoryAndPageDto.getCategoryName(),
					categoryAndPageDto.getCategoryGrade());
			map = this.playerService.getPlayerData(category, categoryAndPageDto.getPageNo());
			Player player = (Player) map.get("data");
			
			map.put("data", BeanMapper.convertPlayerTolayerDataDto(player));
			return map;
//			return new ResponseData<>(200, map);
		} catch (Exception e) {
			map.put("statusCode", 401);
			return map;
//			return new ResponseData<Object>(401, "No Data Present");
		}

	}

}
