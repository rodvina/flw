<!DOCTYPE html>
<%@page session="false" contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head> 

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
     
	<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/css/normalize.min.css"/>
	<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/css/demo_page.css" />
	<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/css/jquery.dataTables.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js"></script>
		<script type="text/javascript" charset="utf-8">
			var resultsTable;
			var resultsData = [["AK1111", "FAIR Credit", "link", "button"]];
			
			$(document).ready(function() {
				$('#advancedLink').click(function() {
					$('#advancedFields').toggle();
				});
				
				$("input[type='date']").datepicker();
				
				resultsTable = $('#resultsTable').dataTable( {
					"bFilter": true,
					"bStateSave": true,
					"bJQueryUI": true,
					"bSort" : true,
					"bPaginate": false,
					//"sScrollY": "200px",
					"bScrollCollapse": true,
					"oLanguage": {
					      "sSearch": "Filter data:",
						  "sInfo": "Found _TOTAL_ forms"
					    }
				} );
				
				$('#clearBtn').click(function() {
					resultsTable.fnClearTable();
				});
				
				//$('#submitBtn').click(function() {
					//ajax call
				//	resultsTable.fnDraw();
				//});

			} );
		</script>
</head>
<body>
<%@include file="header.jsp" %>

<DIV>

<H3>Search Criteria</H3>
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

<form:form name="resultsForm" method="post" action="detail" modelAttribute="theform">	
	<DIV style="margin: 12px; margin-bottom: 36px">
	
		<table id="resultsTable" class="datatable">
		<thead>
		<tr>
			<th>Form Number</th>
			<th>Form Title</th>
			<th>Form Type</th>			
			<th>Options</th>			
		</tr>
		</thead>
		<tbody>
		<c:forEach var="form" items="${searchResults}">
			<tr>
				<td>
					<c:out value="${form.formNumber}" />
				</td>
				<td>
					<c:out value="${form.formName}" />
				</td>
				<td>
					<c:out value="${form.formType}" />
				</td>
				<td>
					<form:button value="View Details"/>
					<input type="hidden" value="${form.urlDetail }" name="urlDetail"/>
				</td>									
			</tr>
		</c:forEach>
		</tbody>
		</table>
	
	
<% /******** End of sample code *********/ %>
</DIV>
</form:form>

</DIV>
</body>
</html>