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
			<td width="193"><p><label for="formNumber">Form Number:</label><span class="input">
	
			  <form:input type="text" name="formNumber" path="formNumber"/>
			  </span></p>
			  <p><label for="formName">Form Name:</label><span class="input">
				<form:input type="text" name="formName" path="formName"/>
				</span></p>
			</td>

			<td width="94"><label for="state">State:</label>
			<!-- form:options does not work when evaluating hashmap expression
			-->
	 		   <form:select size="5" name="state" path="states">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['stateList']}" var="state">
			       <form:option value="${state.key}" label="${state.value}"/>
			   </c:forEach>
			</form:select>

			</td>
			<td width="124"><label for="lob">Line Of Business</label>
			  <form:select size="5" name="lob" path="lobs">
	  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
				<c:forEach items="${listValues['lobList']}" var="lob">
			       <form:option value="${lob.key}" label="${lob.value}" />
			   </c:forEach>

			</form:select></td>
			<td width="108"><label for="contractType">Contract Type</label>
			  <form:select size="5" name="contractType" path="policyTypes">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['policyTypeList']}" var="policyType" >
	  				<form:option value="${policyType.key }" label="${policyType.value }" />
	  			</c:forEach>
			</form:select></td>
			<td width="192"><label for="company">Company</label>
			  <form:select size="5" name="company" path="company">
	  			<option value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
	  			<c:forEach items="${listValues['companyList']}" var="company" >
	  				<form:option value="${company.key }" label="${company.value }" />
	  			</c:forEach>
			</form:select></td>
			</tr>
		  </table></td>
	  </tr>
	</table>

<c:if test="${showAdvance == true}" >	
<table width="985">
    <tr><td><a href="#" id="advancedLink">Advanced Search</a></td></tr>
		<tr>
		<td>
		<div id="advancedFields" class="hideme">
		  <table width="751" border="0" cellspacing="10">
		    <tr>
			    <td width="214"><label>Form Type:
			      <select name="formType2" size="3" multiple >
			        <option value="00">-- Any --
		            <option>Amendatory
		            <option>Endorsement
	                <option>Insert
	                <option>Contract
                    <option>Jacket
                    <option>Special Insert
                    <option>Customer Docs
                    <option>Billing
                    <option>U/W Correspondence
                    <option>Credit                  
                  </select>
			    </label></td>
			    <td width="218"><label>Print Category:</label>
			      <select name="printCat" size="3" multiple id="printCat" >
			        <option>Always First</option>
			        <option>Before Dec Insert</option>
			        <option>Special</option>
			        <option>Declarations</option>
			        <option>Schedules (SPP/EE)</option>
			        <option>After Dec Insert</option>
			        <option>Policy Jacket</option>
			        <option>Policy Contract</option>
			        <option>Amendatory</option>
			        <option>Priority Endorsement</option>
		          </select>
			    </td>
			    <td width="283"><label>Coverage Code:</label>
              	<form:select size="3" name="coverage" path="coverages">
		  			<option selected="selected" value="<fmt:message key='any.code'/>"><fmt:message key='any.value'/></option>
		  			<c:forEach items="${listValues['coverageList']}" var="coverage" >
		  				<form:option value="${coverage.key }" label="${coverage.value }" />
		  			</c:forEach>
				</form:select>
              </td>
		    </tr>
			  <tr>
			    <td>Event:<br>
<select name="formType" size="3" multiple >
		          <option value="00">-- Any --
		            <option>All
		            <option value="ADD">New Business
	                <option value="MOD">Amendment
	                <option>Renewal
                    <option>Cancellation
                    <option>NP Cancel
                    <option>Finalization
                    <option>Special Conversion
                    <option>Kemper Conversion
                    <option>Rewrite
                </select></td>
			    <td>Bulk Renewal:<br>
<select name="formType3" size="3" multiple >
		          <option value="00">-- Any --
		            <option>TBD
		            <option>TBD
		            <option>TBD
		            <option>TBD
                </select></td>
			    <td>Rule ID:
			      <select name="ruleId" size="3" multiple id="ruleId" >
			        <option value="00">-- Any --
		            <option>PCS - Consumer Report Disclosure
		            <option>Mueller - Consumer Report Disclosure
	                <option>LexisNexis - Consumer Report Disclosure 
	                <option>Owner Occupied 
                    <option>OWNER Occupied or no Coverage A 
                </select></td>
		      </tr>
			  <tr>
			    <td>NB Eff Date:
		        <input name="nbEffDate" type="date" id="nbEffDate"></td>
			    <td>NB Exp Date:
		        <input name="nbExpDate" type="date" id="nbExpDate"></td>
			    <td><p>Premium Indicator:<br>
<select name="contractType3" size="3" multiple id="contractType3" >
                    <option>-- Any --</option>
                      <option value="00">Y</option>
                      <option>N</option>
                    </select>
			    </p></td>
		    </tr>
			  <tr>
			    <td>REN Eff Date:<br>
                <input name="renEffDate" type="date" id="renEffDate"></td>
			    <td>REN Eff Date:<br>
                <input name="renExpDate" type="date" id="renExpDate"></td>
			    <td>Level Indicator:<br>
<select name="levelIndicator2" size="3" multiple id="levelIndicator2" >
                  <option></option>
                    <option>Policy</option>
                    <option value="00">Activity</option>
                </select></td>
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

<form:form name="resultsForm" method="post" action="${detailUrl}" modelAttribute="theform">	
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
		<!-- s
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
					<input type="hidden" value="${form.formNumber }" name="formname"/>
				</td>									
			</tr>
		</c:forEach>
		 -->
		</tbody>
		</table>
	
	
<% /******** End of sample code *********/ %>
</DIV>
</form:form>

</DIV>
</body>
</html>