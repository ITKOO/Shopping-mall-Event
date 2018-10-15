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
	String item_name;    // 학번
	String item_explain; // 설명
	String imgAddress1; // 사진주소
	String imgAddress2; // 사진주소
	String imgAddress3; // 사진주소
	String imgAddress4; // 사진주소
	int count;
	int item_num;
	int item_price; // 가격
	boolean status;
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
	  	String sql = "select * from item_list where item_num ="+ item_num +" ;";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=pstmt.executeQuery();
	  	while(rs.next()){  		
	  		item_name = rs.getString("item_name"); 
	  		item_explain = rs.getString("item_explain");
	  		item_price = rs.getInt("item_price");
	  		imgAddress1 = rs.getString("imgAddress1");
	  		imgAddress2 = rs.getString("imgAddress2");
	  		imgAddress3 = rs.getString("imgAddress3");
	  		imgAddress4 = rs.getString("imgAddress4");
	  		item_num = rs.getInt("item_num");
	  		count = rs.getInt("count");
	  	
	  		System.out.println(item_price);
	  		// 이벤트일때
	  		if(item_price == 0)
	  		{
	  			status = true;
	  		}
	  		
	  		else
	  		{
	  			status = false;
	  		}
	  		
	  		System.out.println(status);
	  		
	  	}
	  
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
	
	
	
	
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
                    <li class="active"><a href="product-details.html">Event</a></li>
                    
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">How to?</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
               
            </div>
          
        </header>
        <!-- Header Area End -->

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Item</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(img/item/<%=imgAddress1%>);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(img/item/<%=imgAddress2%>);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/item/<%=imgAddress3%>);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/item/<%=imgAddress4%>);">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="img/item/<%=imgAddress1%>">
                                            <img class="d-block w-100" src="img/item/<%=imgAddress1%>" alt="First slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="img/item/<%=imgAddress2%>">
                                            <img class="d-block w-100" src="img/item/<%=imgAddress2%>" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="img/item/<%=imgAddress3%>">
                                            <img class="d-block w-100" src="img/item/<%=imgAddress3%>" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="img/item/<%=imgAddress4%>">
                                            <img class="d-block w-100" src="img/item/<%=imgAddress4%>" alt="Fourth slide">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price"><%=item_price %>₩</p>
                                <a href="product-details.html">
                                    <h6><%=item_name %></h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <!-- Avaiable -->
                                <p class="avaibility"><i class="fa fa-circle"></i> BBong's Pick</p>
                            </div>

                            <div class="short_overview my-5">
                                <p><%=item_explain %></p>
                            </div>

                            <!-- Add to Cart Form -->
                            <form class="cart clearfix" method="post">
                                <div class="cart-btn d-flex mb-50">
                                    <p>수량</p>
                                    <div class="quantity">
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                    </div>
                                </div>
                                
                                <%
                                	
                                	System.out.println("최ㅣㅣ!!!!!!!" + status);
	                                if(status == true)
	                            	{
	                            		out.println("<button type='submit' name='addtocart' value='5' onclick = 'eventCount()' class='btn amado-btn' style = 'margin-bottom: 20px;'>무료로 구매하기</button>");
	                            	}
                                
	                                else
	                                {
	                                	out.println("<button type='submit' name='addtocart' value='5' onclick = 'normal()' class='btn amado-btn' style = 'margin-bottom: 20px;'>구매하기</button>");
	                                }
                                
                                %>
                                
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

   
    

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
                                            <a class="nav-link" href="shop.html">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="product-details.html">Event</a>
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
  
    
  
    <script>
		var count = 0;
		function normal() {
			
		    alert("구입되셨습니다! 축하드려요!");
		}
		
		function eventCount(){
			count++;
			
			<%
	  		if(count == 0)
	  		{
	 %>
	 		alert("1번째 이십니다!ㅜㅜ 완전축하드려요");
	 		
	 
	 <% 
	 
	 
	 

		
		
				try{
					Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
					
					String sql = "update item_list set count=? where item_num=" + item_num + ";";
				  	PreparedStatement pstmt = conn.prepareStatement(sql);
				  	pstmt.setInt(1, 1);
				  
		
				  	/*
				  	String sql = "update item_list set count=? where item_num=" + item_num + ";";
				  	PreparedStatement pstmt = conn.prepareStatement(sql);
				  	pstmt.setString(1, main_title);
				  	pstmt.setString(2, small_title);
				  	pstmt.executeUpdate();
				  	pstmt.close();
				  	*/
				  	pstmt.execute();
				  	pstmt.close(); 
				}catch(SQLException e){
				
				  out.println(e.toString());
				
				}
	  		} // end of if
			
			
	  		else{%>
	  
	  			alert("탈락이세요..ㅜㅜ 아쉽지만 다음기회에");
	  			
	  <%			
	  		}
	 %>
			
			
		} // end of eventCount
</script>

</body>

</html>