package com.PS23034.service;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;

import com.PS23034.DAO.OrderDAO;
import com.PS23034.DAO.OrderDetailDAO;
import com.PS23034.entity.Account;
import com.PS23034.entity.CartItem;
import com.PS23034.entity.Order;
import com.PS23034.entity.OrderDetail;
import com.PS23034.entity.Product;

@Service
public class CheckOutService {

	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	public Order order (Account user, String address) {
		Order order = new Order();
		order.setAccount(user);
		order.setAddress(address);
		orderDAO.save(order);
		for(CartItem item:shoppingCartService.getItems()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(item.getPrice());
			orderDetail.setQuantity(item.getQty());
			
			Product product = new Product();
			product.setId(item.getId());
			product.setName(item.getName());
			orderDetail.setProduct(product);
			orderDetailDAO.save(orderDetail);
		}
		shoppingCartService.clear();
		return order;
	}
}
