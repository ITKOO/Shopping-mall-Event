<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int item_num;
	String opentime;

%>

<!-- 

CREATE TABLE item_list (
  item_num MEDIUMINT NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(64) character set utf8 NOT NULL,
  item_explain VARCHAR(200) character set utf8 NOT NULL,
  item_price INT(11) unsigned NOT NULL,
  PRIMARY KEY (item_num)
);

 -->
<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	
	String url = "jdbc:mysql://localhost:3306/eventdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	item_num = Integer.parseInt(request.getParameter("item_num"));
	System.out.println("!!!!!!!!!!!!!" + item_num);
	opentime = request.getParameter("opentime");
	System.out.println("!!!!!!!!!!!!!" + opentime);
	
	 
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
		
		String sql = "update item_list set opentime=? where item_num="+ item_num +";";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, opentime);
	  	

	  	/*
	  	String sql = "update item_list set opentime=? where item_num=;
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, main_title);
	  	pstmt.setString(2, small_title);
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	*/
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	response.sendRedirect("event_admin.jsp"); 
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>

</body>
</html>
