<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%  request.setCharacterEncoding("UTF-8");%>
<%
  	String id= request.getParameter("id");
	  String password= request.getParameter("password");
	  
	  Connection conn=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;

  try{
	  String jdbcUrl="jdbc:mysql://localhost:3306/sibal";

		String dbId = "sang";
		String dbPass = "12345";

		Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);

	String sql= "select id, password from member1 where id= ?";
	pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){ 
		String rId=rs.getString("id");
		String rpassword=rs.getString("password");

	    if(id.equals(rId) && password.equals(rpassword)){
	    sql= "delete from member1 where id= ? ";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	    pstmt.executeUpdate();
	%>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 삭제</title>
</head>
<body>
	  member 테이블의 레코드를 삭제했습니다.
</body>
</html>
<%
		}else{
			out.println("패스워드가 틀렸습니다.");}
	}else{
	 out.println("아이디가 틀렸습니다.");
	}
	}catch(Exception e){ 
	e.printStackTrace();
	}finally{
	if(rs != null) try{rs.close();}catch(SQLException sqle){     }
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>
 	<p> 	
	<a href="selectPro.jsp">조회 페이지로 이동</a><br>
	
	