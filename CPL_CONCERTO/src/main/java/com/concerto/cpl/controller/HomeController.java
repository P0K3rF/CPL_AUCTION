package com.concerto.cpl.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.concerto.cpl.dto.LoginRequestDto;
import com.concerto.cpl.dto.TeamDetailsDto;
import com.concerto.cpl.entity.Team;
import com.concerto.cpl.repository.OwnerRepository;
import com.concerto.cpl.service.AuctionMasterService;
import com.concerto.cpl.service.AuctionService;
import com.concerto.cpl.service.CategoryService;
import com.concerto.cpl.service.OwnerService;
import com.concerto.cpl.service.PlayerService;
import com.concerto.cpl.service.TeamService;

@Controller
public class HomeController {

	@Autowired
	TeamService teamService;
	@Autowired
	AuctionService auctionService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	PlayerService playerService;

	@Autowired
	AuctionMasterService auctionMasterService;
	
	@Autowired
	OwnerService ownerService;
	
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
	public String homePage(HttpSession session,Model m) {
		if (session.getAttribute("admin") != null) {
			m.addAttribute("auction", this.auctionMasterService.getAllAuctionMasterData());
			return "homepage";
		}
		return "redirect:login";
	}

	@GetMapping("/auctioninfo")
	public String auctionInfo(@RequestParam(required = true, name = "name") String name, HttpSession session, Model m) {
		
		if (session.getAttribute("admin") != null) {
			session.setAttribute("auction", name);
			m.addAttribute("name", name);
			m.addAttribute("auction",this.auctionMasterService.getAuctionByAuctionName(name));
			m.addAttribute("playerCount",this.playerService.getAllPlayer().size());
			m.addAttribute("teamsData", this.teamService.getAllTeam());
			m.addAttribute("playersData", this.playerService.getAllPlayer());
			m.addAttribute("categories", this.categoryService.getAllCategory());
			m.addAttribute("owners", this.ownerService.getAllOwner());
			return "auctioninfo";
		}

		return "redirect:login";
	}
	
	@GetMapping("/teamdetails")
	public String teamDetails(@RequestParam(required = true, name = "teamId") String teamId, Model m,
			HttpSession session) {
		if (session.getAttribute("admin") != null) {

			// You will get team Id or Team Name here

		 	// check if null then
			if (teamId != null) {
				m.addAttribute("teamDetails", this.teamService.getTeamDetailsById(teamId));
				m.addAttribute("playerList", this.playerService.getPlayerListByTeamId(teamId));
			m.addAttribute("ownerName",this.ownerService.getOwnerNameByTeamId(Integer.parseInt(teamId)));
		String auctioname=(String)session.getAttribute("auction");
		
			int totalPlayerPerTeam=this.auctionMasterService.getPlayerPerTeam(this.auctionMasterService.getAuctionByAuctionName(auctioname).getAuctionId());
			int pointsPerTeam=this.auctionMasterService.getPointsPerTeam(this.auctionMasterService.getAuctionByAuctionName(auctioname).getAuctionId());
				int remainingPlayers=totalPlayerPerTeam-this.playerService.getPlayerListByTeamId(teamId).size();
			m.addAttribute("remainingPlayers",remainingPlayers);	
			int purseLeft=pointsPerTeam-this.auctionService.getPurseLeft(Integer.parseInt(teamId));
			m.addAttribute("purseLeft",purseLeft);
			m.addAttribute("totalPlayer",totalPlayerPerTeam);
			m.addAttribute("PointsPerTeam",pointsPerTeam);
			}

			return "teamdetails";
		}

		return "login";
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


}
