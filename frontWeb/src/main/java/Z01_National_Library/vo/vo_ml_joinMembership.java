package Z01_National_Library.vo;

import java.sql.*;

import frontWeb.DB;

public class vo_ml_joinMembership {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 회원가입을 하기 위한 기능
	public vo_joinMem join(String name01, String id, String pass, String email, String address, String phonenumber,
			String gender, String memtype) {
		vo_joinMem jom = null;
		String sql = "SELECT * FROM NATIONALLIBRARY WHERE NAME01 = ? AND ID = ?"
				+ " AND PASS = ? AND EMAIL = ? AND ADDRESS = ? AND PHONENUMBER = ?"
				+ " AND GENDER = ? AND MEMTYPE = ?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name01);
			pstmt.setString(2, id);
			pstmt.setString(3, pass);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			pstmt.setString(6, phonenumber);
			pstmt.setString(7, gender);
			pstmt.setString(8, memtype);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				jom = new vo_joinMem (
					rs.getString("name01"),
					rs.getString("id"),
					rs.getString("pass"),
					rs.getString("email"),
					rs.getString("address"),
					rs.getString("phonenumber"),
					rs.getString("gender"),
					rs.getString("memtype")		
				);
			}
			
		} catch (SQLException e) {
			System.out.println("DB: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("기타: " + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}

		return jom;
	}

}
