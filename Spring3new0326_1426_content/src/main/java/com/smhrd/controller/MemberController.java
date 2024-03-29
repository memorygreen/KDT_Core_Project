package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Member;
import com.smhrd.mapper.MemberMapper;


@Controller
public class MemberController {
		
		@Autowired
		private MemberMapper mapper;
		
//		@Autowired
//		private PasswordEncoder pwEnc;

		
		@RequestMapping("/join.do")
		public String join(Member vo) {
							
			
//			MultipartRequest multi = null;
//			
//			int fileMaxSize = 10 * 1024 * 10000;
//			String savePath = request.getRealPath("resources/board");
//			System.out.println(savePath);
//			
//			try {
//				multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			if (multi == null) {
//				System.out.println("오류");
//			}
//			
//			String id = multi.getParameter("id");
//			String pw = multi.getParameter("pw");
//			String phone= multi.getParameter("phone");
//			String scname= multi.getParameter("scname");
//			String imgpath= multi.getFilesystemName("imgpath");
//		
//			
//			Member vo = new Member();
//			vo.setId(id);
//			vo.setPw(pw);
//			vo.setPhone(phone);
//			vo.setScname(scname);
//			vo.setImgpath(imgpath);
//			
//			System.out.println(vo.toString());//test용
			
			mapper.join(vo);
			
			return "login";
			
			
		}
		
		@RequestMapping("/goJoin.do")
		public String goJoin() {
			return "join"; 
		} 
		
		@RequestMapping("/goLogin.do")
		public String goLogin() {
			return "login"; 
		}
		
		@RequestMapping("/findDuplicate.do")
		public void findDuplicate(@RequestParam("user_id") String user_id) {
			System.out.println("아이디 체크" + user_id);
			
			mapper.findDuplicate(user_id);
			
		}
		
		@RequestMapping("/login.do")
		public String login(Member vo, HttpSession session) {
		
		Member info = mapper.login(vo);
			
		if(info != null) {
//			if(pwEnc.matches(vo.getPw(), info.getPw())){
			
			// jsp에서 type이 password라서 encoding을 해줘야 오류가 안뜰듯
			session.setAttribute("info", info);
			
			System.out.println("로그인성공");
			return "redirect:/ProductList.do";
			
		}else {
			System.out.println("로그인 실패");
			return "redirect:/login.do";
			
		}
	}
		
		//로그아웃 기능 
		@RequestMapping("/logout.do")
		public String logout(HttpSession session) {
			System.out.println("로그아웃 성공 ");
			session.invalidate(); //세션 종료하여 로그아웃
		    return "redirect:/ProductList.do"; // 메인화면으로 이동
		}
	
		
		
		
}

