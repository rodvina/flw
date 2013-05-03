package com.ksg.formslibrary.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.datetime.DateFormatter;

import com.ksg.formslibrary.domain.Form;
import com.ksg.formslibrary.domain.FormDetail;
import com.ksg.formslibrary.domain.SearchCriteria;
import com.ksg.formslibrary.util.FormBuilder;

//@Service
@Qualifier("mock")
public class MockFormsLibraryServiceImpl implements FormsLibraryService {
	private static final Logger log = Logger.getLogger(MockFormsLibraryServiceImpl.class);

	private List<Form> forms = new ArrayList<Form>();
	
	@Override
	public List<Form> getForms() {
		return forms;
	}

	@Override
	public List<Form> search(String affiliate, SearchCriteria searchCriteria) {
		log.info("searching for forms based on the following criteria: " + searchCriteria);
		
		List<Form> results = new ArrayList<Form>();
		String[] formtypes = new String[]{"Endorsement", "Amendatory", "Insert", "SpecialInsert", "Contract", "All", "Jacket"};
		int ft = 0;
		for (int i=0; i<20; i++) {
			Form form1 = new Form();
			form1.setFormNumber("AK2348"+i);
			form1.setFormEdition("0199");
			form1.setFormName("FAIR CREDIT "+i);
			form1.setStatus("Active");
			form1.setFormType(formtypes[ft++]);
			form1.setFormId(""+100+i);
			form1.setUrlDetail("http://localhost:9080/fls/affiliate/kp/form/"+form1.getFormNumber());
			results.add(form1);
			if (ft >= formtypes.length) ft = 0;
		}
		Form form2 = new Form();
		form2.setFormNumber("BC34387");
		form2.setFormEdition("0112");
		form2.setFormName("FAIR CREDIT 2");
		form2.setFormId("100");
		form2.setUrlDetail("http://localhost:9080/fls/affiliate/kp/form/"+form2.getFormNumber());
		results.add(form2);
		return results;
	}

	@Override
	public Form searchDetail(String formname) {
		log.info("searching form details for form: " + formname);
		String[] formtypes = new String[]{"Endorsement", "Amendatory", "Insert", "SpecialInsert", "Contract", "All", "Jacket"};
		int ft = 0;
		Form form = new Form();
		form.setFormNumber(formname);
		form.setFormEdition("0199");
		form.setFormName("Fair Credit ");
		form.setFormType(formtypes[ft++]);
		if (ft >= formtypes.length) ft = 0;
		form.setFormId("AD1234");
		form.setStatus("Active");
		Calendar from = Calendar.getInstance();
		Calendar to = Calendar.getInstance();
		for (int x=1; x < 200; x++) {
			FormDetail formdetail = new FormDetail();
			formdetail.setCompany("Company " + x);
			formdetail.setLob("Auto");
			formdetail.setContractType(x+"Monoline");
			formdetail.setState("AL"+x);
			formdetail.setCoverage("ADDRES"+x+x);
			if (x < 100) {formdetail.setEvent("ADD");}else{formdetail.setEvent("CANCEL");};
			formdetail.setRuleId("RULE-"+x*x+x);
			to.add(Calendar.MONTH, x);
			formdetail.setNbEffDate(new DateFormatter("MM/dd/yyyy").print(from.getTime(), Locale.ENGLISH));
			formdetail.setNbExpDate(new DateFormatter("MM/dd/yyyy").print(to.getTime(), Locale.ENGLISH));
			formdetail.setRenEffDate(new DateFormatter("MM/dd/yyyy").print(from.getTime(), Locale.ENGLISH));
			formdetail.setRenExpDate(new DateFormatter("MM/dd/yyyy").print(to.getTime(), Locale.ENGLISH));
			formdetail.setProcEffDate(new DateFormatter("MM/dd/yyyy").print(from.getTime(), Locale.ENGLISH));
			formdetail.setProcExpDate(new DateFormatter("MM/dd/yyyy").print(to.getTime(), Locale.ENGLISH));
			formdetail.setModDate(new DateFormatter("MM/dd/yyyy").print(to.getTime(), Locale.ENGLISH));
			formdetail.setPremiumInd(x < 50 ? "Y" : "N");
			formdetail.setBulkRenewal(x > 50 ? "Yes" : "No");
			formdetail.setPrevForm("AK389" + x);
			form.addFormDetail(formdetail);
		}
		return form;
	}



}
