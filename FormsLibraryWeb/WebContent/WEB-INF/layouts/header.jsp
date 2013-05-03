<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="headerRow">
	<span id="kemperCorpLogo">
		<img
			src="<c:url value="/resources/theme/custom/Kemper_c2.jpg" />" 
			alt = "Kemper Corporation Logo"
			height="54"
			width = "203"/>
	</span>
	<span id="uiTitle">
	Forms Library
	</span>
	<form>
		<span id="signOut">
			<button id="signOutBtn" onClick="window.location.href='<c:url value="/j_spring_security_logout" />';return false">Sign Out</button>
		</span>		
	</form>
</div>