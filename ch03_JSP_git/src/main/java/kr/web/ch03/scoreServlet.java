package kr.web.ch03;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/score")
public class scoreServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		성적 처리
//		국어, 영어, 수학, 총점, 평균, 등급 출력하기
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		int kor = Integer.parseInt(request.getParameter("korean"));  // 국어 성적
		int eng = Integer.parseInt(request.getParameter("english")); // 영어 성적
		int math = Integer.parseInt(request.getParameter("math"));   // 수학 성적
		int sum = kor + eng + math ;	// 총점
		int avg = sum / 3;		// 평균
		char grade;				// 등급
		switch (avg / 10) {
		case 10:
		case 9:
			grade = 'A';
			break;
		case 8 :
			grade = 'B';
			break;
		case 7 :
			grade = 'C';
			break;
		case 6 :
			grade = 'D';
			break;
		default:
			grade = 'F';
		}
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>성적 출력</title></head>");
		out.println("<body>");
		out.println("국어 : " + kor+ "<br>");
		out.println("영어 : " + eng + "<br>");
		out.println("수학 : " + math + "<br>");
		out.println("총점 : " + sum + "<br>");
		out.println("평균 : " + avg + "<br>");
		out.println("등급 : " + grade + "<br>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		  
	}
}
