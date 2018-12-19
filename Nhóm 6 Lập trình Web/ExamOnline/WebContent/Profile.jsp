<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thông tin cá nhân</title>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/style_OT.css" rel="stylesheet" type="text/css" />
<!-- Latest compiled and minified CSS -->
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="assets/material-design-iconic-font/css/material-design-iconic-font.css"
	rel="stylesheet" type="text/css" />
<link href="assets/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<%
		UsersDAO usersDAO = new UsersDAO();
		Users users = new Users();
		if (session.getAttribute("updateProfile") != null) {
			users = (Users) session.getAttribute("updateProfile");
		}
		if (request.getParameter("UserName") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");
			
		}else{
			String userName = request.getParameter("UserName");
			users = usersDAO.getUsers(userName);
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
							<li data-toggle="tooltip" data-placement="top" title="Đăng xuất"><a
								href="Login.jsp"><i class="fa fa-sign-out"
									aria-hidden="true"></i></a></li>

						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
		<div class="main">
			<div class="container" id="Update-CSCH">
				<div class="row">
					<div class="col-md-9 col-sm-8 col-xs-0">
						<div class="row">
							<div class="col-sm-6"></div>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-9">
						<div class="block-user-info block-user-info-responsive logged">
							<ul class="clearfix">
								<div class="dropdown dropdown-vta">

									<img alt="" /> <a class="dropdown-toggle dropdown-vta-login"
										role="button" id="dropdownMenu1" data-toggle="dropdown"> <%
 	if (users != null) {
 %> <span class="hello">Xin chào <span
											style="color: #EDB637; font-weight: bold"><%=users.getFullname()%></span></span>
										<%
											}
										%> <span class="caret"></span>
									</a>
									<ul class="dropdown-menu dropdown-vta-sub-menu"
										aria-labelledby="dropdownMenu1">
										<li><a
											href="Profile.jsp?UserName=<%=users.getUserName()%>">Thông
												tin cá nhân</a></li>

										<li><a
											href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>">Đổi
												mật khẩu</a></li>
										<li><a href="Login.jsp">Thoát</a></li>
									</ul>
								</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<ol class="breadcrumb">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<li><a href="index.jsp" title="">Trang chủ</a></li>
						<li class="active">Trang cá nhân</li>
					</ol>
				</div>

				<div class="row">
					<div class="customDiv-2">
						<div class="col-md-6"></div>
						<div class="col-md-6">

							<form class="form-horizontal" method="post" action="UserServlet">
								<div class="form-group">

									<div class="col-sm-10">
										<input name="UserName" type="hidden" class="form-control"
											id="inputUsername" placeholder=""
											value="<%=users.getUserName()%>" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputFullname" class="col-sm-2 control-label">Họ
										và tên</label>
									<div class="col-sm-10">
										<input name="fullname" type="text" class="form-control"
											id="inputFullname" placeholder=""
											value="<%=users.getFullname()%>" />

									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Giới tính</label>

									<div class="col-sm-10">

										<%
											if (users.getGender() == null) {
										%>
										<label class="radio-inline"><input type="radio"
											name="sex" value="male">Nam</label> <label
											class="radio-inline"><input type="radio" name="sex"
											value="female">Nữ</label>
										<%
											} else {
												String gender = users.getGender();
												if (gender.equals("male")) {
										%>

										<label class="radio-inline"><input checked
											type="radio" name="sex" value="male">Nam</label> <label
											class="radio-inline"><input type="radio" name="sex"
											value="female">Nữ</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											name="sex" value="male">Nam</label> <label
											class="radio-inline"><input checked type="radio"
											name="sex" value="female">Nữ</label>
										<%
											}
											}
										%>
									</div>

								</div>
								<div class="form-group">
									<label for="inputBirthday" class="col-sm-2 control-label">Ngày
										sinh</label>
									<div class="col-sm-10">
										<%
											if (users.getBirthday() != null) {
										%>
										<input name="birthday" type="date" class="form-control"
											id="inputBirthday" placeholder=""
											value=<%=users.getBirthday()%>>
										<%
											} else {
										%>
										<input name="birthday" type="date" class="form-control"
											id="inputBirthday" placeholder="" value="">
										<%
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<label for="inputNumberphone" class="col-sm-2 control-label">Số
										điện thoại</label>
									<div class="col-sm-10">
										<%
											if (users.getNumberPhone() != null) {
										%>
										<input name="numberphone" type="text" class="form-control"
											id="inputNumberphone" placeholder=""
											value="<%=users.getNumberPhone()%>">
										<%
											} else {
										%>
										<input name="numberphone" type="text" class="form-control"
											id="inputNumberphone" placeholder="">
										<%
											}
										%>

									</div>
								</div>
								<div class="form-group">
									<label for="inputAddress" class="col-sm-2 control-label">Địa
										chỉ</label>
									<div class="col-sm-10">
										<input name="address" type="text" class="form-control"
											id="inputAddress" placeholder=""
											value="<%=users.getAddress()%>">

									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<input name="email" type="email" class="form-control"
											id="inputEmail" placeholder="" disabled
											value="<%=users.getEmail()%>">

									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="hidden" value="updateProfile" name="command">
										<button type="submit" class="btn btn-default"
											onClick="alert('Chỉnh sửa thông tin cá nhân thành công')">Lưu</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- end col -->
			</div>
		</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<script src="assets/JS/angular.min.js" type="text/javascript"></script>
	<script src="assets/JS/jquery.min.js" type="text/javascript"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script>
		var demoApp = angular.module('demoApp', []).controller(
				"InsertMHNDCtrl", [ '$scope', function($scope) {
					$scope.success = false;
					$scope.insert = function() {
						$scope.success = true;
					}
				} ]);
	</script>
	<%} %>
</body>

</html>