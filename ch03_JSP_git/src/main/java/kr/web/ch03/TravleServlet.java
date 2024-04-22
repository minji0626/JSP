package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/travel")
public class TravleServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<head><title>여행지</title></head>");
		out.println("<body>");
		out.println("<h3>여행지 선택</h3>");
//		String name = request.getParameter("name");
		out.println("이름 : "+request.getParameter("name")+"<br>");
		out.println("여행지 : ");
		
		String[] city = request.getParameterValues("city");
		if (city != null) { // 여행지를 선택한 경우
			for (int i = 0; i < city.length; i++) {
				out.println(city[i]);
				if (i < city.length-1)
					out.println(", ");
			}
		} else { // 여행지를 선택 안 한 경우
			out.println("선택된 여행지가 없습니다.");
		}
		out.println("</body>");
		out.println("</html>");

	}

}
