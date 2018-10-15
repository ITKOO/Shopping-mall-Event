<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>BBong Shopping</title>

    <!-- Favicon  -->
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

</head>

<body>

<%!
	String item_name;    // 아이템 이름
	String item_explain; // 설명
	String imgAddress1; // 사진주소
	String opentime;
	int item_status; // 아이템 상태(정상/대기)
	int item_num;
	int item_price; // 가격
	int rows;
%>


    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop.jsp">Shop</a></li>
                    <li class="active"><a href="event.jsp">Event</a></li>
                   
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">How to?</a>
            </div>
           
          
        </header>
        <!-- Header Area End -->

        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/eventdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
	  	String sql = "select * from item_list;";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=pstmt.executeQuery();
	  	while(rs.next()){  		
	  		item_status = rs.getInt("item_status");
	  		item_name = rs.getString("item_name"); 
	  		item_explain = rs.getString("item_explain");
	  		item_price = rs.getInt("item_price");
	  		imgAddress1 = rs.getString("imgAddress1");
	  		item_num = rs.getInt("item_num");
	  		opentime = rs.getString("opentime"); 
	  		/*
	  		 <!-- Single Catagory -->
             <div class='single-products-catagory clearfix'><a href = 'view_detail.jsp?item_num=" + item_num +"'><img src=src = 'img/item/" + imgAddress + ">
                     <!-- Hover Content -->
                     <div class="hover-content">
                         <div class="line"></div>
                         <p>"+ item_price + "원</p>
                         <h4>" + item_name + "</h4>
                     </div>
                 </a>
             </div>
             */
	  		
	  		
            
            // 대기 상태일때
            if(item_status == 1)
            {
            	 out.println("<div class='single-products-catagory clearfix randombox'><a href = 'view_detail.jsp?item_num=" + item_num +"'><img src= 'img/randombox.JPG'"+ 
             	  		"><div class='hover-content'><div class='line'></div><span style = 'background-color:#f9a825;padding-top:5px; color:#fff;font-size:17px;padding-bottom:3px;'>&nbsp;&nbsp;"+ item_price + "₩&nbsp;&nbsp;</span><h4 style = 'margin-top:5px;background-color:#000;padding-top:5px; color:#fff'>&nbsp;"+ opentime+"에 열립니다!&nbsp;&nbsp; </h4></div></a></div>");
            }
             
             if(item_price == 0)
             {
             	 out.println("<div class='single-products-catagory clearfix'><a href = 'view_detail.jsp?item_num=" + item_num +"'><img src= 'img/item/"+ imgAddress1 +  
              	  		"'><div class='hover-content'><div class='line'></div><span style = 'background-color:#f9a825;padding-top:5px; color:#fff;font-size:17px;padding-bottom:3px;'>&nbsp;&nbsp;"+ item_price + "₩&nbsp;&nbsp;</span><h4 style = 'margin-top:5px;background-color:#000;padding-top:5px; color:#fff'>&nbsp;Open : "+ item_name+"&nbsp;&nbsp; </h4></div></a></div>");
             }
             
             
           
	  	}
	  
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>
               

             
            </div>
        </div>
        <!-- Product Catagories Area End -->
    </div>


   
    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index.jsp"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;ITKOO 2018.<br>All rights reserved.
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-8">
                    <div class="single_widget_area">
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <nav class="navbar navbar-expand-lg justify-content-end">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                <div class="collapse navbar-collapse" id="footerNavContent">
                                    <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.jsp">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="shop.jsp">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="event.jsp">Event</a>
                                        </li>
                                       
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    
    <script type="text/javascript">
    	$(".randombox").css({ 'pointer-events': 'none' });
    </script>

</body>

</html>