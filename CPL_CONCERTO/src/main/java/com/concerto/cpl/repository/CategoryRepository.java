package com.concerto.cpl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.concerto.cpl.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	@Query(nativeQuery = true,value = "select CategoryName from Category")
	List<String> getCategoryNames();
	
	@Query(nativeQuery = true,value = "select Grade from Category")
	List<String> getCategoryGrade();
	
}
