package frontWeb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import frontWeb.vo.Dept;

public class A03_DeptDao {
	// 부서정보 처리 dao
	// 1. 공통 필드 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
	public void showDeptList() {
		// 2. 연결(예외처리)
		try {
			con = DB2.con();
			// 3. 대화처리
			
			String sql = "select * from dept01";
			stmt = con.createStatement();
			// 4. 실행결과
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
			}
			// 5. 자원해제
			rs.close();
			stmt.close();
			con.close();
						
		} catch (SQLException e) {
			System.out.println("DB처리 관련 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		} finally {
			// 자원이 남았을 때, 예외 처리..
			DB2.close(rs, stmt, con);
		}

	}
	public void deptDnameSch(String dname) {
		String sql = "SELECT *\r\n"
				+ "FROM DEPT01 d \r\n"
				+ "WHERE dname LIKE '%'||'"+dname+"'||'%'";
		// 1. 연결(예외)
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.println(rs.getString("loc")+"\t");
			}
		
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
	}
/*
//	   select * from dept01 where deptno=10
	// 부서번호별로 부서정보 가져오기 처리
*/	
	public Dept getDept(int deptno) {
		Dept d=null;
		String sql = "select * \r\n"
				+ "from dept01 \r\n"
				+ "where deptno="+deptno;
		// 1. 연결(예외)
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				d = new Dept(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3)
				);
			}
		
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}		
		
		return d;
	}
	// 15:05~
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A03_DeptDao dao = new A03_DeptDao();
		dao.showDeptList();
		Dept d = dao.getDept(30);
		System.out.println(d.getDname());
		System.out.println(d.getLoc());
//		//dao.deptDnameSch("A");
//		Scanner sc = new Scanner(System.in);
//		System.out.print("검색할 사원명:");
//		dao.deptDnameSch(sc.nextLine());
	}

}
