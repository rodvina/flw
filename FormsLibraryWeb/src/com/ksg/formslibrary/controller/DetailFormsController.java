package com.ksg.formslibrary.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.SearchCriteria;
import com.ksg.formslibrary.service.FormsLibraryService;

/**
 * Controller class for rendering form details.
 *
 */
@Controller("formDetailController")
//@SessionAttributes(value = {"searchCriteria", "searchResults"})
public class DetailFormsController {
	private static final Logger log = Logger.getLogger(DetailFormsController.class);

	@Autowired
	private FormsLibraryService formsLibraryService;

	
	/**
	 * Returns initial command object for form
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
	
	@ModelAttribute(value="form")
	public Form getTheForm() {
		log.info("getting ModelAttribute for the form...");
		return new Form();
	}
	
//	@RequestMapping(value="{afl}/internal/detail", method=RequestMethod.GET)
//	public String showFormDetails(Model model) {
//		log.info("@RequestMapping...show detailsView");
//		log.info("model contains searchResults?: " + model.containsAttribute("searchResults"));
//		log.info("model contains searchCriteria?: " + model.containsAttribute("searchCriteria"));
//		log.info("model contains theForm?: " + model.containsAttribute("theform"));
//
//
//		return "details";
//	}
	
	@RequestMapping(value="{afl}/internal/detail", method=RequestMethod.GET)
	public String processGetFormLink(@RequestParam String url, 
			@RequestParam String formNumber, @RequestParam String formType,
			@RequestParam String formEdition,
			@RequestParam String sequence, @RequestParam String status,
			@RequestParam String formId, @RequestParam String formName,
			Model model) {
//		Form formdetail = formsLibraryService.searchDetail(url);
		Form formdetail = new Form();
		formdetail.setFormNumber(formNumber);
		formdetail.setFormType(formType);
		formdetail.setFormName(formName);
		formdetail.setFormId(formId);
		formdetail.setStatus(status);
		formdetail.setSequence(Integer.parseInt(sequence));
		formdetail.setFormEdition(formEdition);
		model.addAttribute("form", formdetail);
		model.addAttribute("url", url);
		
		return "detailsAjax";
	}
	
	@RequestMapping(value = "{afl}/internal/detail", method=RequestMethod.POST)
	public String processGetForm(@ModelAttribute Form form, RedirectAttributes redirectAttr) {
		
		Form formdetail = formsLibraryService.searchDetail(form.getUrlDetail());
		redirectAttr.addFlashAttribute("form", formdetail);
		
		return "redirect:/{afl}/internal/detail";

	}
	
}
