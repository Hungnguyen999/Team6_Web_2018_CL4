<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>HỆ THỐNG THI TRẮC NGHIỆM ONLINE</title>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/style_OT.css" rel="stylesheet" type="text/css"/>
        <!-- Latest compiled and minified CSS -->
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/material-design-iconic-font/css/material-design-iconic-font.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Lobster|Pacifico" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="assets/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="wapper">
        <jsp:include page="Header.jsp"></jsp:include>
        <div class="main-menu">
             <nav class="navbar navbar-inverse" data-spy="affix" role="navigation" data-offset-top="67">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-main" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand" href="index.jsp" data-toggle="tooltip" data-placement="top" title="Trang chủ">
                          <span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-main">
                      <ul class="nav navbar-nav">
                        <li data-toggle="tooltip" data-placement="top" title="Liên hệ"><a href="Contact.jsp">Liên hệ <span class="sr-only">(current)</span></a></li>
                        <li data-toggle="tooltip" data-placement="top" title="Hướng dẫn"><a href="#">Hướng dẫn</a></li>
                      </ul>
                      <ul class="nav navbar-nav navbar-right">
                          <li data-toggle="tooltip" data-placement="top" title="Đăng nhập"><a href="Login.jsp" >Đăng nhập</a></li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container-fluid -->
                </nav>
        </div>
        <div class="main">
            <div class="img-main">
                <div class="container">
                    <div class="col-md-6 col-sm-8 col-md-offset-4 col-sm-offset-2 pull-right">
                        <div class="row">
                            <h2 id="welcome">Welcome to online exam	page</h2>
                        </div>
                        <div class="row">
                            <p style="font-size: 17px;color: white">Web thi trắc nghiệm là trang web giúp tạo bài kiểm tra trở nên nhanh chóng và dễ dàng. Với trang web này, rất thuận tiện để thêm câu hỏi, bài kiểm tra và quản lý bài kiểm tra. Sinh viên có thể làm bài kiểm tra của họ một cách nhanh chóng</p>
                        </div>
                        <div class="row">
                            <a role="button" class="back-to-down"><img src="assets/Images/funnell-button-get-started.png" alt="" style="margin-left: -14px;height: 65px;"/></a>
                        </div>
                    </div>
                    <div class="col-md-offset-4 col-sm-offset-3 col-xs-offset-2" style="margin-top: 493px">
                        
                    </div>
                </div>
            </div>
            <div class="introduce">
                <div class="container">
                    <div class="row">
                        <h2 style="text-align: center;margin-top: 45px">
                                <span style="font-weight: 400;font-family: 'Baloo Da', cursive;">Những lợi ích của hình thức thi trắc nghiệm online </span>
                            </h2>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="margin-top: 40px;">
                            <ul>
                                <li><i class="fa fa-bolt" aria-hidden="true"></i> 
                                Tiết kiệm được rất nhiều chi phí ví dụ như in đề, in phiếu trả lời trắc nghiệm, đi lại, tiết kiệm thời gian coi thi và chấm thi...
                                </li>
                                <li><i class="fa fa-bolt" aria-hidden="true"></i> 
                                Sinh viên không thể nào học tủ được mà phải học toàn bộ trên cơ sở hiểu rõ và vận dụng.
                                </li>
                                <li><i class="fa fa-bolt" aria-hidden="true"></i> 
                                Không sợ gò bó về không gian và thời gian.
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <img src="assets/Images/online-exam-conduct-exam.png" alt="" id="img-intro">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        <jsp:include page="Footer.jsp"></jsp:include>
        <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">  
            <img src="assets/Images/1349751884_navigation-up-button_blue.png" alt=""/>
        </p>
    </div>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>     
    <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/JS/back-to-top.js" type="text/javascript"></script>
 
</body>
</html>
