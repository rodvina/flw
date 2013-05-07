<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="formSearch" class="row">
<fieldset id="search">
<legend><span>Search Criteria</span></legend>
<form:form id="searchForm" name="searchForm" method="post" action="search" modelAttribute="searchCriteria">
<div id="basicSearch" class="row">
<!-- <ol id="searchList"> -->
	<div id="input" class="col">
		<p>
		<label for="formNumber"><fmt:message key='label.formnumber'/></label>
   	    <form:input type="text" name="formNumber" path="formNumber"/>
		</p>
		<p><label for="formName"><fmt:message key='label.formname'/></label>
		<form:input type="text" name="formName" path="formName"/>
		</p>
	</div>
	<div class="col">
		<label for="state"><fmt:message key='label.state'/></label>
		<!-- form:options does not work when evaluating hashmap expression
		-->
		<form:select size="5" name="state" path="states">
	 		<c:forEach items="${listValues['states']}" var="state">
		       <form:option value="${state.code}" label="${state.value}"/>
		   </c:forEach>
		</form:select>
	</div>
	<div class="col">
		<label for="lob"><fmt:message key='label.lob'/></label>
		  <form:select size="5" name="lob" path="lobs">
			<c:forEach items="${listValues['lobs']}" var="lob">
		       <form:option value="${lob.code}" label="${lob.value}" />
		   </c:forEach>
		</form:select>
	</div>
	<div class="col">
		<label for="contractType"><fmt:message key='label.contracttype'/></label>
		<form:select size="5" name="contractType" path="contractTypes">
			<c:forEach items="${listValues['contractTypes']}" var="contractType" >
				<form:option value="${contractType.code }" label="${contractType.value }" />
			</c:forEach>
		</form:select>
	</div>
	<div class="col">
		<label for="company"><fmt:message key='label.company'/></label>
		<form:select size="5" name="company" path="companies">
			<c:forEach items="${listValues['companies']}" var="company" >
				<form:option value="${company.code }" label="${company.value }" />
			</c:forEach>
		</form:select>
	</div>

</div>
<div id="advanceSearch" class="row">
<c:if test="${showAdvance == true}" >	
<a href="#" id="advancedLink">Advanced Search</a>
<div id="advancedFields" class="hideme">
	<div class="row">
	  	<div class="col">
		  	<label><fmt:message key='label.formtype'/></label>
			<form:select size="4" name="formType" path="formTypes">
				<c:forEach items="${listValues['formTypes']}" var="formType" >
				<form:option value="${formType.code }" label="${formType.value }" />
				</c:forEach>
			</form:select>
		</div>
	   	<div class="col">
		   	<label><fmt:message key='label.printcat'/></label>
		 	<form:select size="4" name="printCategory" path="printCategories">
				<c:forEach items="${listValues['printCategories']}" var="printCategory" >
					<form:option value="${printCategory.code }" label="${printCategory.value }" />
				</c:forEach>
			</form:select>
		 </div>
		 <div class="col">
		 	<label><fmt:message key='label.coverage'/></label>
		    <form:select size="4" name="coverage" path="coverages">
				<c:forEach items="${listValues['coverageCodes']}" var="coverage" >
					<form:option value="${coverage.code }" label="${coverage.value }" />
				</c:forEach>
			</form:select>
		</div>
		<div class="col">
			<label><fmt:message key='label.event'/></label>
		     <form:select size="4" name="event" path="events">
				<c:forEach items="${listValues['events']}" var="event" >
					<form:option value="${event.code }" label="${event.value }" />
				</c:forEach>
			</form:select>
		</div>
	</div>
	<div class="row">		
		<div class="col">
		    <label><fmt:message key='label.bulkrenewal'/></label>
		    <form:select size="4" name="event" path="events">
				<c:forEach items="${listValues['bulkRenewals']}" var="bulkRenewal" >
					<form:option value="${bulkRenewal.code }" label="${bulkRenewal.value }" />
				</c:forEach>
			</form:select>
		</div>
		<div class="col">
			<label><fmt:message key='label.ruleid'/></label>
	         <form:select size="4" name="ruleid" path="ruleIds">
				<c:forEach items="${listValues['ruleIds']}" var="ruleId" >
					<form:option value="${ruleId.code }" label="${ruleId.value }" />
				</c:forEach>
			</form:select>
		</div>
		<div class="col"><label><fmt:message key='label.levelind'/></label>
			<form:select size="3" name="levelind" path="levelIndicators">
				<c:forEach items="${listValues['levelIndicators']}" var="levelIndicator" >
					<form:option value="${levelIndicator.code }" label="${levelIndicator.value }" />
				</c:forEach>
			</form:select>
		</div>
		<div class="col">
			<label><fmt:message key='label.premind'/></label>
		    <form:select size="3" name="premind" path="premIndicators">
				<c:forEach items="${listValues['premIndicators']}" var="premIndicator" >
					<form:option value="${premIndicator.code }" label="${premIndicator.value }" />
				</c:forEach>
			</form:select>
   		</div>				
	</div>
	<div class="row">
		<div class="col"><label for="nbEffDate"><fmt:message key='label.nbeffdate'/></label>
			<form:input path="nbEffDate" type="date" id="nbEffDate"/>
			<form:errors path="nbEffDate" cssClass="error"/>
		</div>
		<div class="col"><label for="nbExpDate"><fmt:message key='label.nbexpdate'/></label>
		   	<form:input path="nbExpDate" name="nbExpDate" type="date" id="nbExpDate"/>
		</div>
		<div class="col"><label for="renEffDate"><fmt:message key='label.reneffdate'/></label>
		   	<form:input path="renEffDate" name="renEffDate" type="date" id="renEffDate"/>
		</div>
		<div class="col"><label for="renExpDate"><fmt:message key='label.renexpdate'/></label>
		   	<form:input path="renExpDate" name="renExpDate" type="date" id="renExpDate"/>
		</div>
	</div>
	<div class="row">
		<div class="col"><label for="procDate"><fmt:message key='label.procdate'/></label>
			<form:input path="procDate" name="procDate" type="date" id="procDate"/>
		</div>
		<div class="col"><label for="modDate"><fmt:message key='label.moddate'/></label>
		<form:input path="modDate" name="modDate" type="date" id="modDate"/>
		</div>
		<div class="col"><label><fmt:message key='label.formId'/></label>
		<form:input path="formId" name="formId" type="text" id="formId"/>
		</div>
		<div class="col">
	 		<label><fmt:message key='label.status'/></label>
	       	<form:select size="3" name="status" path="statuses" multiple="true">
				<c:forEach items="${listValues['statuses']}" var="status" >
				<form:option value="${status.code }" label="${status.value }" />
				</c:forEach>
			</form:select>
		</div>
	</div>
</div>
</c:if>
</div>
<div id="buttons" class="row">
	<div class="col">	
	<input id="submit" class="submit" type="submit" value="Search"/>
	</div>
	<div class="col">
	<input id="clear" type="submit" value="Clear"/>
	</div>
</div>
</form:form>
</fieldset>

<c:if test="${showResults == true}" >
<fieldset id="results">
<legend><span>Search Results</span></legend>
	<table id="resultsTable" class="pretty">
	<thead>
	<tr>
		<th>Form Number</th>
		<th>Form Title</th>
		<th>Form Type</th>
		<th>PDF</th>			
	</tr>
	</thead>
	<tbody>
	<c:forEach var="formrow" items="${searchResults}" varStatus="row">
	
	<tr>
		<td>
			<a id="formname_${row.count }" href="detail?url=${formrow.urlDetail }" >
				<c:out value="${formrow.formNumber}" />
			</a>
		</td>
		<td>
			<a href="#">Click me</a>
			<c:out value="${formrow.formName}" />
		</td>
		<td>
			<c:out value="${formrow.formType}" />
		</td>		
		<td>
			<a href="view?url=${formrow.docDetail }" target="_blank"><img class="icon" src="<%= request.getContextPath() %>/resources/images/icon_pdf.png"></img></a>
		</td>									
	</tr>
	
	</c:forEach>
	</tbody>
	</table>
</fieldset>
</c:if>
</div>
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
//	$('#resultsJSON').html('<table id="resultsTable1" class="datatable">');
	
	//if form field values exist, populate from local storage
	if (localStorage) {
		$("input[type='text']").each(function() {
			var fieldid = $(this).attr("id");
			if (localStorage[fieldid]) {
				$(this).val(localStorage[fieldid]);
			} 
		});
	}
	
	//dom setup
	$("input[type='date']").datepicker();
	
	//add defaults to multiselects
	$("<option value='none' selected='true'>Select...</option><option value='00'>-- Any --</option>").prependTo("select");
	
	//datatable initialization
	$('#resultsTable').dataTable( {
		"sDom": '<"top"fi>t<"bottom"><"clear">',
		"bFilter": true,
		"bStateSave": true,
		"bJQueryUI": true,
		"bSort" : true,
		"bPaginate": false,
		"bProcessing":false,
		//"sScrollY": "200px",
		"bScrollCollapse": true,
		"bServerSide":false,
		"oLanguage": {
		      "sSearch": "Filter:",
			  "sInfo": "Found _TOTAL_ forms",
			  "sInfoFiltered":"_TOTAL_ filtered from _MAX_ total records",
			  "sZeroRecords":"Your filter did not match any rows. ",
			  "sEmptyTable":"Your search did not match any forms. "
		    }
	} );
	
	//click events
	$("#advancedLink").click(function() {
		$("#advancedFields").toggle();
	});
	
	//clear session variables via post
	$("#clear").click(function() {
//		$("input[type='text']").val("");
//		$("input[type='date']").val("");
//		$("option").removeAttr("selected");
//		$("option[value='none']").attr("selected", "true");
		$("#searchForm").attr("action", "clear");
		$("#results").hide();
		if (localStorage) {
			localStorage.clear();
		}
		
	});
	
	$("#submit").click(function() {
		//$("#searchForm").validate();
		$.blockUI({ message: '<h2>Searching...<h2>'});

		//store in local storage
		if (localStorage) {
			$("input[type='text'").each(function() {
				localStorage[$(this).attr("id")] = $(this).attr("value");
			});
			
		}
		//$.unblockUI();
	//	$("#results").show();
	});
	
	$("#resultsTable a").click(function() {
		$.blockUI({ message: '<h2>Searching...<h2>'});
		//$.unblockUI();
	});
	
	// unblock when ajax activity stops 
    $(document).ajaxStop($.unblockUI);
	

} );
</script>