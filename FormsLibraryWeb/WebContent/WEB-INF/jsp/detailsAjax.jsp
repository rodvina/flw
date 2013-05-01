<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<H3 align="center"><a href="search">Return to Search</a> -> Form Details</H3>
<H4>Form Primary Data</H4>
<div id="primaryData" class="content-wrapper">
	<div class="content-row">
		<div class="content-label">Form Number</div>
		<div class="content-value">${form.formNumber }</div>
		<div><a href="../../../testResources/mooreform.pdf"><img src="../../resources/images/icon_pdf.png" width="44" height="41"/></a></div>
	</div>
	<div class="content-row">
		<div class="content-label">Form Edition</div>
		<div class="content-value">${form.formEdition }</div>
	</div>
	<div class="content-row">
		<div class="content-label">Form Title</div>
		<div class="content-value">${form.formName }</div>
	</div>
	<div class="content-row">
		<div class="content-label">Status</div>
		<div class="content-value">${form.status }</div>
	</div>
	<div class="content-row">
		<div class="content-label">Sequence</div>
		<div class="content-value">${form.sequence }</div>
	</div>
	<div class="content-row">
		<div class="content-label">Form ID</div>
		<div class="content-value">${form.formId }</div>
	</div>				
</div>


<h4 align="center">Form Secondary Data</h4>
<div id="detailsData"></div>  
