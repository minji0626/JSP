

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/num")
public class numServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
//		실습
//		전송된 정수 값이 짝수이면 짝수입니다. 홀수이면 홀수입니다 라고 출력
		
		response.setContentType("text/html;charset=utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>홀/짝 구분하기</title></head>");
		out.println("<body>");
		out.println(num);
		if(num % 2 == 0) {
			out.println(" = 짝수입니다.");
		}else {
			out.println(" = 홀수입니다.");
		}
		out.println("</body>");
		out.println("</html>");
		
	}
}
