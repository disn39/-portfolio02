<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 입력</title>
</head>
<body>
<p>기안열람</p><br>
	<br>
	<form action="#">
	<p align="center">함께하는 공정사회! 저 큰 희망 456억!</p>
	<img alt="오징어" src="image/osm.jpg">
	<h3 align="center" >쭈꾸미 안전부</h3>
	<table border="1" align="right">
		<th>팀장</th>
		<th>병헌형</th>
		<tr>
			<td>팀장</td>
			<td>병헌형</td>
		</tr>
	</table>
	수신 팀장님<br />
	제목	<input type="text" id="title"/>
	<hr />
	본문<br />
	<textarea rows="20" cols="100"></textarea>
	<h3 align="center">쭈꾸미 안전부 호스트맨</h3>
	<hr />
	수신자<input type="text" id="hostman"/>
	<hr />
	<input type="submit" value="결재전송"/>
	<input type="submit" value="임시저장" />
	</form>
</body>
</html>
