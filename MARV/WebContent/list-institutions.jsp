<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="helper"
	type="com.marv.ui.process.components.helpers.ListInstitutionsHelper"
	scope="request" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<%@ include file="inc/meta.jsp" %>
	<title>List Institutions</title>
</head>
<body>
	<%@ include file="inc/header.jsp"%>
	<div class="bellow-header">
		<%@ include file="inc/west-panel.jsp"%>
		<table class="table table-striped table-hover">
			<caption>Institutions</caption>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Actions</th>
			</tr>
			<%
				for (int i = 0; i < helper.getInstitutions().size(); i++) {
			%>
			<tr>
				<td><%=helper.getInstitutions().get(i).getId()%></td>
				<td><%=helper.getInstitutions().get(i).getName()%></td>
				<td><a class="btn btn-primary btn-small"
					href="?command=Institution&id=<%=helper.getInstitutions().get(i).getId()%>">Edit</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<a class="btn btn-primary" href="?command=Institution">New
			Institution</a>
	</div>
	<%@ include file="inc/footer.jsp"%>
</body>
</html>