package com.ksg.formslibrary.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ksg.formslibrary.domain.CodeValue;
import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.SearchCriteria;
import com.ksg.formslibrary.service.ListValueService;



/**
 * Controller class responsible for processing requests
 * for the search functionality.  Renders search page, processes search
 * requests, renders search and results
 *
 */
@Controller("listValController")
@RequestMapping(method=RequestMethod.GET)
@SessionAttributes(value="searchResults")
public class ListValController {
	private static final String VIEW_SEARCH = "search";

	private static final Logger log = Logger.getLogger(ListValController.class);

	@Autowired
	private ListValueService listValueService;
	
	/**
	 * Returns reference data for list values
	 */
	@ModelAttribute(value="listValues")
	public Map<String, List<CodeValue>> setupListValues(@PathVariable String afl) {
		log.info("getting ModelAttribute for listValues...");
		return listValueService.getListValues(afl);
	}
	
	/**
	 * Selects the search view to render by returning its name
	 * @param afl - affiliate abbreviation
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{afl}/internal/search")
	public String showSearchInternal(@PathVariable String afl, @RequestParam(required=false) String action, Model model, 
			@ModelAttribute("searchResults") final List<Form> searchResults) {
		log.info("returning view for internal GET...");
		model.addAttribute("showAdvance", true);
		if (StringUtils.equals(action, "return")) {
			model.addAttribute("showResults", true);
		}
		return VIEW_SEARCH;
	}
	
	@RequestMapping(value = "{afl}/external/search")
	public String showSearchExternal(@PathVariable String afl, @RequestParam(required=false) String action, Model model) {
		log.info("returning view for external GET...");
		model.addAttribute("showAdvance", false);
		if (StringUtils.equals(action, "return")) {
			model.addAttribute("showResults", true);
		}
		return VIEW_SEARCH;
	}
	
	@RequestMapping(value = "{afl}/listvals/reset")
	public @ResponseBody String resetCache(@PathVariable String afl) {
		listValueService.resetCache(afl);
		return "Success";
	}


//	@ModelAttribute(value="listValues")
//	public ListValues setupListValues() {
//		log.info("getting ModelAttribute for listValues...");
//		return listValueService.getListValues();
//	}
		
	
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
	 */
	@ModelAttribute(value="searchResults")
	public List<Form> setupSearchResults() {
		log.info("getting ModelAttribute for searchResults...");
		return new ArrayList<Form>();
	}
	
	/**
	 * Returns initial command object for the form
	 */
	@ModelAttribute(value="form")
	public Form setupFormDetail() {
		log.info("getting ModelAttribute for the form...");
		return new Form();
	}
	
}
