package backendWeb.a01_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A09_AjaxController
 */
@WebServlet(name = "prod.do", urlPatterns = { "/prod.do" })
public class A09_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A09_AjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// 1. 요청값
		String prd = request.getParameter("product");
		if(prd == null) prd = "없네요";
				
		// 2. 모델 데이터
		
		// 3. 화면호출
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
		response.getWriter().print("안녕하세요!! 데이터 출력 가격: " + prd);
		
		// A10_AjaxController.java
		// private String mname;
		// private String singer;
		
	}

}
