package com.PS23034.controllerUser;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PS23034.DAO.AccountDAO;
import com.PS23034.DAO.ProductDAO;
import com.PS23034.entity.Product;
import com.PS23034.service.CookieService;
import com.PS23034.service.ParamService;
import com.PS23034.service.SessionService;



@Controller
@RequestMapping("user")
public class ProductSiteController {

	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accDAO;
	@Autowired
	ProductDAO proDAO;
	
	
	@RequestMapping("user/single-product")
	public String index() {
		return "user/single-product";
	}
	
	
	@RequestMapping(value = "single-product/{id}")
	public String view(ModelMap model, @PathVariable("id") int id) {
		Product product = new Product();
		List<Product> products = proDAO.findAll();
		for (Product pr : products) {
			if (pr.getId() == id) {
				product = pr;
				break;
			}
		}
		model.addAttribute("products", products);
		model.addAttribute("pr", product);
		return "user/single-product";
	}
}
