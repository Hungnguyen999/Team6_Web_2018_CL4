<%@page import="connect.DBconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.jws.soap.SOAPBinding.Use"%>
<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.Role"%>
<%@page import="dao.RoleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>

<!-- Mirrored from coderthemes.com/uplon_1.4/light/tables-datatable.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Oct 2016 16:07:41 GMT -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- App title -->
<title>Admin - Danh sách tài khoản</title>

<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

<script src="assets/JS/jquery.min.js"></script>
<script src="assets/JS/angular.min.js" type="text/javascript"></script>

<link
	href="assets/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" type="text/css" />

</head>

<body class="fixed-left">
	<%
		UsersDAO usersDAO = new UsersDAO();
		RoleDAO roleDAO = new RoleDAO();
		Users users = null;
		Role role = null;
		if (session.getAttribute("userAdmin") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");
			
		}
		else{
			users = (Users) session.getAttribute("userAdmin");
	%>
	<!-- Begin page -->
	<div id="wrapper">
		<!-- Top Bar Start -->
		<div class="topbar">
			<!-- LOGO -->
			<div class="topbar-left">
				<a href="Admin.jsp" class="logo"> <i
					class="zmdi zmdi-group-work icon-c-logo"></i> <span>ADMIN</span>
				</a>
			</div>
			<div class="navbar navbar-custom">
				<ul class="nav navbar-nav">
					<li class="nav-item">
						<button
							class="button-menu-mobile open-left waves-light waves-effect">
							<i class="zmdi zmdi-menu"></i>
						</button>
					</li>
				
				</ul>
				<ul class="nav navbar-nav pull-right">

					<li class="nav-item dropdown notification-list"><a
						class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user"
						data-toggle="dropdown" href="#" role="button"
						aria-haspopup="false" aria-expanded="false"> <img src=""
							alt="user" class="img-circle">
					</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown "
							aria-labelledby="Preview">
							<!-- item-->
							<div class="dropdown-item noti-title">
								<%
									if (users != null) {
								%>
								<h5 class="text-overflow">
									<small>Xin chào <%=users.getUserName()%></small>
								</h5>
								<%
									}
								%>
							</div>

							<!-- item-->
							<%
								if (users != null) {
							%>
							<a href="Profile.jsp?UserName=<%=users.getUserName()%>"
								class="dropdown-item notify-item"> <i
								class="zmdi zmdi-account-circle"></i> <span>Profile</span>
							</a>
							<%
								}
							%>
							<!-- item-->
							<a href="Doimatkhau.jsp" class="dropdown-item notify-item"> <i
								class="zmdi zmdi-lock-open"></i> <span>Đổi mật khẩu</span>

							</a>

							<!-- item-->
							<a href="LogOut" class="dropdown-item notify-item"> <i
								class="zmdi zmdi-power"></i> <span>Logout</span>
							</a>

						</div></li>

				</ul>
			</div>
		</div>
		<div class="left side-menu">
			<div class="sidebar-inner slimscrollleft">
				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<ul>
						<li class="text-muted menu-title"><i class="fa fa-users"
							aria-hidden="true"></i> Quản lý tài khoản</li>
						<li class="has_sub"><a href="DSTaiKhoan.jsp"
							class="waves-effect" id="DSTK"><i class="fa fa-user" aria-hidden="true"></i><span
								style="margin-left: 20px"> Danh sách tài khoản</span> </a></li>
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect"><i class="fa fa-info" aria-hidden="true"></i> <span style="margin-left: 20px">Chi
									tiết </span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li><a href="DSTK-NQTNHCauHoi.jsp" id="DSTK-QTNHCH">Người
										quản trị ngân hàng câu hỏi</a></li>
								<li><a href="DSTK-NguoiRaDe.jsp" id="DSTK-NRD">Người ra
										đề</a></li>
								<li><a href="DSTKNQTKyThi.jsp" id="DSTK-NQTKT">Người
										quản trị kỳ thi</a></li>
								<li><a href="DSTKSinhVien.jsp" id="DSTK-SV">Sinh viên</a></li>
							</ul></li>
						<li class="has_sub"><a href="DSRole.jsp" class="waves-effect"><i class="fa fa-tachometer" aria-hidden="true"></i><span
								style="margin-left: 20px"> Vai trò </span></a></li>
<li class="text-muted menu-title"><i class="fa fa-adn" aria-hidden="true"></i> Quản lý điểm</li>
								<li class="has_sub"><a href="DSDiem.jsp" class="waves-effect"><i class="fa fa-tachometer" aria-hidden="true"></i><span
								style="margin-left: 20px"> Điểm </span></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- Sidebar -->
				<div class="clearfix"></div>

			</div>
		</div>
		<!-- Left Sidebar-->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="page-title-box">
								<h4 class="page-title">
									Thi trắc nghiệm <small>Online</small>
								</h4>
								<ol class="breadcrumb ">
									<li><a href="index.jsp">Trang chủ</a></li>
									<li><a href="Admin.jsp">Admin</a></li>
									<li class="active">Danh sách tài khoản</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<a data-toggle="modal" href='#form-insert-account'
							data-target="#form-insert-account">Thêm tài khoản</a>
					</div>
					<div class="row">
						<h2 style="text-align: center">DANH SÁCH TÀI KHOẢN</h2>
					</div>
					<div class="row">
						<%
							Connection connect = null;
							PreparedStatement ps = null;
							try {
								connect=DBconnect.getConnecttion();
								String sql = "select * from users";
								ps = connect.prepareCall(sql);
								ResultSet rs = ps.executeQuery(sql);
						%>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Username</th>
										<th>Password</th>
										<th>Họ và tên</th>
										<th>Số điện thoại</th>
										<th>Email</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
										while (rs != null && rs.next()) {
									%>
									<tr>

										<td><%=rs.getString("UserName")%></td>
										<td><%=rs.getString("PASSWORD")%></td>
										<td><%=rs.getString("FullName")%></td>
										<td><%=rs.getString("NumberPhone")%></td>
										<td><%=rs.getString("Email")%></td>
										<td><a data-toggle="modal" href='#form-update-account'
											data-target="#form-update-account"
											data-username='<%=rs.getString("UserName")%>'
											data-password='<%=rs.getString("PASSWORD")%>'
											data-fullname='<%=rs.getString("FullName")%>'
											data-numberphone='<%=rs.getString("NumberPhone")%>'
											data-email='<%=rs.getString("Email")%>'>Edit</a> | <a
											onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
											href="DeleteUser?command=deleteUser&UserName=<%=rs.getString("UserName")%>">Delete</a>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<%
							} catch (Exception e) {
								out.println(e.getMessage());
							}
						%>
					</div>
					<div class="modal fade" id="form-update-account">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">Chỉnh sửa tài khoản</h4>
								</div>
								<div class="modal-body">
									<form action="Update" method="POST" class="form-horizontal"
										role="form">
										<fieldset class="form-group">
											<label for="input-username" class="col-sm-3">Username</label>
											<div class="col-sm-9">
												<input readonly type="text" name="username"
													id="input-username" class="form-control input-sm" value=""
													required>
											</div>
										</fieldset>

										<fieldset class=form-group>
											<label for="input-username" class="col-sm-3">Password</label>
											<div class="col-sm-9">
												<input type="password" name="password" id="input-password"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>

										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Fullname</label>
											<div class="col-sm-9">
												<input type="text" name="fullname" id="input-fullname"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Số điện
												thoại</label>
											<div class="col-sm-9">
												<input type="text" name="numberphone" id="input-number"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Email</label>
											<div class="col-sm-9">
												<input type="text" name="email" id="input-email"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<hr>
											<div class="pull-right">
												<input type="hidden" value="updateTK" name="command">
												<button type="submit" class="btn btn-primary btn-sm">Save
													changes</button>
												<button type="button" class="btn btn-default btn-sm"
													data-dismiss="modal">Close</button>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="form-insert-account">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">Thêm tài khoản</h4>
								</div>
								<div class="modal-body">
									<form action="UserServlet" method="POST" class="form-horizontal"
										role="form">
										<fieldset class="form-group">
											<label for="input-username" class="col-sm-3">Username</label>
											<div class="col-sm-9">
												<input type="text" name="username" id="input-username"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>

										<fieldset class=form-group>
											<label for="input-username" class="col-sm-3">Password</label>
											<div class="col-sm-9">
												<input type="password" name="password" id="input-password"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>

										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Fullname</label>
											<div class="col-sm-9">
												<input type="text" name="fullname" id="input-fullname"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Số điện
												thoại</label>
											<div class="col-sm-9">
												<input type="text" name="numberphone" id="input-number"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Email</label>
											<div class="col-sm-9">
												<input type="text" name="email" id="input-email"
													class="form-control input-sm" value="" required>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<label for="input-fullname" class="col-sm-3">Lớp</label>
											<div class="col-sm-9">
												<input type="text" name="lop" id="input-lop"
													class="input-lg" value=""
													placeholder="Nếu là sinh viên thì điền lớp vào đây" style="width: 100%;border-radius: 4px;">
											</div>
										</fieldset>
										<fieldset class="form-group">
											<label for="inputRole" class="col-sm-3">Vai trò</label>
											<div class="col-sm-9">
											 <select
												class="form-control" name="Role" id="form-input" required>
												<%
													for (Role c : roleDAO.getListRole()) {
												%>
												<option value=<%=c.getRoleID()%>>
													<%=c.getRoleID()%>
												</option>
												<%
													}
												%>
											</select>
										</div>
										</fieldset>
										<fieldset class="form-group">
											<hr>
											<div class="pull-right">
												<input type="hidden" value="insert" name="command">
												<button type="submit" class="btn btn-primary btn-sm">Save
													changes</button>
												<button type="button" class="btn btn-default btn-sm"
													data-dismiss="modal">Close</button>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer text-right"> ©Nhóm 6 - Sáng thứ 4 </footer>
	</div>
	<!-- content -->
	<script>
		var resizefunc = [];
	</script>

	<!-- jQuery  -->

	
	<script src="assets/JS/bootstrap.min.js"></script>

	<script src="assets/JS/jquery.core.js"></script>
	<script src="assets/JS/jquery.app.js"></script>
	<script>
		$('#form-update-account').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var Username = a.data('username') // Extract info from data-* attributes
			var Password = a.data('password') // Extract info from data-* attributes
			var Fullname = a.data('fullname')
			var Numberphone = a.data('numberphone') // Extract info from data-* attributes
			var Email = a.data('email')

			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			$('#input-username').val(Username)
			$('#input-password').val(Password)
			$('#input-fullname').val(Fullname)
			$('#input-number').val(Numberphone)
			$('#input-email').val(Email)
		})
	</script>
	<%} %>
</body>

<!-- Mirrored from coderthemes.com/uplon_1.4/light/tables-datatable.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Oct 2016 16:07:55 GMT -->

</html>