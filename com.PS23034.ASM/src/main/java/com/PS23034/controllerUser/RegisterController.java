package com.PS23034.controllerUser;


import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PS23034.DAO.AccountDAO;
import com.PS23034.entity.Account;
import com.PS23034.service.ParamService;



@Controller
@RequestMapping("user")
public class RegisterController {
	@Autowired
	ParamService paramService;
	
	@Autowired
	AccountDAO accountDAO;
	
	@RequestMapping("register")
	public String register(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		return "user/register";
	}
	
	@RequestMapping("/register/create")
	public String create(Model model, Account item) {
		item.setActivated(false);
		item.setAdmin(false);
		item.setPhoto("");
		accountDAO.save(item);
		model.addAttribute("message", "Insert successfully");
		return "redirect:/user/login";
	}
	

	@ModelAttribute("activateds")
	public Map<Boolean, String>getActivateds(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Active");
		map.put(false, "Unactive");
		return map;
	}
	
	@ModelAttribute("admin")
	public Map<Boolean, String>getAdmins(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Admin");
		map.put(false, "Customer");
		return map;
	}
}
