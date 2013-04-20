package com.ksg.formslibrary.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.KeyValue;
import com.ksg.formslibrary.domain.ListValues;
import com.ksg.formslibrary.domain.SearchCriteria;
import com.ksg.formslibrary.service.FormsLibraryService;
import com.ksg.formslibrary.service.FormsLibraryServiceException;
import com.ksg.formslibrary.service.ListValueService;
import com.ksg.formslibrary.util.FormBuilder;

import dw.spring3.rest.bean.Employee;
import dw.spring3.rest.bean.EmployeeList;



/**
 * Controller class responsible for processing requests
 * for the search functionality.  Renders search page, processes search
 * requests, renders search and results
 *
 */
@Controller("searchFormController")
//@RequestMapping(value = "/search")
public class SearchFormsController {
	private static final String VIEW_SEARCH = "search";

	private static final Logger log = Logger.getLogger(SearchFormsController.class);

	@Autowired
	private ListValueService listValueService;
	
	@Autowired
	private FormsLibraryService formsLibraryService;
	
	@Autowired
	RestTemplate restTemplate;

	
	@RequestMapping(value = "/internal/search", method=RequestMethod.GET)
	public String showSearchCriteriaForInternal(Model model) {
		log.info("returning view for internal GET...");
		model.addAttribute("showAdvance", true);
		return VIEW_SEARCH;
	}
	
	@RequestMapping(value = "/external/search", method=RequestMethod.GET)
	public String showSearchCriteriaForExternal(Model model) {
		log.info("returning view for external GET...");
		model.addAttribute("showAdvance", false);
		return VIEW_SEARCH;
	}

	/**
	 * Returns reference data for list values
	 * @return <code>ListValues</code>
	 */
//	@ModelAttribute(value="listValues")
//	public ListValues setupListValues() {
//		log.info("getting ModelAttribute for listValues...");
//		return listValueService.getListValues();
//	}
	
	@ModelAttribute(value="listValues")
	public Map<String, List<KeyValue>> setupListValues() {
		log.info("getting ModelAttribute for listValues...");
		return listValueService.getListValues();
	}
	
	
	/**
	 * Returns initial command object for search criteria
	 * @return <code>SearchCriteria</code>
	 */
	@ModelAttribute(value="searchCriteria")
	public SearchCriteria setupSearchCriteria() {
		return new SearchCriteria();
	}

	/**
	 * Returns initial command object for search results
	 * @return
	 */
	@ModelAttribute(value="searchResults")
	public List<Form> setupSearchResults() {
		log.info("getting ModelAttribute for searchResults...");
		return new ArrayList<Form>();
	}
	
	@ModelAttribute(value="theform")
	public Form setupFormDetail() {
		log.info("getting ModelAttribute for the form...");
		return new Form();
	}
	
	@RequestMapping(value = "/internal/search", method=RequestMethod.POST)
	public String processSearchForInternal(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria,
			Model model) {
		log.info("@RequestMapping...search for forms with critiria: " + searchCriteria);
		
		List<Form> forms = null;
		try {
			
			forms = formsLibraryService.search(searchCriteria);
		} catch (FormsLibraryServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("searchResults", forms);
		return VIEW_SEARCH;

	}
	
}
