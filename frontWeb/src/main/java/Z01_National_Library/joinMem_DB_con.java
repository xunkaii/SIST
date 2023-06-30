package Z01_National_Library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Z01_National_Library.vo.vo_joinMem;
import frontWeb.DB;

public class joinMem_DB_con {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 회원등록 기능
	public void insertMember(vo_joinMem ins) {
		String sql = "INSERT INTO NATIONALLIBRARY (NAME01, ID, PASS, EMAIL, ADDRESS, PHONENUMBER, GENDER, MEMTYPE)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getName01());
			pstmt.setString(2, ins.getId());
			pstmt.setString(3, ins.getPass());
			pstmt.setString(4, ins.getEmail());
			pstmt.setString(5, ins.getAddress());
			pstmt.setString(6, ins.getPhonenumber());
			pstmt.setString(7, ins.getGender());
			pstmt.setString(8, ins.getMemtype());
			int isInsert = pstmt.executeUpdate();
			if (isInsert == 1) {
				con.commit();
				System.out.println("회원등록 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB: " + e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("DB: " + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
	public vo_joinMem joinMember(String name01, String id, String pass, String email, String address, String phonenumber,
			String gender, String memtype) {
		vo_joinMem joinMem = null;
		String sql = "INSERT INTO NATIONALLIBRARY (NAME01, ID, PASS, EMAIL, ADDRESS, PHONENUMBER, GENDER, MEMTYPE)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
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
				joinMem = new vo_joinMem (
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

		return joinMem;
	}
	
	// 회원삭제 기능
	public void deleteMember(vo_joinMem del) {
		String sql = "DELETE FROM NATIONALLIBRARY WHERE NAME01 = ? AND ID = ?"
				+ " AND PASS = ? AND EMAIL = ? AND ADDRESS = ? AND PHONENUMBER = ? "
				+ " AND GENDER = ? AND MEMTYPE = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, del.getName01());
			pstmt.setString(2, del.getId());
			pstmt.setString(3, del.getPass());
			pstmt.setString(4, del.getEmail());
			pstmt.setString(5, del.getAddress());
			pstmt.setString(6, del.getPhonenumber());
			pstmt.setString(7, del.getGender());
			pstmt.setString(8, del.getMemtype());
			int delmem = pstmt.executeUpdate();
			con.commit(); // 입력시 확정
			pstmt.close();
			con.close();
			if (delmem > 0) {
				System.out.println("삭제성공");
			} else {
			    System.out.println("삭제실패: 해당 회원을 찾을 수 없습니다.");
			}
		} catch (SQLException e) {
			System.out.println("DB:" + e.getMessage());
			try {
				con.rollback(); // 원복 처리..
			} catch (SQLException e1) {
				System.out.println(e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
	// 로그인 기능
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

	public static void main(String[] args) {
		joinMem_DB_con dao = new joinMem_DB_con();
	}

}