package com.PS23034.controllerUser;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PS23034.DAO.AccountDAO;
import com.PS23034.DAO.CategoryDAO;
import com.PS23034.DAO.ProductDAO;
import com.PS23034.entity.Category;
import com.PS23034.entity.Product;
import com.PS23034.service.CookieService;
import com.PS23034.service.ParamService;
import com.PS23034.service.SessionService;

@Controller

public class UserProductController {
	

	@Autowired
	ProductDAO dao;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accDAO;
	@Autowired
	CategoryDAO cateDAO;
	
	
	
	
	@RequestMapping("user/category/search")
	public String search(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(sessionService.get("keywords"));
		sessionService.set("keywords", kwords);
		List<Category>  cate=cateDAO.findAll();
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> page = dao.findByKeywords("%" + kwords + "%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("category", cate);
		
		return "user/category";

	}
	
	@RequestMapping("/user/category")
	public String searchGia(Model model, @RequestParam("min") Optional<Integer> min,
			@RequestParam("max") Optional<Integer> max, @RequestParam("p") Optional<Integer> p) {
		Integer minPrice = min.orElse(sessionService.get("min"));
		Integer maxPrice = max.orElse(sessionService.get("max"));
		sessionService.set("max", maxPrice);
		sessionService.set("min", minPrice);
		
		List<Category>  cate=cateDAO.findAll();
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> page = dao.findByPrice(minPrice, maxPrice, pageable);
		model.addAttribute("page", page);
		model.addAttribute("category", cate);
		
		return "user/category3";

	}
	@RequestMapping("/user/category/brand")
	public String searchGia2(Model model, @RequestParam("field1") Optional<String> field1,
			@RequestParam("p") Optional<Integer> p) {
		String field = field1.orElse(sessionService.get("field1"));
		sessionService.set("field1", field);
		List<Category>  cate=cateDAO.findAll();
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> page = dao.findByCategory(field, pageable);
		model.addAttribute("category", cate);
		model.addAttribute("page", page);
		return "user/category2";

	}
	
	
	
	
	
	
	
	


}
