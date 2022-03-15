package approval;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SignODAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public SignODAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/sibal";
			String dbID = "sang";
			String dbPassword = "12345";
			   Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("시스템 연결");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL = "select A_name from Approval1 order by A_name desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<SignO> getList(int pageNumber) {
		String SQL = "SELECT * FROM (SELECT * FROM Approval1 WHERE A_name < ? AND bbsAvailable = 1 ORDER BY A_seq DESC) WHERE ROWNUd 10";
		ArrayList<SignO> list = new ArrayList<SignO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SignO bbs = new SignO();
				bbs.setA_seq(rs.getInt(1));
				bbs.setA_title(rs.getString(2));
				bbs.setA_name(rs.getString(3));
				bbs.setA_department(rs.getString(4));
				bbs.setA_date1(rs.getString(5));
				list.add(bbs);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(SignO signO) {
		
		String SQL = "INSERT INTO Approval1 VALUES (?,?,?,now(),?,?)";	
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, signO.getA_title());
			pstmt.setString(2, signO.getA_text());
			pstmt.setString(3, signO.getA_name());
//			A_date1
			pstmt.setString(4, signO.getA_department());
			pstmt.setInt(5, signO.getA_imsisave());
			return pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
	}
//	private int A_seq;
//	private String A_title;
//	private String A_text;
//	private String A_name;
//	private String A_date1;
//	private String A_department;
//	private int A_imsisave;
}