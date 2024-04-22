package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/todayMenu")
public class todayMenu extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<head><title>점심 메뉴</title></head>");
		out.println("<body>");
		out.println("<h3>오늘의 점심은</h3>");

		String[] menus = request.getParameterValues("lunch");
		if (menus != null) { // 전송된 데이터가 있는 경우에는 for문을 통하여 반복
			for (int i = 0; i < menus.length; i++) {
				out.println(menus[i] + "<br>");
			}
		} else { // 전송된 데이터가 없는 경우
			out.println("선택한 점심 메뉴가 없습니다.");		
		}
		
		out.println("</body>");
		out.println("</html>");

		out.close();
	}

}
