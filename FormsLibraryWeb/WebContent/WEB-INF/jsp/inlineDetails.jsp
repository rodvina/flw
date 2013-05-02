<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" charset="utf-8">
var form = ${form}
$(document).ready(function() {
	$('#primaryData').html('<ol><li><label>Form Title:</label>'+form.formName+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Status:</label>'+form.status+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Sequence:</label>'+form.sequence+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Form ID:</label>'+form.formId+'</li></ol>');
	$('#detailTitle').html(form.formNumber+form.formEdition);
	$('#detailsData').html('<table id="detailsTable" class="pretty">');
	$('#detailsTable').dataTable({
		//"sDom": '<"H"Tfr>t<"F"ip>',
//		"sDom": 'Ti<"clear">lfrtp',
		"sDom": '<"top"fi>t<"bottom"><"clear">',
		"bJQueryUI": true,
		"bPaginate": false,
		"bFilter": true, 
		"oLanguage": {
	      "sSearch": "Filter data:",
		  "sInfo": "Found _TOTAL_ forms",
		  "sInfoFiltered":"_TOTAL_ filtered from _MAX_ total records"
	    },
		"oTableTools": {
			"aButtons": [
				"copy", "xls"
				],
			"sSwfPath": "../../resources/media/copy_csv_xls_pdf.swf"
		},
		"bProcessing": false,
		"aaData": form.formDetails,
		//"aoColumns": [
		//               {"sTitle":"LOB", "mData":"lob"},
		//               {"sTitle":"State", "mData":"state"},
		//               {"sTitle":"Company", "mData":"company"}		               
		//               ] 
//		"sAjaxSource": "${ajaxUrl}",
//		"sAjaxDataProp": "formDetails",
//		"aoColumnDefs":[
//			{"sTitle":"<fmt:message key='header.0'/>", "mData":"<fmt:message key='data.0'/>", "aTargets":[0] },
//			{"sTitle":"<fmt:message key='header.1'/>", "mData":"<fmt:message key='data.1'/>", "aTargets":[1] },
//			{"sTitle":"<fmt:message key='header.2'/>", "mData":"<fmt:message key='data.2'/>", "aTargets":[2] },
//			{"sTitle":"<fmt:message key='header.3'/>", "mData":"<fmt:message key='data.3'/>", "aTargets":[3] },
//			{"sTitle":"<fmt:message key='header.4'/>", "mData":"<fmt:message key='data.4'/>", "sType":"date", "aTargets":[4] },
//			{"sTitle":"<fmt:message key='header.5'/>", "mData":"<fmt:message key='data.5'/>", "aTargets":[5] },
//			{"sTitle":"<fmt:message key='header.6'/>", "mData":"<fmt:message key='data.6'/>", "aTargets":[6] },
//			{"sTitle":"<fmt:message key='header.7'/>", "mData":"<fmt:message key='data.7'/>", "aTargets":[7], "bVisible": false }
//		]

		"aoColumnDefs":[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6] },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true }
		]
		
		//"sScrollY": "300px",
		//"bScrollCollapse": true
	});
	
//				$('#detailsTable').dataTable().columnFilter();
	
//	$('#formTable').dataTable( {
//		"bStateSave": true,
//		"bSort" : true,
//		"bPaginate": false,
//		"bFilter": false, 					
//		"iDisplayLength": 1,
//		"bLengthChange": false,
//		"oLanguage": {
//			"sInfo": ""
//		}
		
//	} );


} );
</script>