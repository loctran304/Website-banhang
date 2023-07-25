package com.PS23034.DAO;

import java.util.List;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.PS23034.entity.Account;
import com.PS23034.entity.TopCustomer;




public interface AccountDAO extends JpaRepository<Account, String>{
	
   Optional<Account> findByUsername(String username);
   
	@Query("SELECT o FROM Account o WHERE o.fullname LIKE ?1")
	Page<Account> findByKeywords(String keywords, Pageable pageable);
	
	@Query("SELECT o FROM Account o")
	Page<Account> findAll(Pageable pageable);
	
	@Query("SELECT new TopCustomer(o.account, count(o.account.username)) FROM Order o GROUP BY o.account.username ORDER BY count(o.account.username) DESC")
	List<TopCustomer> getTopAccount();
	
	
	///@Query(value = "select username, COUNT(username) from orders group by username order by count(username) desc", nativeQuery =true )
	//List<TopCustomer> getTopAccount();
}
