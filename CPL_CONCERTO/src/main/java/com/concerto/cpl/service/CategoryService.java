package com.concerto.cpl.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.entity.Category;
import com.concerto.cpl.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

	public List<String> getCategoryName() {

		if (this.categoryRepository.count() > 0) {
			return this.categoryRepository.getCategoryNames();
		}
		throw new EntityNotFoundException("No Category There");

	}

	public List<String> getCategoryGrade() {

		if (this.categoryRepository.count() > 0) {
			return this.categoryRepository.getCategoryGrade();
		}
		throw new EntityNotFoundException("No Category There");
	}
	
	public List<Category> getAllCategory()
	{
		if(this.categoryRepository.count()>0) {
			return this.categoryRepository.findAll();
		}
		throw new EntityNotFoundException("No Category available");
	}

	public Category getCategoryByNameAndGrade(String categoryName, String categoryGrade) throws Exception {
		try {
			
	return this.categoryRepository.findCategoryByCategoryNameAndGrade(categoryName, categoryGrade).get();

				}
		catch(Exception e) {
			throw new Exception("No Category Found");
		}
	}

}
