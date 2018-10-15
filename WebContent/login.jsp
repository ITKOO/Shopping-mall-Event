<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
body {font-family: 'Nanum Gothic', sans-serif;
margin-top:300px;}
form {
width: 600px;
text-align:center;
margin: 0 auto;
border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 400px;
   
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #fbb710;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 95%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<title>Admin</title>
</head>
<body>

<h2 style = "text-align: center;">BBong Shopping Admin</h2><br><br>




  <div class="container">
  <form method = "post" action = "loginProc.jsp">
  	<label for="id" style = "float:left;"><b>ID</b></label>
    <input type="text" id = "id" placeholder="ID를 입력하세요." name="pw" style = "float:right;"required><br>
    <label for="psw" style = "float:left;"><b>Password</b></label>
    <input type="password" id = "pw" placeholder="비밀번호를 입력하세요." name="pw" style = "float:right;" required><br>
        
    <button type="submit">Login</button>
   </form>
  </div>



<script>

</script>



</body>
</html>
