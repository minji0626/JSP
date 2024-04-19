package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		
//		실습
//		두 개의 숫자 전송되면 전송된 두 개의 숫자를 더해서 결과를 구하시오
//		출력 예시
//		5 + 2 = 7
		
		response.setContentType("text/html;charset=utf-8");
		
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int sum = num1 + num2;
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>덧셈하기</title></head>");
		out.println("<body>");
		out.println(num1 + " + " + num2 + " = " + sum);
		out.println("</body>");
		out.println("</html>");
	
		out.close();
	}
}
