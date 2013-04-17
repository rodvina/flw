package com.ksg.formslibrary.util;

import java.util.Date;

import com.ksg.formslibrary.domain.Form;

public class FormBuilder {
	
	private Form form;
	
	public FormBuilder() {
		form = new Form();
	}
	
	public FormBuilder formNumber(String formNumber) {
		form.setFormNumber(formNumber);
		return this;
	}
	
	public FormBuilder formEdition(String formEdition) {
		form.setFormEdition(formEdition);
		return this;
	}
	
	public FormBuilder formName(String formName) {
		form.setFormName(formName);
		return this;
	}
	
	public FormBuilder formType(String formType) {
		form.setFormType(formType);
		return this;
	}
	
	public FormBuilder sequence(int sequence) {
		form.setSequence(sequence);
		return this;
	}
	
	public Form build() {
		return form;
	}

}
