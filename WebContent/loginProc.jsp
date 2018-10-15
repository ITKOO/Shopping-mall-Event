<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!String pw; %>
<%
request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	

pw = request.getParameter("pw");

if(pw.equals("rnwldnjs"))
{ 
	session.setAttribute("Password", pw);
	pageContext.forward("admin.jsp");

}

else
{
	out.println("<script>alert('비밀번호를 잘못입력하셨습니다!')</script>");
	pageContext.forward("login.jsp");
	
}

%>
</body>
</html>
