package com.concerto.cpl.controller;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.concerto.cpl.dto.ResponseData;
import com.concerto.cpl.service.TeamService;

@Controller
public class AjaxControllers {

	@Autowired
	TeamService teamService;

	@GetMapping("/getteamnames")
	public @ResponseBody ResponseData<Object> getAllTeamName() {

		try {

			return new ResponseData<>(200, this.teamService.getAllTeamsName());
		} catch (EntityNotFoundException e) {
			return new ResponseData<>(401, "No Content Present");
		}

	}

}
