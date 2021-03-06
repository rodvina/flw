<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" charset="utf-8">
var jsonForm = ${form}

$(document).ready(function() {
	$('#primaryData').html('<ol><li><label>Form Title:</label>'+jsonForm.formName+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Status:</label>'+jsonForm.status+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Sequence:</label>'+jsonForm.sequence+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Form ID:</label>'+jsonForm.formId+'</li></ol>');
	$('#primaryData').append('<ol><li><label>Form Type:</label>'+jsonForm.formType+'</li></ol>');
	$('#detailTitle').html(jsonForm.formNumber+jsonForm.formEdition);
	$('#detailsData').html('<table id="detailsTable" class="pretty">');
	$('#detailsTable').dataTable({
		//"sDom": '<"H"Tfr>t<"F"ip>',
//		"sDom": 'Ti<"clear">lfrtp',
//		"sDom": '<"top"fi>t<"bottom"><"clear">',
		//"sDom": '<"top"fi>t<"bottom"><"clear">',
		"sDom": '<"top"iT>lfrtp',
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
				"xls", 
				{"sExtends": "print",
				 "sButtonText":" Print It! "
				}
				
				],
			"sSwfPath": "<%=request.getContextPath()%>/resources/media/copy_csv_xls_pdf.swf"
		},
		"bProcessing": false,
		"aaData": jsonForm.formDetails,
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

		"aoColumnDefs":getColumnDefs(jsonForm.formType)
			

	});
	
//				$('#detailsTable').dataTable().columnFilter();
	
} );

function getColumnDefs(formtype) {

	var coldef = {
		"all":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": true },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": true },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": true },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": true },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": true },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": true },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": true }
		],
		"endorsement":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": false },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": true },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": true },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": false },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": false },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": false },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": false },
			{"sTitle":"Premium Indicator", "mData":"premiumInd", "aTargets":[15], "bVisible": true }
		],
		"amendatory":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": false },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": true },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": true },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": false },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": false },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": false },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": false }
		],		
		"insert":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": true },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": true },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": true },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": false },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": false },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": false },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": true },
			{"sTitle":"Bulk Renewal", "mData":"bulkRenewal", "aTargets":[15], "bVisible": true }
		],
		"specialinsert":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3],  "bVisible": false },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "aTargets":[4],  "bVisible": false },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": true },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": false },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": false },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": true },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": true },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": true },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": false },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": true },
			{"sTitle":"Bulk Renewal", "mData":"bulkRenewal", "aTargets":[15], "bVisible": true }
		],			
		"jacket":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": false },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": true },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": false },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": false },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": false },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": true },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": false }
		],
		"contract":
		[
			{"sTitle":"State", "mData":"state", "aTargets":[0] },
			{"sTitle":"LOB", "mData":"lob", "aTargets":[1] },
			{"sTitle":"Company", "mData":"company", "aTargets":[2] },
			{"sTitle":"NB Eff Date", "mData":"nbEffDate", "aTargets":[3] },
			{"sTitle":"NB Exp Date", "mData":"nbExpDate", "sType":"date", "aTargets":[4] },
			{"sTitle":"Contract Type", "mData":"contractType", "aTargets":[5] },
			{"sTitle":"Rule Id", "mData":"ruleId", "aTargets":[6], "bVisible": true },
			{"sTitle":"Ren Eff Date", "mData":"renEffDate", "aTargets":[7], "bVisible": true },
			{"sTitle":"Ren Exp Date", "mData":"renExpDate", "aTargets":[8], "bVisible": true },
			{"sTitle":"Coverage Code", "mData":"coverage", "aTargets":[9], "bVisible": false },
			{"sTitle":"Proc Eff Date", "mData":"procEffDate", "aTargets":[10], "bVisible": false },
			{"sTitle":"Proc Exp Date", "mData":"procExpDate", "aTargets":[11], "bVisible": false },
			{"sTitle":"Modified Date", "mData":"modDate", "aTargets":[12], "bVisible": false },
			{"sTitle":"Previous Form", "mData":"prevForm", "aTargets":[13], "bVisible": true },
			{"sTitle":"Event", "mData":"event", "aTargets":[14], "bVisible": false }
		]		
	};
	
	return coldef[ formtype.toLowerCase() ];
}

</script>