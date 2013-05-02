<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="formSearch">
<fieldset id="search">
<legend><span>Search Criteria</span></legend>
<form:form name="searchForm" method="post" action="search" modelAttribute="searchCriteria">
	<table width="757" border="0" id="searchTable">
	  <tr>
		<td width="244"><table width="100%" border="0" cellspacing="10">
		  <tr>
			<td width="193"><p><label for="formNumber"><fmt:message key='label.formnumber'/></label><span class="input">
			  <form:input type="text" name="formNumber" path="formNumber"/>
			  </span></p>
			  <p><label for="formName"><fmt:message key='label.formname'/></label><span class="input">
				<form:input type="text" name="formName" path="formName"/>
				</span></p>
			</td>

			<td width="94"><label for="state"><fmt:message key='label.state'/></label>
			<!-- form:options does not work when evaluating hashmap expression
			-->
	 		   <form:select size="5" name="state" path="states">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['states']}" var="state">
			       <form:option value="${state.code}" label="${state.value}"/>
			   </c:forEach>
			</form:select>

			</td>
			<td width="124"><label for="lob"><fmt:message key='label.lob'/></label>
			  <form:select size="5" name="lob" path="lobs">
	  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
				<c:forEach items="${listValues['lobs']}" var="lob">
			       <form:option value="${lob.code}" label="${lob.value}" />
			   </c:forEach>

			</form:select></td>
			<td width="108"><label for="contractType"><fmt:message key='label.contracttype'/></label>
			  <form:select size="5" name="contractType" path="contractTypes">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['contractTypes']}" var="contractType" >
	  				<form:option value="${contractType.code }" label="${contractType.value }" />
	  			</c:forEach>
			</form:select></td>
			<td width="192"><label for="company"><fmt:message key='label.company'/></label>
			  <form:select size="5" name="company" path="companies">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['companies']}" var="company" >
	  				<form:option value="${company.code }" label="${company.value }" />
	  			</c:forEach>
			</form:select></td>
			</tr>
		  </table></td>
	  </tr>
	</table>

<c:if test="${showAdvance == true}" >	
<table>
    <tr><td><a href="#" id="advancedLink">Advanced Search</a></td></tr>
		<tr>
		<td>
		<div id="advancedFields" class="hideme">
		  <table width="751" border="0" cellspacing="10">
		    <tr>
			    <td width="214"><label><fmt:message key='label.formtype'/></label>
			  <form:select size="3" name="formType" path="formTypes">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['formTypes']}" var="formType" >
	  				<form:option value="${formType.code }" label="${formType.value }" />
	  			</c:forEach>
			</form:select>
			    </td>
			    <td width="218"><label><fmt:message key='label.printcat'/></label>
			    <form:select size="3" name="printCategory" path="printCategories">
		  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
		  			<c:forEach items="${listValues['printCategories']}" var="printCategory" >
		  				<form:option value="${printCategory.code }" label="${printCategory.value }" />
		  			</c:forEach>
		  		</form:select>
			    </td>
			    <td width="283"><label><fmt:message key='label.coverage'/></label>
              	<form:select size="3" name="coverage" path="coverages">
		  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
		  			<c:forEach items="${listValues['coverageCodes']}" var="coverage" >
		  				<form:option value="${coverage.code }" label="${coverage.value }" />
		  			</c:forEach>
				</form:select>
              </td>
		    </tr>
			  <tr>
			    <td><label><fmt:message key='label.event'/></label>
              	<form:select size="3" name="event" path="events">
		  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
		  			<c:forEach items="${listValues['events']}" var="event" >
		  				<form:option value="${event.code }" label="${event.value }" />
		  			</c:forEach>
				</form:select>
				</td>
			    <td><label><fmt:message key='label.bulkrenewal'/></label>
              	<form:select size="3" name="event" path="events">
		  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
		  			<c:forEach items="${listValues['bulkRenewals']}" var="bulkRenewal" >
		  				<form:option value="${bulkRenewal.code }" label="${bulkRenewal.value }" />
		  			</c:forEach>
				</form:select>
				</td>
				<td><label><fmt:message key='label.ruleid'/></label>
              	<form:select size="3" name="ruleid" path="ruleIds">
		  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
		  			<c:forEach items="${listValues['ruleIds']}" var="ruleId" >
		  				<form:option value="${ruleId.code }" label="${ruleId.value }" />
		  			</c:forEach>
				</form:select>
				</td>
		      </tr>
			  <tr>
			    <td><label for="nbEffDate"><fmt:message key='label.nbeffdate'/></label>
		        	<form:input path="nbEffDate" type="date" id="nbEffDate"/>
		        	<form:errors path="nbEffDate" cssClass="error"/>
		        </td>
			    <td><label for="nbExpDate"><fmt:message key='label.nbexpdate'/></label>
		        	<input name="nbExpDate" type="date" id="nbExpDate">
		        </td>
			    <td><label><fmt:message key='label.premind'/></label>
	              	<form:select size="3" name="premind" path="premIndicators">
			  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
			  			<c:forEach items="${listValues['premIndicators']}" var="premIndicator" >
			  				<form:option value="${premIndicator.code }" label="${premIndicator.value }" />
			  			</c:forEach>
					</form:select>
			    </td>
		    	</tr>
			  <tr>
			    <td><label for="renEffDate"><fmt:message key='label.reneffdate'/></label>
		        	<input name="renEffDate" type="date" id="renEffDate">
		        </td>
			    <td><label for="renExpDate"><fmt:message key='label.renexpdate'/></label>
		        	<input name="renExpDate" type="date" id="renExpDate">
		        </td>
			    <td><label><fmt:message key='label.levelind'/></label>
	              	<form:select size="3" name="levelind" path="levelIndicators">
			  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
			  			<c:forEach items="${listValues['levelIndicators']}" var="levelIndicator" >
			  				<form:option value="${levelIndicator.code }" label="${levelIndicator.value }" />
			  			</c:forEach>
					</form:select>
			    </td>
		      </tr>
			  <tr>
			    <td><label for="procDate"><fmt:message key='label.procdate'/></label>
		        	<input name="procDate" type="date" id="procDate">
		        </td>
			    <td><label for="modDate"><fmt:message key='label.moddate'/></label>
		        	<input name="modDate" type="date" id="modDate">
		        </td>
			    <td><label><fmt:message key='label.formId'/></label>
					<input name="formId" type="text" id="formId">
			    </td>
		      </tr>
		      <tr>
			    <td><label><fmt:message key='label.status'/></label>
	              	<form:select size="3" name="status" path="statuses" multiple="false">
			  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
			  			<c:forEach items="${listValues['statuses']}" var="status" >
			  				<form:option value="${status.code }" label="${status.value }" />
			  			</c:forEach>
					</form:select>
			    </td>
		      </tr>
		  </table>
        </div>
		</td>
		</tr>
	</table>
</c:if>	
<table id="thetable1">
	<tr>
		<td colspan="2"></td>
		<td colspan="2"><input name="submit" type="submit" value="Search"/><input type="button" value="Clear"/></td>
	</tr>
</table>
</form:form>
</fieldset>
<fieldset id="results">
<legend><span>Search Results</span></legend>
	<table id="resultsTable" class="datatable">
	<thead>
	<tr>
		<th>Form Number</th>
		<th>Form Title</th>
		<th>PDF</th>			
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${searchResults}">
	
	<tr>
		<td>
			<a href="detail?&url=${row.urlDetail }" >
				<c:out value="${row.formNumber}" />
			</a>
		</td>
		<td>
			<c:out value="${row.formName}" />
		</td>
		<td>
			<a href="#"><img class="icon" src="<%= request.getContextPath() %>/resources/images/icon_pdf.png"></img></a>
		</td>									
	</tr>
	
	</c:forEach>
	</tbody>
	</table>
</fieldset>
</div>
