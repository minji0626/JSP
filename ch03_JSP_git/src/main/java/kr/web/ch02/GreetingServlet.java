package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting")
public class GreetingServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 

		response.setContentType("text/html;charset=utf-8");
		
//		post 방식으로 데이터를 전송할 경우 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Greeting</title></head");
		out.println("<body>");
		out.println(name + "님의 방문을 환영합니다.");
		out.println("</body>");
		out.println("</html>");
		  
		out.close();
	}

}