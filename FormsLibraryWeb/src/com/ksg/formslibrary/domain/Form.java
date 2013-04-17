package com.ksg.formslibrary.domain;

import java.util.ArrayList;
import java.util.List;


public class Form extends AbstractDomain {

	private String formType;
	private String formNumber;
	private String formEdition;
	private String formName;
	private String status;
	private int sequence;
	private String urlDetail;
	private String urlDocument;
	
	
	private List<FormDetail> formDetails;
	
	public Form() {
		super();
	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public String getFormNumber() {
		return formNumber;
	}

	public void setFormNumber(String formNumber) {
		this.formNumber = formNumber;
	}

	public String getFormEdition() {
		return formEdition;
	}

	public void setFormEdition(String formEdition) {
		this.formEdition = formEdition;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public List<FormDetail> getFormDetails() {
		if (formDetails ==  null) {
			formDetails = new ArrayList<FormDetail>();
		}
		return formDetails;
	}
	
	public void addFormDetail(FormDetail formDetail) {
		this.getFormDetails().add(formDetail);
	}
	
	public void addAllFormDetail(List<FormDetail> list) {
		this.getFormDetails().addAll(list);
	}

	public void setFormDetails(List<FormDetail> formDetails) {
		this.formDetails = formDetails;
	}

	public String getUrlDocument() {
		return urlDocument;
	}

	public void setUrlDocument(String urlDocument) {
		this.urlDocument = urlDocument;
	}

	public String getUrlDetail() {
		return urlDetail;
	}

	public void setUrlDetail(String urlDetail) {
		this.urlDetail = urlDetail;
	}

	
}
