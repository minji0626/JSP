package kr.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 추상 메서드
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
