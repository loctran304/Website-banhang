package com.PS23034.controllerUser;


import java.util.Optional;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PS23034.DAO.ProductDAO;
import com.PS23034.entity.Product;
import com.PS23034.service.CookieService;
import com.PS23034.service.ParamService;
import com.PS23034.service.SessionService;



@Controller
public class HomeController {

	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductDAO dao;
	
	@RequestMapping("/user/index")
	public String product(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		return "user/index";
	}
	
	




	
	@RequestMapping("user/contact")
	public String showForm6() {
		return "user/contact";
	}
	@RequestMapping("user/single-blog")
	public String showForm7() {
		return "user/single-blog";
	}
	@RequestMapping("user/tracking-order")
	public String showForm8() {
		return "user/tracking-order";
	}
	@RequestMapping("user/blog")
	public String showForm9() {
		return "user/blog";
	}


	
	@RequestMapping("admin/index")
	public String showFormAdmin() {
		return "admin/index";
	}

}
