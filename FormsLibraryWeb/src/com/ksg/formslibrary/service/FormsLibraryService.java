package com.ksg.formslibrary.service;

import java.util.List;

import com.kahg.jcf.errors.ApplicationException;
import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.ListValues;
import com.ksg.formslibrary.domain.SearchCriteria;

public interface FormsLibraryService {
	
	List<Form> getForms();

	List<Form> search(String affiliate, SearchCriteria searchCriteria);
	
	Form searchDetail(String url);

}
