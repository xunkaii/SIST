package Z01_National_Library;

import java.util.Scanner;
import java.util.regex.Pattern;

import Z01_National_Library.vo.vo_joinMem;

public class ML_JoinMembership {
	private joinMem_DB_con dao;

	public ML_JoinMembership() {
		dao = new joinMem_DB_con();
	}
	
	// 비밀번호 유효성 체크 
	public boolean PassValid(String pass) {
		 String pattern = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,16}$";
		 return pass.matches(pattern);
	}
	
	public void joinMenu() {
		joinMem_DB_con dao = new joinMem_DB_con();
		Scanner sc = new Scanner(System.in);
		String pass = "";
		String pass02 = "";
		System.out.println("# 회원가입 #");
		while (true) {
			// 이름 입력
			System.out.print("* 이름을 입력하세요: ");
			String name01 = sc.nextLine();

			// 아이디 입력
			System.out.print("* 아이디: ");
			String id = sc.nextLine();
			
			// 비밀번호 입력
			while(true) {
				System.out.print("* 비밀번호: ");
				pass = sc.nextLine();
				if(PassValid(pass)) {
					System.out.println("비밀번호 형식이 맞습니다");
					break;
				} else {
					System.out.println(" ## 비밀번호 형식이 맞지 않습니다 \n 다시 입력하세요!");
				}
			}
			// 비밀번호 확인
			while (true) {
				System.out.print("* 비밀번호 확인: ");
				pass02 = sc.nextLine();
				if (pass.equals(pass02)) {
					System.out.println("비밀번호가 동일합니다");
					break;
				} else {
					System.out.println("비밀번호가 일치하지 않습니다\n" + "다시 입력하세요");
				}
			}

			// 이메일
			System.out.print("* 이메일: ");
			String email = sc.nextLine();

			// 주소
			System.out.print("* 주소: ");
			String address = sc.nextLine();

			// 연락처 
			System.out.print("* 연락처: ");
			String phonenumber = sc.nextLine();

			// 인증번호 전송 기능
			int certinum = (int) (Math.random() * 999999 + 100000);

			// 인증번호 문자열 변환
			String certinum02 = String.valueOf(certinum);

			// 인증번호 입력
			System.out.print("인증번호: " + certinum + "\n인증번호를 입력하세요: ");
			String vericode = sc.nextLine();
			if (certinum02.equals(vericode)) {
				System.out.println("인증완료!");
			} else {
				System.out.println("다시 입력하세요");
			}

			// 성별
			System.out.print("성별: ");
			String gender = sc.nextLine();

			// 회원유형
			System.out.print("* 회원유형:\t일반회원\t공무원\t 공공기관(일부 정부부처 포함)\n");
			String memtype = sc.nextLine();

			vo_joinMem jom = new vo_joinMem(name01, id, pass, email, address, phonenumber, gender, memtype);
			dao.insertMember(jom);
			if (jom != null) {
				System.out.println("회원가입 성공");
				System.out.println(jom.getName01() + "님 회원가입을 축하드립니다");
				break;
			} else {
				System.out.println("회원가입 실패");
			}
		}
		// 회원가입 완료
		System.out.println("회원가입 프로그램 종료");
	}

	public static void main(String[] args) {
		ML_JoinMembership MJ = new ML_JoinMembership();
		MJ.joinMenu();
	}

}
