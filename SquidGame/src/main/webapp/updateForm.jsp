<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 수정</title>
</head>
<body>
    <h2>member3테이블의 레코드 수정</h2>
    
    <form method="post" action="updateFormPro.jsp">
         아이디: <input type="text" name="id" maxlength="12"><br>
         패스워드: <input type="password" name="password" maxlength="12"><br>
         변경할 이름: <input type="text" name="name" maxlength="10"><br>
         <input type="submit" value="수정완료">
         <input type="reset" value="수정취소">
    </form>
</body>
</html>
