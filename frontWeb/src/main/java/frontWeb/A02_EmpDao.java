package frontWeb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import frontWeb.vo.Emp;
import frontWeb.vo.Job;
import frontWeb.vo.Location;

public class A02_EmpDao {
	// 1. 필드선언(핵심 내장 객체)
	// 1) 연결 - 서버연결
	private Connection con;
	// 2) 대화 - 명령/입력
	private Statement stmt;
	// 3) 결과 - 데이터를 가져오는 것
	private ResultSet rs;

	// 2. 기능 메서드 선언..
	// 1) 사원 전체 정보 출력..
	public void empListAll() {
		// # 전체적으로 예외 처리.
		// 연결
		try {
			con = DB.con();
			// 대화할 내용
			String sql = "SELECT * FROM emp02";
			// 대화할 수 있는 객체는 연결(con)에 의해 생성
			stmt = con.createStatement();
			// 결과(ResultSet)
			// Statement객체가 가지고 있는 executeQuery()
			// 메서드를 통해서 ResultSet객체를 생성..
			rs = stmt.executeQuery(sql);
			int row = 1;
			while (rs.next()) { // 행단위로 이동 다음 행이 없을 떄까지
				System.out.print("행번호:" + row++);
				System.out.print("\t" + rs.getInt("empno"));
				System.out.print("\t" + rs.getString("ename"));
				System.out.print("\t" + rs.getString("job"));
				System.out.print("\t" + rs.getInt("mgr"));
				System.out.print("\t" + rs.getDate("hiredate"));
				System.out.print("\t" + rs.getDouble("sal"));
				System.out.print("\t" + rs.getDouble("comm"));
				System.out.println("\t" + rs.getInt("deptno"));
				// ex) 사원명과 관리자번호, 급여 출력해보세요
			}
			/*
			 * rs.next() : 반복을 통해서 행단위로 커서를 위치시키는 다음 행이 데이터가 없으면 false 있으면 true
			 * while(rs.next()){ // 다음 행이 없을 때까지 반복 System.out.println(cnt++) }
			 * rs.get데이터유형("컬럼명")
			 * 
			 */


		} catch (SQLException e) {
			System.out.println("DB 처리 예외:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("공통 예외:" + e.getMessage());
		} finally {
			// 해제되지 않은 자원해제 처리..
			DB.close(rs, stmt, con);
		}
	}
	// 12:05~
	public void paramEmp(String ename) {
		System.out.println("메서드 호출!");
		String sql = "	SELECT * \r\n"
				+ "	FROM EMP02\r\n"
				+ "	WHERE ename LIKE '%'||'"+ename+"'||'%'";
		System.out.println("매개변수:"+ename);
		System.out.println("sql:"+sql);
		try {
			// 1. 연결(예외처리)
			con = DB.con();
			
			System.out.println("처리1");
			// 2. 대화
			stmt = con.createStatement();
			System.out.println("처리2");
			// 3. 결과
			rs = stmt.executeQuery(sql);
			System.out.println("처리3");
			while(rs.next()) { // 행단위 이동 커서
				// 열단위 호출 rs.get유형("컬럼명")
				System.out.print(rs.getInt("empno")+"\t");
				System.out.print(rs.getString("ename")+"\t");
				System.out.print(rs.getDouble("sal")+"\n");
				System.out.println("처리4");
			}

			System.out.println("처리5");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		

	}
	// 입력값을 부서 번호, 리턴할 값은 해당 부서의 사원수
	public int getDeptCount(int deptno) {
		int count = 0;
		String sql = "SELECT count(*) cnt \r\n"
				+ "FROM emp02\r\n"
				+ "WHERE deptno = "+deptno;
		try {
			// 1. 연결(예외처리)
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			// 데이터가 한개만 나오는 경우(row단위)
			if(rs.next()) count = rs.getInt("cnt");

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		} finally {
			// 자원해제
			DB.close(rs, stmt, con);
		}		
		return count;
	}
	// 사원번호의 급여를 리턴하는 메서드 선언.
	public double getEmpnoSal(int empno) {
		double sal = 0;
		String sql = "SELECT sal\r\n"
				+ "FROM emp02\r\n"
				+ "WHERE empno = "+empno;
		
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("DB 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
		return sal;
	}
	public Emp getEmp(int empno) {
		Emp emp =null;
		String sql = "select *\r\n"
				+ "from emp02\r\n"
				+ "where empno =  "+empno;
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) { // 한번함 호출
				// empno 키이기에.. 
				// select * 의 순서대로 컬럼, 순서를 사용
				emp = new Emp(
					rs.getInt("empno"),
					rs.getString(2),
					rs.getString(3),
					rs.getInt("mgr"),
					rs.getDate(5),
					rs.getDouble("sal"),
					rs.getDouble("comm"),
					rs.getInt(8)
				);
			}
		} catch (SQLException e) {
			System.out.println("DB 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}		
		
		
		return emp;
	}
	// ex) A03_DeptDao.java  
//	   select * from dept01 where deptno=10
	// 부서번호별로 부서정보 가져오기 처리
	/*
	ex) SELECT * 
		FROM jobs
		WHERE JOB_ID = 'AD_PRES'
	 * */
	public Job getJob(String id) {
		Job job=null;
		String sql = "SELECT * \r\n"
				+ "		FROM jobs\r\n"
				+ "		WHERE JOB_ID = '"+id+"'";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) { //
				job = new Job(
					rs.getString(1),	
					rs.getString(2),	
					rs.getInt(3),	
					rs.getInt(4)	
				);
			}
		} catch (SQLException e) {
			System.out.println("DB 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}			
		
		return job;
	}
	public List<Emp> getEmpList(Emp sch){
		List<Emp> elist = new ArrayList<Emp>();
		String sql = "	select *\r\n"
				+ "	from emp02\r\n"
				+ "	where ename like '%'||'"+sch.getEname()+"'||'%'\r\n"
				+ "	AND job like '%'||'"+sch.getJob()+"'||'%'";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) { 
				elist.add(new Emp(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getInt(4),
							rs.getDate(5),
							rs.getDouble(6),
							rs.getDouble(7),
							rs.getInt(8)
						));
			}
		} catch (SQLException e) {
			System.out.println("DB 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}			
		
		return elist;
	}
	public List<Location> getLocations(Location sch){
		List<Location> loList = new ArrayList<Location>();
		String sql = "SELECT * \r\n"
				+ "FROM LOCATIONS\r\n"
				+ "WHERE STREET_ADDRESS like '%'||'"+sch.getStreet_address()+"'||'%'\r\n"
				+ "AND city like '%'||'"+sch.getCity()+"'||'%' ";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) { 
				loList.add(new Location(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6)
						));
			}
		} catch (SQLException e) {
			System.out.println("DB 예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 예외:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}		
		
		
		return loList;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_EmpDao dao = new A02_EmpDao();
		for(Location l:dao.getLocations(new Location("",""))) {
			System.out.print(l.getLocation_id()+"\t");
			System.out.print(l.getCity()+"\t");
			System.out.print(l.getCountry_id()+"\t");
			System.out.print(l.getPostal_code()+"\t");
			System.out.print(l.getState_province()+"\t");
			System.out.print(l.getStreet_address()+"\n");
		}
		
		
//		for(Emp e:dao.getEmpList(new Emp("A","A"))) {
//			System.out.print(e.getEmpno()+"\t");
//			System.out.print(e.getEname()+"\t");
//			System.out.print(e.getJob()+"\t");
//			System.out.print(e.getSal()+"\n");
//		}
//		Job job = dao.getJob("AD_PRES");
//		System.out.println(job.getJob_id());
//		System.out.println(job.getJob_title());
//		System.out.println(job.getMax_salary());
//		System.out.println(job.getMin_salary());
//		dao.empListAll();
////		System.out.println("급여:"+dao.getEmpnoSal(7499));
//		Emp e = dao.getEmp(7499);
//		System.out.println("사원번호 7499");
//		System.out.println(e.getEname());
//		System.out.println(e.getJob());
//		System.out.println(e.getDeptno());
//		System.out.println("30번 부서의 사원건수:"+
//				dao.getDeptCount(30));
//		Scanner sc = new Scanner(System.in);
//		System.out.print("검색할 사원명을 입력하세요:");
//		String schEname = sc.nextLine();
//		dao.paramEmp(schEname); // 변수가 아닌 문자열..
//		Scanner sc = new Scanner(System.in);
//		System.out.print("확인할 부서번호 입력하세요:");
//		int deptno = sc.nextInt();
//		System.out.println(deptno+"번 부서의 사원건수:"+
//		dao.getDeptCount(deptno));
	}

}
