package com.concerto.cpl.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.concerto.cpl.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	@Query(nativeQuery = true,value = "select distinct(CategoryName) from Category")
	List<String> getCategoryNames();
	
	@Query(nativeQuery = true,value = "select distinct(Grade) from Category")
	List<String> getCategoryGrade();
	

	Optional<Category> findCategoryByCategoryNameAndGrade(String categoryName,String grade);	
}
