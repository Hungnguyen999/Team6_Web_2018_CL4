<%@page import="model.Role"%>
<%@page import="dao.RoleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/style_OT.css" rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified CSS -->
<!-- Optional theme -->
<link href="assets/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified JavaScript -->


<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="assets/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="assets/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var form = $("#login-form");
		var username = $("#user");
		var pass = $("#pass");
		form.submit(function() {
			if (username.val().length === 0) {
				alert('Tên tài khoản không được để trống');
				return false;
			} else if (pass.val().length === 0) {
				alert('Mật khẩu không được để trống');
				return false;
			} else
				return true;
		});
	});
</script>
</head>
<body>

	<%
		RoleDAO roleDAO = new RoleDAO();
	%>
	<div class="wapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<div class="main-menu">
			<nav class="navbar navbar-inverse" data-spy="affix" role="navigation"
				data-offset-top="67">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-main"
							aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.jsp" data-toggle="tooltip"
							data-placement="top" title="Trang chủ"> <span
							class="glyphicon glyphicon-home" aria-hidden="true"></span>
						</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="navbar-main">
						<ul class="nav navbar-nav">
							<li data-toggle="tooltip" data-placement="top" title="Liên hệ"><a
								href="Contact.jsp">Liên hệ <span class="sr-only">(current)</span></a></li>
							<li data-toggle="tooltip" data-placement="top" title="Hướng dẫn"><a
								href="#">Hướng dẫn</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li data-toggle="tooltip" data-placement="top" title="Đăng nhập"><a
								href="Login.jsp">Đăng nhập</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
		<div class="main">
			<div class="container">
				<div class="row">
					<ol class="breadcrumb">
						<li><span id="btn-home" class="glyphicon glyphicon-home"
							aria-hidden="true"></span> <a href="index.jsp">Trang chủ</a></li>
						<li class="active">Đăng nhập</li>
					</ol>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4 style="margin-bottom: 15px !important">Đăng nhập hệ thống</h4>
					</div>
					<div class="col-md-6">

						<form id="login-form" method="post" action="UserServlet"
							class="form-horizontal" name="form">

							<div class="form-group">
								<label for="username" class="col-xs-4 control-label required">*
									Tài khoản</label>

								<div class="col-xs-8">
									<input name="username" type="text" class="form-control"
										id="user" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-xs-4 control-label required">*
									Mật khẩu </label>
								<div class="col-xs-8">
									<input name="password" type="password" id="pass"
										class="form-control" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label required">* Vai trò</label>
								<div class="col-xs-8">
									<select class="form-control input-sm" name="Role" id="roleid">
										<%
											for (Role c : roleDAO.getListRole()) {
										%>
										<option value="<%=c.getRoleID()%>">
											<%=c.getRoleName()%>
										</option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="forget-pass">
								<span><a href="Forget-Pass.jsp">Quên
										mật khẩu</a></span>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-xs-8 col-xs-offset-4">
									<input type="hidden" value="login" name="command">
									<button type="submit" class="btn btn-primary" id="btn-login">
										Đăng nhập</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<jsp:include page="Footer.jsp"></jsp:include>

		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/JS/angular.min.js" type="text/javascript"></script>
	</div>


</body>

</html>