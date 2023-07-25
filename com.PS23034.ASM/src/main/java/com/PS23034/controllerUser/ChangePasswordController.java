package com.PS23034.controllerUser;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PS23034.DAO.AccountDAO;
import com.PS23034.entity.Account;
import com.PS23034.service.ParamService;



@Controller
public class ChangePasswordController {

	@Autowired
	ParamService paramService;
	
	@Autowired
	AccountDAO accDAO;
	
	@RequestMapping("user/change-password")
	public String index() {
		return "user/changePassword";
	}
	
	@PostMapping("user/change-password")
	public String change(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		String newpassword= paramService.getString("newpassword", "");
		String confirmpassword= paramService.getString("confirmpassword", "");
		try {
			Account user = accDAO.findById(username).get();
				if(!user.getPassword().equals(password)) {
					model.addAttribute("message", "Wrong Password!");
				}else {
					if(newpassword.equals(confirmpassword)) {
						user.setPassword(confirmpassword);
						accDAO.save(user);
						model.addAttribute("message", "Password is changed!");
					}else {
						model.addAttribute("message", "Password not match!");
					}
				}
		} catch (Exception e) {
			model.addAttribute("message", "Account invalid!");
		}
		return "user/changePassword";
	}
}
