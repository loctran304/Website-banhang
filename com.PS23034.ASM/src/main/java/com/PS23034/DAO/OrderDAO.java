package com.PS23034.DAO;

import java.util.Date;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.PS23034.entity.Order;



public interface OrderDAO extends JpaRepository<Order, Long>{
	
	@Query("SELECT o FROM Order o WHERE o.account.username = ?1")
	List<Order> findOrderByAccount(String username);
	
	@Query("Select o from Order o where o.createDate between ?1 and ?2")
	Page<Order> findOrderByDate(Date firstDate, Date lastDate, Pageable pageable);
	
	
}
