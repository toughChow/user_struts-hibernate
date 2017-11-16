<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="images/title.ico" rel="shortcut icon">
<link rel="stylesheet" href="css/style.css">
<link href="plugins/bootstrap.min.css" rel="stylesheet">
<script src="plugins/jquery-3.2.1.min.js"></script>
<script src="js/common.js"></script>
<script type="text/javascript"
	src="plugins/jquery.twbsPagination.min.js"></script>
</head>
<body>
	<div class="panel">
		<header class="header_change">
			<div id="div-logo-img">
				<img src="images/logo.png">
			</div>
			<h2>用户管理系统</h2>
			<div id="div-help-quit">
				<a class="btn-help" href="#">帮助</a> <a class="btn-quit" href="#">退出</a>
			</div>
		</header>
		<content class="content_change">
		<div class="left">
			<div class="selection">
				<a class="btn-query" href="getUserList">用户查询</a>
			</div>
			<div class="selection">
				<a class="btn-add" href="page_page_addUser">用户新增</a>
			</div>
			<div class="selection">
				<a class="btn-add" href="page_page_analyseUser">用户分析</a>
			</div>
			<div class="img-button">
				<img src="images/monkey.png">
			</div>
		</div>
		<div class="right">
			<div class="myList-query">
				<form action="queryFromUser" method="post">
					<label>用户名称：</label> <input type="text" name="condition" required="true">
					<button type="submit" name="" id="myList-query">查询</button>
				</form>
			</div>
			<table class="myList-table" cellspacing="0">
				<thead>
					<tr>
						<th>编号</th>
						<th>用户名称</th>
						<th>邮箱</th>
						<th>性别</th>
						<th>创建时间</th>
						<th>更改时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" var="user" status="status">
						<tr>
							<td><s:property value="#status.index+1" /></td>
							<td><s:property value="#user.username" /></td>
							<td><s:property value="#user.email" /></td>
							<td><s:if test="#user.gender">男</s:if> <s:else>女</s:else></td>
							<td><s:property value="#user.createTime" /></td>
							<td><s:property value="#user.updateTime" /></td>
							<td><a
								href="toEditUser?user.id=<s:property value='#user.id'/>">编辑</a>
								&emsp; <a class="deleteUser"
								href="deleteUser?user.id=<s:property value='#user.id'/>">删除</a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<ul id="pagination-demo" class="pagination-sm"></ul>
		</div>
		</content>
		<footer> </footer>
	</div>

</body>
<script type="text/javascript">
$(function(){
	paginator = $('#pagination-demo').twbsPagination({
		totalPages : ${totalPages},
		visiblePages : 5,
		startPage:${pageNo},
		initiateStartPageClick:false,
		onPageClick : function(event, page) {
			$('#page-content').text('Page ' + ${pageNo});
			window.location.href="getUserList?pageNo="+page; 
		}
	});
	
	// 刪除
	$('.deleteUser').click(function(){
		var flag = confirm('是否刪除該用戶?');
		
		if(flag){
			return true;
		}else{
			return false;
		}
	});
});
</script>
</html>