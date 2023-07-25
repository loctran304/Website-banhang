package com.PS23034.controllerUser;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PS23034.DAO.OrderDetailDAO;
import com.PS23034.entity.Account;
import com.PS23034.entity.Order;
import com.PS23034.entity.OrderDetail;
import com.PS23034.service.CheckOutService;
import com.PS23034.service.ParamService;
import com.PS23034.service.SessionService;
import com.PS23034.service.ShoppingCartService;



@Controller
@RequestMapping("user")
public class CheckOutController {
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	CheckOutService checkOutService;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@RequestMapping("checkout")
	public String checkout(Model model) {
		model.addAttribute("cart", shoppingCartService);
		return "user/checkout";
	}
	

	@RequestMapping("/confirmation")
	public String orderdetail(Model model) {
		String address = paramService.getString("address", "");
		if(!shoppingCartService.getItems().isEmpty()) {
			if(address.equals("")) {
				model.addAttribute("message","Vui long nhap email");
				return "redirect: /user/checkout";
			}
			Account user = sessionService.get("user");
			Order order = checkOutService.order(user, address);
			List<OrderDetail> items = orderDetailDAO.findByOrderID(order.getId());
			model.addAttribute("order", order);
			model.addAttribute("items",items);
			return "user/confirmation";
		}
		return "redirect:/user/index";
	}
}
