package com.PS23034.DAO;

import java.util.List;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.PS23034.entity.Product;
import com.PS23034.entity.ReportCategory;




public interface ProductDAO extends JpaRepository<Product, Integer>{
	
	@Query("SELECT o FROM Product o WHERE o.name like %?1%")
	List<Product> findByName(String name);
	
	
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	Page<Product> findByPrice(Integer minPrice, Integer maxPrice, Pageable pageable);
	

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);
	
	
	@Query("SELECT o FROM Product o WHERE o.category.id = ?1")
	Page<Product> findByCategory(String id, Pageable pageable);

	
	
	
	@Query("SELECT o FROM Product o WHERE o.category.id = ?1")
	List<Product> findByCategoryHome(String id);
	
	@Query("SELECT new ReportCategory(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<ReportCategory> getReportCategory();
	
}
