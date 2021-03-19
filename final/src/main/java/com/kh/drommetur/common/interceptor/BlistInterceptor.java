package com.kh.drommetur.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.drommetur.member.model.vo.Member;

public class BlistInterceptor extends HandlerInterceptorAdapter{

	private Logger log = LoggerFactory.getLogger(BlistInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			log.info("비로그인 상태에서 [" + request.getRequestURI() + "] 접근하려고 합니다.");
			
			request.setAttribute("msg", "로그인후 이용하세요");
			request.getRequestDispatcher("WEB-INF/views/main.jsp").forward(request, response);
			
			return false; // false를 반환해줘야 controller 실행 안함.
		}else {
			return super.preHandle(request, response, handler);
		}
	}
	
	
}
