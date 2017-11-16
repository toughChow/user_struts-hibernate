<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="plugins/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="plugins/js/jquery.min.js"></script>
<script type="text/javascript"
	src="plugins/js/jquery.twbsPagination.min.js"></script>
</head>
<body>
	<ul id="pagination-demo" class="pagination-sm"></ul>
	<s:debug></s:debug>
	<table id="myTable">
		<tr>
			<th>id</th>
			<th>name</th>
		</tr>
		<s:iterator value="list" var="stu">
			<tr>
				<td><s:property value="#stu.id" /></td>
				<td><s:property value="#stu.name" /></td>
			</tr>
		</s:iterator>
	</table>
</body>
<script type="text/javascript">
	
</script>
</html>