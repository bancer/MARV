<%@page import="com.marv.business.entities.User"%>
<script type="text/javascript">
	/* Start OpenId authentication script */
	(function() {
		if (typeof window.janrain !== 'object')
			window.janrain = {};
		if (typeof window.janrain.settings !== 'object')
			window.janrain.settings = {};

		janrain.settings.tokenUrl = '<%= getServletContext().getInitParameter("auth-url") %>';

		function isReady() {
			janrain.ready = true;
		}
		;
		if (document.addEventListener) {
			document.addEventListener("DOMContentLoaded", isReady, false);
		} else {
			window.attachEvent('onload', isReady);
		}

		var e = document.createElement('script');
		e.type = 'text/javascript';
		e.id = 'janrainAuthWidget';

		if (document.location.protocol === 'https:') {
			e.src = 'https://rpxnow.com/js/lib/marv/engage.js';
		} else {
			e.src = 'http://widget-cdn.rpxnow.com/js/lib/marv/engage.js';
		}

		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(e, s);
	})();
	/* End OpenId authentication script */
</script>
<header>
	<div class="top-bar">
		<div class="logo"></div>
		<% if(session.getAttribute("authenticated.user") != null) { %>
			<% User user = (User) session.getAttribute("authenticated.user"); %>
			<div class="logged-in-actions">
				<div class="btn user">
					<h5><%= user.getUsername() %></h5>
				</div>
				<div class="btn user-messages">
					<h5>Inbox</h5>
				</div>
				<div class="btn user-settings">
					<h5>Settings</h5>
				</div>
				<a href="?command=SignOut" class="btn sign-out">
					<h5>Sign Out</h5>
				</a>
			</div>
		<% } else { %>
			<div class="logged-out-actions">
				<a class="janrainEngage btn sign-in" href="#"><h5>Sign-In</h5></a>
			</div>
		<% } %>
	</div>
</header>