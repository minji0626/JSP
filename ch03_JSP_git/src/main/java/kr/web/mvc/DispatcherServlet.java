package kr.web.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet(name = "DispatcherServlet", urlPatterns = {"/dispatcher"})*/
public class DispatcherServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String message = request.getParameter("message");
		String result = null;
		if (message == null || message.equals("")) {
			result = "메세지가 없습니다.";
		} else if (message.equals("name")) {
			result = "홍길동";
		} else if (message.equals("base")) {
			result="기본 호출입니다.";
		} else {
			result = "잘못된 호출입니다.";
		}
						//	 속성명	   속성값
		request.setAttribute("result",result );
		
		//forward 방식으로 view(messageView.jsp) 호출하기
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/messageView.jsp");
		dispatcher.forward(request, response);
	}

}
