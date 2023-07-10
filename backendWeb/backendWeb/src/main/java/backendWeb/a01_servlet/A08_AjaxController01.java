package backendWeb.a01_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A08_AjaxController01
 */
@WebServlet(name = "prodCalcu.do", urlPatterns = { "/prodCalcu.do" })
public class A08_AjaxController01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A08_AjaxController01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ex) A09_AjaxController
		// 요청값 : 물건명을 넘기고, 화면 구매한 물건 :  @@@ 요청값이 없으면 없네요 라고 출력
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// 1. 요청값
		String price = request.getParameter("price");
		if(price == null || price.equals("")) price = "0";
		
		String cnt = request.getParameter("cnt");
		if(cnt == null || cnt.equals("")) cnt = "0";
		
		int tot = Integer.parseInt(price) * Integer.parseInt(cnt);
		// 2. 모델데이터
		
		// 3. 화면호출(jsp/json출력)
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
		response.getWriter().print("합산은: " + tot);
	}

}
