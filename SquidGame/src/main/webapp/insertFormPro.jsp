<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 입력</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	int A_seq =  Integer.parseInt(request.getParameter("A_seq"));
	String A_title = request.getParameter("A_title");
	String A_text = request.getParameter("A_text");
	String A_name = request.getParameter("A_name");
	String A_date1 = request.getParameter("A_date1"); 
	String A_department  = request.getParameter("A_department");
	int A_imsisave  =  Integer.parseInt(request.getParameter("A_imsisave"));
   
   Timestamp reg_date = new Timestamp(System.currentTimeMillis());

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   
   	try{
   		String jdbcUrl="jdbc:mysql://localhost:3306/sibal";

   		String dbId = "sang";
   		String dbPass = "12345";

   		Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass ); 

	String SQL = "INSERT INTO  Approval VALUES (?,?,?,?,?,?,?)";	
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, A_seq);
		pstmt.setString(2, A_title);
		pstmt.setString(3, A_text);
		pstmt.setString(4, A_name);
		pstmt.setString(5, A_date1);
		pstmt.setString(6, A_department);
		pstmt.setInt(7, A_imsisave);
		pstmt.executeUpdate();
    	str= "Approval 테이블에 새로운 레코드를 추가했습니다.";

 }catch(Exception e){ 
 	e.printStackTrace();
	str="Approval 테이블에 새로운 레코드를 추가에 실패했습니다";
	 }finally{
	 if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	 if(conn != null) try{conn.close();}catch(SQLException sqle){}
 	}
%>
 <html>
 <head><title>레코드 추가</title></head>
 <body>
  	 <%=str %>
  	  <p>
	<a href="selectPro.jsp">조회 페이지로 이동</a>
 </body>
 </html>
