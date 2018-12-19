<%@page import="java.text.SimpleDateFormat"%>
<%@page import="connect.DBconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.DeThi"%>
<%@page import="dao.DeThiDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý kỳ thi</title>
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
<script src="assets/JS/jquery.min.js"></script>
<script src="assets/JS/angular.min.js" type="text/javascript"></script>
</head>

<body>
	<%
		UsersDAO usersDAO = new UsersDAO();
		DeThiDAO deThiDAO = new DeThiDAO();
		Users users = null;
		if (session.getAttribute("userQLKT") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");

		} else {
			users = (Users) session.getAttribute("userQLKT");
	%>
	<div class="wapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<div class="main-menu">
			<nav class="navbar navbar-inverse" data-spy="affix" role="navigation"
				data-offset-top="55">
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
						<a class="navbar-brand" href="index.jsp"> <span
							class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="navbar-main">
						<ul class="nav navbar-nav">
							<li><a href="#">Liên hệ <span class="sr-only">(current)</span></a></li>
							<li><a href="#">Hướng dẫn</a></li>
							<li class="active"><a href="#">Quản lý kỳ thi</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="Login.jsp" class="glyphicon glyphicon-log-out"></a></li>

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
											style="color: #ED7642; font-weight: 600"><%=users.getFullname()%></span></span>
										<span class="caret"></span></a>
									<ul class="dropdown-menu dropdown-vta-sub-menu"
										aria-labelledby="dropdownMenu1">

										<li><a
											href="Profile.jsp?UserName=<%=users.getUserName()%>">Thông
												tin cá nhân</a></li>

										<li><a
											href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>">Đổi
												mật khẩu</a></li>
										<%
											}
										%>
										<li><a href="LogOut">Thoát</a></li>
									</ul>
								</div>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<ol class="breadcrumb">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<li class="active">Quản lý kỳ thi</li>
					</ol>
				</div>
				<div class="row">
					<p id="update-success"></p>
				</div>
				<div class="row">
					<div class="customDiv-2">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-primary">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">1. Tạo
											kỳ thi</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-6">
												<form class="form-horizontal" action="KyThiServlet"
													method="POST">
													<div class="form-group">
														<label for="selectMaDe"
															class="col-sm-5 control-label text-left">Đề thi</label>
														<div class="col-sm-7">
															<select class="form-control input-xs" name="made">
																<option value="">Chọn</option>
																<%
																	for (DeThi dt : deThiDAO.getDSDeThi()) {
																%>
																<option value="<%=dt.getMaDe()%>">
																	<%=dt.getMaDe()%>
																</option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="selectLopThi"
															class="col-sm-5 control-label text-left">Lớp thi</label>
														<div class="col-sm-7">
															<select class="form-control input-xs" name="lop">
																<option value="">Chọn</option>
																<%
																	for (Users u : usersDAO.getDSLop()) {
																%>
																<option value="<%=u.getMaLop()%>">
																	<%=u.getMaLop()%>
																</option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="inputDD"
															class="col-sm-5 control-label text-left">Phòng
															thi</label>
														<div class="col-sm-7">
															<input type="text" class="form-control" required
																id="inputDD" placeholder="" name="phongthi">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-5"></div>
														<div class="col-sm-7">
															<input type="hidden" value="insert" name="command">
															<button type="submit" class="btn btn-info" onclick="return alert('Tạo đề thi thành công')">Lưu</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-primary">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="true" aria-controls="collapseTwo"> 2. Danh
											sách kỳ thi</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<div class="row">
											<%
												Connection con = null;
													PreparedStatement ps = null;
													try {

														con = DBconnect.getConnecttion();
														String sql = "select dt.MaDe,dt.TenDe,kt.MaLop,kt.PhongThi "
																+ "from kythi kt INNER JOIN dethi dt on kt.MaDe=dt.MaDe";
														ps = con.prepareCall(sql);
														ResultSet rs = ps.executeQuery(sql);
											%>
											<div class="table-responsive">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>Mã đề</th>
															<th>Tên đề</th>
															<th>Lớp thi</th>
															<th>Phòng thi</th>
															<th>Hành động</th>
														</tr>
													</thead>
													<tbody>
														<%
															while (rs != null && rs.next()) {
														%>
														<tr>
															<td><%=rs.getString("MaDe")%></td>
															<td><%=rs.getString("TenDe")%></td>
															<td><%=rs.getString("MaLop")%></td>
															<td><%=rs.getString("PhongThi")%></td>
															<td><a data-toggle="modal" href='#form-update-kythi'
																data-target="#form-update-kythi"
																data-made='<%=rs.getString("MaDe")%>'
																data-malop='<%=rs.getString("MaLop")%>'
																data-phongthi='<%=rs.getString("PhongThi")%>'>Sửa</a>||
																<a href="KyThiServlet?made=<%=rs.getString("MaDe")%>"
																onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a></td>
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
										<div class="modal fade" id="form-update-kythi">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title">Chỉnh sửa kỳ thi</h4>
													</div>
													<div class="modal-body">
														<form action="KyThiServlet" method="POST"
															class="form-horizontal" role="form">
															<fieldset class="form-group">
																<label for="input-username" class="col-sm-2">Mã
																	đề</label>
																<div class="col-sm-10">
																	<input readonly type="text" name="made" id="input-made"
																		class="form-control input-sm" value="" required>
																</div>
															</fieldset>

															<fieldset class=form-group>
																<label for="input-username" class="col-sm-2">Lớp
																	thi</label>
																<div class="col-sm-10">
																	<input readonly type="text" name="lop"
																		id="input-lopthi" class="form-control input-sm"
																		value="" required>
																</div>
															</fieldset>
															<fieldset class="form-group">
																<label for="input-fullname" class="col-sm-2">Phòng
																	thi</label>
																<div class="col-sm-10">
																	<input type="text" name="phongthi" id="input-phongthi"
																		class="form-control input-sm" value="" required="">
																</div>
															</fieldset>
															<fieldset class="form-group">
																<hr>
																<div class="pull-right">
																	<input type="hidden" value="update" name="command">
																	<button type="submit" class="btn btn-primary btn-sm" onclick="return alert('Chỉnh sửa thành công đề thi')">Lưu</button>
																	<button type="button" class="btn btn-default btn-sm"
																		data-dismiss="modal" style="margin-right: 20px">Đóng</button>
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
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br>
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<script src="assets/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="assets/JS/QLKT.js" type="text/javascript"></script>
	<script>
		$('#form-update-kythi').on('show.bs.modal', function(event) {
			var a = $(event.relatedTarget) // Button that triggered the modal
			var made = a.data('made') // Extract info from data-* attributes
			var lop = a.data('malop') // Extract info from data-* attributes
			var phongthi = a.data('phongthi')

			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			$('#input-made').val(made)
			$('#input-lopthi').val(lop)
			$('#input-phongthi').val(phongthi)
		})
	</script>
	<%
		}
	%>
</body>
</html>
