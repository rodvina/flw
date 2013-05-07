<!DOCTYPE html>
<%@page language="java"	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/themes/base/jquery-ui.css"/> -->
<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/theme/jquery-ui-1.9.1.custom.css" /> 
<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/css/normalize.min.css"/>
<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/css/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/theme/formStyle.css" />
<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/theme/tile.css" />
<link rel="stylesheet" type="text/css" media="all" href="<%= request.getContextPath() %>/resources/theme/jquery.dataTables.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />
</body>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js"></script>
<script async="async" type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery/jquery.dataTables.min.js"></script>
<script async="async" type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery/jquery.dataTables.columnFilter.js"></script>
<script async="async" type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery/ZeroClipboard.js"></script>
<script async="async" type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery/TableTools.min.js"></script>
<script async="async" type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery/jquery.blockUI.js"></script>
<script async="async" type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery/jquery-validate.min.js"></script>

</html>