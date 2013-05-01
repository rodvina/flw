package com.ksg.formslibrary.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.SearchCriteria;
import com.ksg.formslibrary.service.FormsLibraryService;
import com.ksg.formslibrary.service.FormsLibraryServiceException;



/**
 * Controller class responsible for processing requests
 * for the search functionality.  Renders search page, processes search
 * requests, renders search and results
 *
 */
@Controller("searchFormController")
@RequestMapping(method=RequestMethod.POST)
public class SearchFormsController {
	private static final Logger log = Logger.getLogger(SearchFormsController.class);

	@Autowired
	private FormsLibraryService formsLibraryService;
	
	@RequestMapping(value = {"{afl}/internal/search", "{afl}/internal"})
	public String processSearchInternal(@PathVariable String afl, @ModelAttribute SearchCriteria searchCriteria,
			BindingResult result, RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			log.error("Errors on search form");
			return "redirect:/{afl}/internal/search";
		}
		// set to false so dupes will be returned, if any
		searchCriteria.setSuppressDuplicates(false);
		List<Form> searchResults = formsLibraryService.search(afl, searchCriteria);
		
		redirectAttrs.addFlashAttribute("searchResults", searchResults);
		return "redirect:/{afl}/internal/search";

	}
	
}
