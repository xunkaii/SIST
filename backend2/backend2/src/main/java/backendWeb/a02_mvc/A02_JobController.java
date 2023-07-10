package backendWeb.a02_mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backendWeb.a01_dao.A04_PreparedDao;

/**
 * Servlet implementation class A02_JobController
 */
@WebServlet(name = "jobList.do", urlPatterns = { "/jobList.do" })
public class A02_JobController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_JobController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// backendWeb.a01_dao.A04_PreparedDao
		// title, min_sal1, min_sal2
		// job_id, job_title, min_salary, max_salary
		
		String title = request.getParameter("title");
		if(title == null) title = "";
		String min_sal1 = request.getParameter("min_sal1");
		if(min_sal1== null || min_sal1.equals("")) min_sal1 = "0";
		String min_sal2 = request.getParameter("min_sal2");
		if(min_sal2== null || min_sal2.equals("")) min_sal2 = "999999";
		Map<String, String> sch = new HashMap<String, String>();
		sch.put("title", title);
		sch.put("min_sal1", min_sal1);
		sch.put("min_sal2", min_sal2);
		
		// 2. 모델 데이터
		A04_PreparedDao dao = new A04_PreparedDao();
		request.setAttribute("jobList", dao.getJob(sch));
		
		// 3. view단
		String page = "a11_jobListSch.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		// backendWeb.a01_dao.A05_MemberDao의  List<Member> mlist() 메서드를 이용하여, MVC패턴으로 회원정보를 출력하세요.
		

		
	}

}
