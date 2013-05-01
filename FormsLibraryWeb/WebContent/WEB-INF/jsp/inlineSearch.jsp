<script type="text/javascript" charset="utf-8">
var resultsTable;
$(document).ready(function() {
	$('#advancedLink').click(function() {
		$('#advancedFields').toggle();
	});
	
	$("input[type='date']").datepicker();
	
	resultsTable = $('#resultsTable').dataTable( {
		"sDom": '<"top"fi>t<"bottom"><"clear">',
		"bFilter": true,
		"bStateSave": true,
		"bJQueryUI": false,
		"bSort" : true,
		"bPaginate": false,
		//"sScrollY": "200px",
		"bScrollCollapse": true,
		"oLanguage": {
		      "sSearch": "Filter:",
			  "sInfo": "Found _TOTAL_ forms",
			  "sInfoFiltered":"_TOTAL_ filtered from _MAX_ total records",
			  "sZeroRecords":"Your filter did not match any rows. ",
			  "sEmptyTable":"Your search did not match any forms. "
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