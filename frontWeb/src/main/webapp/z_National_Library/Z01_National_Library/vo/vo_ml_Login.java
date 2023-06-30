package Z01_National_Library.vo;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import frontWeb.DB;

public class vo_ml_Login {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 로그인 기능을 하기 위한 기능
	public vo_joinMem login(String id, String pass) {
		vo_joinMem mem = null;
		String sql = "SELECT * FROM NATIONALLIBRARY WHERE ID = ? AND PASS = ?";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mem = new vo_joinMem(
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

		return mem;
	}
}
