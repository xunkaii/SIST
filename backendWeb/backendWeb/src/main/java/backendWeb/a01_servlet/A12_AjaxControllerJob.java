package backendWeb.a01_servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import backendWeb.a01_dao.A04_PreparedDao;
import backendWeb.z01_vo.Job;

/**
 * Servlet implementation class A12_AjaxControllerJob
 */
@WebServlet(name = "job.do", urlPatterns = { "/job.do" })
public class A12_AjaxControllerJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A12_AjaxControllerJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// List까지 처리하고 
		// 1. 요청값처리
		String job_id = request.getParameter("job_id");
		if(job_id==null) job_id="";
		
		// 2. model 핵심데이터 처리
		A04_PreparedDao dao = new A04_PreparedDao();
		List<Job> jlist = dao.getJobs(job_id);
		
		// 3. view 호출
		Gson gson = new Gson();
		response.getWriter().print(gson.toJson(jlist));
		
		
	}

}
