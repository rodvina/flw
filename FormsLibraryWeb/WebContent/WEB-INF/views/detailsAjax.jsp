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
		
<script type="text/javascript" src="<%= request.getContextPath() %>/resources//js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" charset="utf-8"  src="<%= request.getContextPath() %>/resources//js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8"  src="<%= request.getContextPath() %>/resources//js/TableTools.min.js"></script> 

<script>
	
			$(document).ready(function() {

				$('#detailsData').html('<table border="0" cellspacing="5" id="detailsTable">')
				$('#detailsTable').dataTable({
					//"sDom": '<"H"Tfr>t<"F"ip>',
					"sDom": 'T<"clear">lfrtip',
					"bJQueryUI": true,
					"bPaginate": true,
					"bFilter": true, 
					"oLanguage": {
				      "sSearch": "Filter data:",
					  "sInfo": ""
				    },
					"oTableTools": {
						"aButtons": [
							"copy", "xls"
							],
						"sSwfPath": "../../resources/media/copy_csv_xls_pdf.swf"
					},
					"bProcessing": false,
					"sAjaxSource": '${url}',
					"sAjaxDataProp": "formDetails",
					"aoColumnDefs":[
						{"sTitle":"State", "mData":"state", "aTargets":[0] },
						{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
						{"sTitle":"Company", "mData":"company", "aTargets":[2] },
						{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
						{"sTitle":"NB Exp Date", "mData":"nbExpDate", "aTargets":[4] },
						{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[5] },
						{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[6] },
						{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[7] }
					]
					
					//"sScrollY": "300px",
					//"bScrollCollapse": true
				});
				
//				$('#detailsTable').dataTable().columnFilter();
				
				$('#formTable').dataTable( {
					"bStateSave": true,
					"bSort" : true,
					"bPaginate": false,
					"bFilter": false, 					
					"iDisplayLength": 1,
					"bLengthChange": false,
					"oLanguage": {
						"sInfo": ""
					}
					
				} );
				
				$("input[name='submit']").click(function(){
					    $('#results').toggle();
				});
				
				$('#advancedLink').click(function() {
					$('#advancedFields').toggle();
				});

		        $("input[type='date']").datepicker();

			
			} );
		</script>

</head>
<body class="theBody">
<%@include file="header.jsp" %>
<div id="results" >
  <H3 align="center"><a href="search">Return to Search</a> -> Form Details</H3>

<table id="formTable">
	<thead>
    	<tr>
	    	<th>Form Primary Data</th>
        </tr>
    </thead>
    <tbody>
    	<!-- repeat rows for each form results -->
    	<tr>
        	<td>
            	<!-- data in inner table -->
                <table>
                	<tr>
                    	<td style="font-weight:bold">Form Type</td>
                        <td>${form.formType }</td>
                        <td><a href="../../../testResources/mooreform.pdf"><img src="../../resources/images/icon_pdf.png" width="44" height="41"/></a></td>
                    </tr>
                	<tr>
                    	<td style="font-weight:bold">Form Number</td>
                        <td>${form.formNumber }</td>
                    </tr>
                	<tr>
                    	<td style="font-weight:bold">Form Edition</td>
                        <td>${form.formEdition }</td>
                    </tr>
                	<tr>
                    	<td style="font-weight:bold">Form Title</td>
                        <td>${form.formName }</td>
                    </tr>                                        
                	<tr>
                    	<td style="font-weight:bold">Status</td>
                        <td>${form.status }</td>
                    </tr>
                	<tr>
                    	<td style="font-weight:bold">Sequence</td>
                        <td>${form.sequence }</td>
                    </tr>                                        
                	<tr>
                    	<td style="font-weight:bold">Form ID</td>
                        <td>${form.formId }</td>
                    </tr>                    
                </table>
            </td>
        </tr>
    </tbody>
</table>

	<h4 align="center">Form Secondary Data</h4>
	<div id="detailsData"></div>  
</div>
</body>		
</html>