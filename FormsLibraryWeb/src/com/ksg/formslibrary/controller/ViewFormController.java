package com.ksg.formslibrary.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ksg.formslibrary.service.FormsLibraryService;

/**
 * Controller class for viewing a form
 *
 */
@Controller
public class ViewFormController {
	private static final Logger log = Logger.getLogger(ViewFormController.class);

	@Autowired
	private FormsLibraryService formsLibraryService;
	
	@RequestMapping(value="{afl}/internal/view", method=RequestMethod.GET)
	public @ResponseBody byte[] processGetDocument(@RequestParam String url) {
		
		
		return null;
	}
			
}
