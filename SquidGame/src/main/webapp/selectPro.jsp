<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>레코드를 표시</title>
</head>
<body>
	

	<% 
   Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   
   	try{
   		String jdbcUrl="jdbc:mysql://localhost:3306/sibal";

   		String dbId = "sang";
   		String dbPass = "12345";

   		Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass ); 

	String SQL = "select * from Approval1";	
		pstmt = conn.prepareStatement(SQL);
		rs=pstmt.executeQuery();
    	
    	while(rs.next()){
    		int A_seq =  rs.getInt("A_seq");
    		String A_title = rs.getString("A_title");
    		String A_text = rs.getString("A_text");
    		String A_name = rs.getString("A_name");
    		String A_date1 = rs.getString("A_date1"); 
    		String A_department  = rs.getString("A_department");
    		int A_imsisave  =  rs.getInt("A_imsisave");
%>
    	<p>기안열람</p>
	<br>
	<br>
		<p align="center">함께하는 공정사회! 저 큰 희망 456억!</p>
		<img alt="오징어" src="image/osm.jpg">
		<h3 align="center">쭈꾸미 안전부</h3>
		<table border="1" align="right">
			<th>팀장</th>
			<th>병헌형</th>
			<tr>
				<td>팀장</td>
				<td>병헌형</td>
			</tr>
		</table>
		<p>번호<%=A_seq%></p> <hr />
		<br /> <p>제목 <%=A_title %></p><p>작성자<%=A_name %></p><p>부서<%=A_department%></p>
		<hr />
		<p>작성날짜<%=A_date1 %></p> <hr />
		본문<br />
		<p><%=A_text%></p>
		<p></p>
		<h3 align="center">쭈꾸미 안전부 호스트맨</h3>
		<hr />

    	
<%
    	}
 }catch(Exception e){ 
 	e.printStackTrace();
	 }finally{
	 if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	 if(conn != null) try{conn.close();}catch(SQLException sqle){}
 	}
%>
	</table>
	<p>
		<a href="insertForm.jsp">입력 페이지로 이동</a> <a href="updateForm.jsp">수정
			페이지로 이동</a> <a href="deleteForm.jsp">삭제 페이지로 이동</a>
</body>
</html>
