package backendWeb.a01_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import backendWeb.z01_vo.Music;

/**
 * Servlet implementation class A10_AjaxController
 */
@WebServlet(name = "music.do", urlPatterns = { "/music.do" })
public class A10_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A10_AjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mname = request.getParameter("mname");
		String singer = request.getParameter("singer");
		String pubyearS = request.getParameter("pubyear");
		if(mname == null) mname = "";
		if(singer == null) singer = "";
		
		int pubyear = 0;
		if(pubyearS != null &&!pubyearS.equals("")) 
			pubyear = Integer.parseInt(pubyearS);
		
		Music m = new Music(mname, singer, pubyear);
		Gson g = new Gson();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
		response.getWriter().print(g.toJson(m));
			
			
		
	}

}
