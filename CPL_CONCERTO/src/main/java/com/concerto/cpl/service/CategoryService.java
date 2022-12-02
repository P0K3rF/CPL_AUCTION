package com.concerto.cpl.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concerto.cpl.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepository;
	
	
	public List<String> getCategoryName(){
		
		if(this.categoryRepository.count()>0) {
			return this.categoryRepository.getCategoryNames();
		}
		throw new EntityNotFoundException("No Category There");
		
	}


	public List<String> getCategoryGrade() {

		if(this.categoryRepository.count()>0) {
			return this.categoryRepository.getCategoryGrade();
		}
		throw new EntityNotFoundException("No Category There");
	}
	
	
}
