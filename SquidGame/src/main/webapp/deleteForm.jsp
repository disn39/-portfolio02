<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 삭제</title>
</head>
<body>
    <h2>member3 테이블의 레코드 삭제</h2>
    
    <form method="post" action="deleteFormPro.jsp">
         아이디: <input type="text" name="id" maxlength="12"><br>
         패스워드: <input type="password" name="password" maxlength="12"><br>
         <input type="submit" value="삭제완료">
          <input type="reset" value="삭제취소">
    </form>
</body>
</html>
