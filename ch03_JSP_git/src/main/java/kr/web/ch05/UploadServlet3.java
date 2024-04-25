package kr.web.ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5,
		maxRequestSize = 1024 * 1024 * 50
		)
@WebServlet("/profile")
public class UploadServlet3 extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		컨텍스트 경로상의 파일 업로드 절대 경로 구하기
		String realFolder = request.getServletContext().getRealPath("/upload");
		
//		문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
//		Post 방식으로 전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("UTF-8");
//		HTML 출력을 위한 출력 스트림을 생성
		PrintWriter out = response.getWriter();
		try {
			Part part = request.getPart("file");
			String fileName = part.getSubmittedFileName();
			if(!fileName.isEmpty()) {
				part.write(realFolder + "/" + fileName);
				request.setAttribute("fileName", fileName);
			}
//			s04_profile.jsp로 forward
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ch09_fileupload/s04_profile.jsp");
			dispatcher.forward(request, response);
		} catch(IllegalStateException e){	// 용량이 초과 되었을 때 해당 문구 출력
			out.println("용량 초과 : " + e.toString());
		}
	}

}
