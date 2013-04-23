package com.ksg.formslibrary.util;

import org.apache.commons.lang.StringUtils;

import com.ksg.formslibrary.domain.SearchCriteria;

public class Util {

	public static String convertToString(SearchCriteria searchCriteria) {
		String value = null;
		StringBuffer sb = new StringBuffer();
		if (null != searchCriteria) {
			if (StringUtils.isNotEmpty(searchCriteria.getFormNumber())) {
				sb.append(SearchParam.formNumber.toString()).append("=").append(searchCriteria.getFormNumber());
			}
			
			
			
		}
		return value;
	}
}
