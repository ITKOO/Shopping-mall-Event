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
	String item_name;
	String item_explain;
	String item_price;
	int item_num;
	int item_status;
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
	String realFolder = ""; 
	String filename1 = ""; 
	String filename2 = ""; 
	String filename3 = ""; 
	String filename4 = ""; 
	int maxSize = 1024*1024*5; 
	String encType = "UTF-8"; 
	String savefile = "img/item"; 
	ServletContext scontext = getServletContext(); 
	realFolder = scontext.getRealPath(savefile); 
	 
	try{ 
	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
	item_name = multi.getParameter("item_name");    // 이름
	item_explain = multi.getParameter("item_explain"); // 학번
	item_price = multi.getParameter("item_price");    // 전번
	item_status = Integer.parseInt(multi.getParameter("item_status"));
	
	
	Enumeration<?> files = multi.getFileNames(); 
	String file1 = (String)files.nextElement(); 
	String file2 = (String)files.nextElement(); 
	String file3 = (String)files.nextElement(); 
	String file4 = (String)files.nextElement(); 
	
	filename1 = multi.getFilesystemName(file1); 
	filename2 = multi.getFilesystemName(file2); 
	filename3 = multi.getFilesystemName(file3); 
	filename4 = multi.getFilesystemName(file4); 
	
	} catch(Exception e) { 
	e.printStackTrace(); 
	} 
	
	String fullpath = realFolder + "\\" + filename1; 
	String fullpath2 = realFolder + "\\" + filename2; 
	String fullpath3 = realFolder + "\\" + filename3; 
	String fullpath4 = realFolder + "\\" + filename4; 
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
		
	
	  	String sql = "update item_list set item_name=? , item_explain=?, item_price=?, item_status=?, imgAddress1=?, imgAddress2=?,imgAddress3=?,imgAddress4=? where item_num="+ item_num +";";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, item_name);
	  	pstmt.setString(2, item_explain);
	  	pstmt.setString(3, item_price);
	  	pstmt.setInt(4, item_status);
	  	pstmt.setString(5, filename1);
	  	pstmt.setString(6, filename2);
	  	pstmt.setString(7, filename3);
	  	pstmt.setString(8, filename4);

	  	/*
	  	String sql = "update indexPage set main_title=?, small_title=?";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, main_title);
	  	pstmt.setString(2, small_title);
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	*/
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	response.sendRedirect("admin.jsp"); 
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>

</body>
</html>
