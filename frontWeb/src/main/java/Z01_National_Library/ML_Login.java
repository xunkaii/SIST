package Z01_National_Library;

import java.util.Scanner;

import Z01_National_Library.vo.vo_joinMem;

	public class ML_Login {
		private joinMem_DB_con dao;

	public ML_Login() {
		dao = new joinMem_DB_con();
	}
	// 로그인 콘솔창 기능
	public void loginMenu() {
		joinMem_DB_con dao = new joinMem_DB_con();
		Scanner sc = new Scanner(System.in);
		System.out.println("# 로그인 #");
		while (true) {
			System.out.print("아이디: ");
			String id = sc.nextLine();
			System.out.print("비밀번호: ");
			String pass = sc.nextLine();
			vo_joinMem mem = dao.login(id, pass);
			if (mem != null) {
				System.out.println("로그인 성공");
				System.out.println(mem.getName01() + "님 환영합니다");
				break;
			} else {
				System.out.println("로그인 실패");
				System.out.println(id + "은 등록된 회원이 아닙니다");
				System.out.println("아이디를 다시 입력하세요");
			}
		}
		System.out.println("로그인 프로그램 종료");
	}

	public static void main(String[] args) {
		ML_Login ML = new ML_Login();
		ML.loginMenu();
	}

}
