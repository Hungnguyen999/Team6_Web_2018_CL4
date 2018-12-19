<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Mirrored from coderthemes.com/uplon_1.4/light/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Oct 2016 16:03:45 GMT -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>

<!--Morris Chart CSS -->
<link rel="stylesheet" href="assets/plugins/morris/morris.css">

<!-- Switchery css -->
<link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

<!-- App CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

<!-- Modernizr js -->
<script src="assets/JS/modernizr.min.js"></script>
<script src="assets/JS/analytics.js" type="text/javascript"></script>

<link href="assets/font-awesome-4.6.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="assets/material-design-iconic-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="fixed-left">
	<%
		Users users = null;
		if (session.getAttribute("userAdmin") == null) {
			response.sendRedirect("/ExamOnline/Login.jsp");

		} else {
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
							<a href="Profile.jsp?UserName=<%=users.getUserName()%>"
								class="dropdown-item notify-item"> <i
								class="zmdi zmdi-account-circle"></i> <span>Profile</span>
							</a>
							<!-- item-->
							<a href="Doimatkhau.jsp?UserName=<%=users.getUserName()%>"
								class="dropdown-item notify-item"> <i
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
		<!-- Top Bar End -->
		<!-- ========== Left Sidebar Start ========== -->
		<div class="left side-menu">
			<div class="sidebar-inner slimscrollleft">
				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<ul>
						<li class="text-muted menu-title"><i class="fa fa-users"
							aria-hidden="true"></i> Quản lý tài khoản</li>
						<li class="has_sub"><a href="DSTaiKhoan.jsp"
							class="waves-effect" id="DSTK"><i class="fa fa-user"
								aria-hidden="true"></i><span style="margin-left: 20px">
									Danh sách tài khoản</span> </a></li>
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect"><i class="fa fa-info" aria-hidden="true"></i>
								<span style="margin-left: 20px">Chi tiết </span> <span
								class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li><a href="DSTK-NQTNHCauHoi.jsp" id="DSTK-QTNHCH">Người
										quản trị ngân hàng câu hỏi</a></li>
								<li><a href="DSTK-NguoiRaDe.jsp" id="DSTK-NRD">Người ra
										đề</a></li>
								<li><a href="DSTKNQTKyThi.jsp" id="DSTK-NQTKT">Người
										quản trị kỳ thi</a></li>
								<li><a href="DSTKSinhVien.jsp" id="DSTK-SV">Sinh viên</a></li>
							</ul></li>
						<li class="has_sub"><a href="DSRole.jsp" class="waves-effect"><i
								class="fa fa-tachometer" aria-hidden="true"></i><span
								style="margin-left: 20px"> Vai trò </span></a></li>
						<li class="text-muted menu-title"><i class="fa fa-adn"
							aria-hidden="true"></i> Quản lý điểm</li>
						<li class="has_sub"><a href="DSDiem.jsp" class="waves-effect"><i
								class="fa fa-tachometer" aria-hidden="true"></i><span
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
								<ol class="breadcrumb p-0">
									<li><a href="index.jsp">Trang chủ</a></li>
									<li class="active">Admin</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->
					<div class="row">
						<div id="carousel-example-captions-1" data-ride="carousel"
							class="carousel slide">
							<ol class="carousel-indicators">
							</ol>
							<div role="listbox" class="carousel-inner">
								<div class="carousel-item active">
									<img src="assets/Images/image01.png" alt="" style="width: 100%">
								</div>
							</div>
						</div>
					</div>
					<!-- end row -->
				</div>
				<!-- container -->
			</div>
			<!-- content -->
		</div>
		<!-- End content-page -->
		<!-- End Right content here -->
		<!-- Right Sidebar -->

		<!-- /Right-bar -->

		<footer class="footer text-right">©Nhóm 6 - Sáng thứ 4 </footer>


	</div>
	<!-- END wrapper -->


	<script>
		var resizefunc = [];
	</script>

	<!-- jQuery  -->
	<script src="assets/JS/jquery.min.js"></script>
	<script src="assets/JS/tether.min.js"></script>
	<!-- Tether for Bootstrap -->
	<script src="assets/JS/bootstrap.min.js"></script>
	<script src="assets/JS/detect.js"></script>
	<script src="assets/JS/fastclick.js"></script>
	<script src="assets/JS/jquery.blockUI.js"></script>
	<script src="assets/JS/waves.js"></script>
	<script src="assets/JS/jquery.nicescroll.js"></script>
	<script src="assets/JS/jquery.scrollTo.min.js"></script>
	<script src="assets/JS/jquery.slimscroll.js"></script>
	<script src="assets/plugins/switchery/switchery.min.js"></script>
	<!--Morris Chart-->
	<script src="assets/plugins/morris/morris.min.js"></script>
	<script src="assets/plugins/raphael/raphael-min.js"></script>
	<!-- App js -->
	<script src="assets/JS/jquery.core.js"></script>
	<script src="assets/JS/jquery.app.js"></script>

	<!-- Page specific js -->

	<%
		}
	%>
</body>

<!-- Mirrored from coderthemes.com/uplon_1.4/light/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 14 Oct 2016 16:04:15 GMT -->

</html>