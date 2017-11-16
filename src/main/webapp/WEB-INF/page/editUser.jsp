<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="images/title.ico" rel="shortcut icon">
<link rel="stylesheet" href="css/style.css">
<script src="plugins/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.left{
		margin-left:0px;
	}
</style>
</head>
<body>
    <div class="panel">
        <header class="header_change">
            <div id="div-logo-img">
                <img src="images/logo.png">
            </div>
            <h2>用户管理系统</h2>
            <div id="div-help-quit">
                <a class="btn-help" href="#">帮助</a>
                <a class="btn-quit" href="#">退出</a>
            </div>
        </header>
        <content class="content_change">
            <div class="left">
                <div class="selection"><a class="btn-query" href="getUserList">用户查询</a></div>
                <div class="selection"><a class="btn-add" href="page_page_addUser">用户新增</a></div>
                <div class="selection">
				<a class="btn-add" href="page_page_analyseUser">用户分析</a>
			</div>
                <div class="img-button"><img src="images/monkey.png"></div>
            </div>
            
            <div class="right">
                <div class="form-title">新增&编辑用户信息</div>
                <form class="myForm" action="editUser" method="post">
                    <div class="myForm-msg">
                        <label>用户名称：</label>
                        <input type="text" id="tough" name="user.username" value="${user.username }" required="true">
                        <strong id="usernameMsg"></strong>
                    </div>
                    <div class="myForm-msg">
                        <label>用户密码：</label>
                        <input type="password" name="user.password" value="${user.password }" required="true">
                        <strong id="passwordeMsg"></strong>
                    </div>
                    <div class="myForm-msg">
                        <label>确认密码：</label>
                        <input type="password" name="passwordConfirm" value="${user.password }" required="true">
                        <strong id="passwordConfirmMsg"></strong>
                    </div>
                    <div class="myForm-msg">
                        <label>电子邮箱：</label>
                        <input type="email" name="user.email" value="${user.email }" required="true">
                        <strong id="emailMsg"></strong>
                    </div>
                    <div>
                        <label>性&emsp;&emsp;别：</label>
					<s:if test="user.gender">
						<label> <input type="radio" name="user.gender" value="true"
							checked="checked">男
						</label>
						<input type="radio" name="user.gender" value="false">女</label>
						<label>
					</s:if>
					<s:else>
						<label> <input type="radio" name="user.gender" value="true"
							>男
						</label>
						<input type="radio" name="user.gender" value="false" checked="checked">女</label>
						<label>
					</s:else>

				</div>
                    <hr>
                    <div class="myForm-btn">
                        <input type="submit" name="" id="myForm-submit" value="保存">
                        <input type="reset" name="" value="重置">
                        <input type="button" name="" value="返回" onclick="window.history.go(-1);">
                    </div>
                </form>
            </div>
        </content>
        <footer>
        </footer>
    </div>
</body>
</html>