package com.PS23034.controllerUser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PS23034.DAO.AccountDAO;
import com.PS23034.entity.Account;
import com.PS23034.service.CookieService;
import com.PS23034.service.ParamService;
import com.PS23034.service.SessionService;

@Controller
public class ProfileController {
	

	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO dao;
	
	@RequestMapping("/user/profile")
	public String profile(ModelMap model) {
		
		
		
		return "user/profile";
	}
	
	@RequestMapping("/user/profile/update")
	public String update( Account item) {
		String username = paramService.getString("username", "");
		String fullname = paramService.getString("fullname", "");
		String email = paramService.getString("email", "");
		//String photo = paramService.getString("photo", "");
		Account user = dao.findById(username).get();
		user.setUsername(username);
		user.setFullname(fullname);
		user.setEmail(email);
		//user.setPhoto(photo);
		dao.save(user);
		sessionService.set("user", user);
		return "user/profile";
	}
	
	
	
}
