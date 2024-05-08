package kr.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailAction implements Action {

	@Override
	public String execute (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setAttribute("detail", "글 상세페이지를 불러오는데 성공하였습니다.");
		return "/views/detail.jsp";
	}

}
