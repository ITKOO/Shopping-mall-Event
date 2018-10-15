<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">
    <!-- Title Page-->
    <title>BBong Shopping</title>
    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
<%!
	String item_name;    // 아이템 이름
	String item_explain; // 설명
	String imgAddress1; // 사진주소
	String imgAddress2; // 사진주소
	String imgAddress3; // 사진주소
	String imgAddress4; // 사진주소
	String timeExplain;
	String opentime;
	int item_status;
	String status;
	int item_num;
	int item_price; // 가격
	int rows;
%>


<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/eventdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	item_num = Integer.parseInt(request.getParameter("item_num"));
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
	  	String sql = "select * from item_list where item_num = " + item_num + ";";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=pstmt.executeQuery();
	  	while(rs.next()){  		
	  		item_name = rs.getString("item_name"); 
	  		item_explain = rs.getString("item_explain");
	  		item_status = rs.getInt("item_status");
	  		item_price = rs.getInt("item_price");
	  		imgAddress1 = rs.getString("imgAddress1");
	  		imgAddress2 = rs.getString("imgAddress2");
	  		imgAddress3 = rs.getString("imgAddress3");
	  		imgAddress4 = rs.getString("imgAddress4");
	  		
	  		opentime = rs.getString("opentime");

	  		if(item_status == 0)  			
	  		{
	  			status ="online";
	  		}
	  		else
	  		{
	  			status ="";
	  		}
	  		
	  		if(opentime == null)
	  		{
	  			timeExplain = "예) 11시, 내일 5시";
	  		}
	  		
	  		else
	  		{
	  			timeExplain = opentime;
	  		}
	  	

	  	}
	  
	  
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>    

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">이벤트 시간 설정</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            
          </div>
        </div>
      </div>

    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.html">
                            <img src="images/icon/logo.png" alt="CoolAdmin" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li class="has-sub">
                            <a class="js-arrow" href="admin.jsp">
                                <i class="fas fa-tachometer-alt"></i>HOME</a>
                            <!-- <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="index.html">Dashboard 1</a>
                                </li>
                                <li>
                                    <a href="index2.html">Dashboard 2</a>
                                </li>
                                <li>
                                    <a href="index3.html">Dashboard 3</a>
                                </li>
                                <li>
                                    <a href="index4.html">Dashboard 4</a>
                                </li>
                            </ul> -->
                        </li>
                        
                         <li>
                            <a href="view_admin.jsp">
                                <i class="fas fa-eye"></i>View</a>
                        </li>
                        
                        <li>
                            <a href="event_admin.jsp">
                                <i class="fas fa-table"></i>Event</a>
                        </li>
                      
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="admin.jsp">
                    <img src="images/icon/logo.png" alt="BBong" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="active has-sub">
                            <a class="js-arrow" href="admin.jsp">
                                <i class="fas fa-tachometer-alt"></i>Home</a>
                            <!-- <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="index.html">Dashboard 1</a>
                                </li>
                                <li>
                                    <a href="index2.html">Dashboard 2</a>
                                </li>
                                <li>
                                    <a href="index3.html">Dashboard 3</a>
                                </li>
                                <li>
                                    <a href="index4.html">Dashboard 4</a>
                                </li>
                            </ul> -->
                        </li>
                        
                         <li>
                            <a href="view_admin.jsp">
                                <i class="fas fa-eye"></i>View</a>
                        </li>
                        
                        <li>
                            <a href="event_admin.jsp">
                                <i class="fas fa-table"></i>Event</a>
                        </li>
                      
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                                
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="images/icon/avatar-01.jpg" alt="구지뽕" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">구지뽕</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#">구지뽕</a>
                                                    </h5>
                                                    <span class="email">itkoo2000@gmail.com</span>
                                                </div>
                                            </div>
                                           
                                            <div class="account-dropdown__footer">
                                                <a href="#">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
 						<div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1" style = "margin-bottom: 20px;">아이템 수정하기</h2>
                                    
                                </div>
                            </div>
                         </div>   
                        <div class="row">
                            <div class="col-lg-12">
                               <form name="itemForm" method="post" enctype="multipart/form-data" action="viewAdminProc.jsp?item_num=<%=item_num %>" class="form-horizontal">
            				<div class="card">
                   
                    
                        <div class="card-body card-block">
                            
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">올린이</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <p class="form-control-static">구지뽕</p>
                                    </div>
                                </div>
                                
                               
                                
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="item_name" class=" form-control-label">아이템 이름</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="item_name" name="item_name" placeholder = "<%=item_name %>" class="form-control">
                                    </div>
                                </div>
    
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="item_explain" class=" form-control-label">아이템 설명</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="item_explain" id="item_explain" rows="9" class="form-control" placeholder = "<%=item_explain %>"></textarea>
                                    </div>
                                </div>
    
    
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="item_price" class=" form-control-label" readonly="readonly">아이템 가격</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="item_price" name="item_price" class="form-control" placeholder = "<%=item_price %>">
                                        <small class="form-text text-muted">원(won) 단위입니다.</small>
                                    </div>
                                </div>
    
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="select" class=" form-control-label">상품선택</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="item_status" id="item_status" class="form-control">
                                            <option value = "0">정상</option>
                                            <option value = "1">대기</option>
                                        </select>
                                    </div>
                                </div>
    
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="file-input" class=" form-control-label">아이템 사진</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                       <img src = "img/item/<%=imgAddress1 %>" width=200 height=200 style = "margin-bottom: 10px;margin-right: 6px;">
                                       <img src = "img/item/<%=imgAddress2 %>" width=200 height=200 style = "margin-bottom: 10px;"><br>
                                       <img src = "img/item/<%=imgAddress3 %>" width=200 height=200 style = "margin-right: 6px;">
                                       <img src = "img/item/<%=imgAddress4 %>" width=200 height=200>
                                       <br><br><br>
                                       <input type="file" id="file-input" name="filename1" class="form-control-file" style="margin-bottom: 10px;">
                                        <input type="file" id="file-input" name="filename2" class="form-control-file" style="margin-bottom: 10px;">
                                        <input type="file" id="file-input" name="filename3" class="form-control-file" style="margin-bottom: 10px;">
                                        <input type="file" id="file-input" name="filename4" class="form-control-file" style="margin-bottom: 10px;">
                                       
                                    </div>
                                </div>
                            
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary btn-sm">
                                <i class="fa fa-dot-circle-o"></i> 등록
                            </button>
                            <button type="reset" class="btn btn-danger btn-sm" data-dismiss="modal" onclick = "location.href='admin.jsp'">
                                <i class="fa fa-ban"></i> 취소
                            </button>
                        </div>
                </div>
                </form>

                                     
                    
                      
                   	   
                   	   
                   	          </div>
                                        
                         </div>
                    </div>
               </div>
         </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2018 ITKOO. All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
    
   

</body>

</html>
<!-- end document-->

