<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<h2>JDBC드라이버 테스트</h2>

<%
Connection conn = null;

try {
	String dbURL = "jdbc:mysql://localhost:3306/sibal";
	String dbID = "sang";
	String dbPassword = "12345";
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	out.println("시스템 연결");
} catch (Exception e) {
	e.printStackTrace();
}
%>

<p>
	<a href="insertForm.jsp">데이터 입력 페이지로 이동</a><br> <a
		href="selectPro.jsp">데이터 조회 페이지로 이동</a><br> <a
		href="updateForm.jsp">데이터 수정 페이지로 이동</a><br> <a
		href="deleteForm.jsp">데이터 삭제 페이지로 이동</a>
