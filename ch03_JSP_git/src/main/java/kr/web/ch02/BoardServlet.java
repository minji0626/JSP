package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		/*
		 * [실습]
		 * name, title, content 를 전달 받아서 아래와 같이 출력하세요
		 * [출력 예시]
		 * 이름 : 홍길동
		 * 제목 : 봄봄봄
		 * 내용 : 무더위 시작
		*/
		
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		
		
		PrintWriter out = response.getWriter();
		 out.println("<html>");
		 out.println("<head><title></title></head>");
		 out.println("<body>");
		 out.println("이름 : " + name + "<br>");
		 out.println("제목 : " + title + "<br>");
		 out.println("내용 : " + content + "<br>");
		 out.println("</body>");
		 out.println("</html>");
	}
}
