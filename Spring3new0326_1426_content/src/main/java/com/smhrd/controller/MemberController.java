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

		// 회원가입 기능
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
		
		// 회원가입 화면으로 이동
		@RequestMapping("/goJoin.do")
		public String goJoin() {
			return "join"; 
		} 
		
		// 로그인 화면으로 이동
		@RequestMapping("/goLogin.do")
		public String goLogin() {
			return "login"; 
		}
		
		// id 중복체크 
		@RequestMapping("/findDuplicate.do")
		public void findDuplicate(@RequestParam("user_id") String user_id) {
			System.out.println("아이디 체크" + user_id);
			
			mapper.findDuplicate(user_id);
			
		}
		
		// 로그인 기능
		@RequestMapping("/login.do")
		public String login(Member vo, HttpSession session) {
		
		Member info = mapper.login(vo);
		
		if(info != null && !info.getUser_status().equals("탈퇴")) { //자영 2024.04.01 16:46 추가 (탈퇴기능 만들면서)
			
//			if(pwEnc.matches(vo.getPw(), info.getPw())){
			
			// jsp에서 type이 password라서 encoding을 해줘야 오류가 안뜰듯
			session.setAttribute("info", info);
			
			System.out.println(info.getUser_id() + "님 로그인성공");
			return "redirect:/ProductList.do";
			
		}else {
			System.out.println("로그인 실패");
			return "redirect:/login.do";
			
		}
	}
		
		//자영 : 로그아웃 기능 (2024.03.29)
		@RequestMapping("/logout.do")
		public String logout(HttpSession session) {
			System.out.println("로그아웃 성공 ");
			session.invalidate(); //세션 종료하여 로그아웃
		    return "redirect:/ProductList.do"; // 메인화면으로 이동
		}
	
		//자영 : 마이페이지로 이동 (2024.03.29)
		@RequestMapping("/myPage.do")
		public String myPage() {
			System.out.println("MemberController에서 마이페이지 화면 이동");
			return "myPage";
		}
		
		
		//회원탈퇴 폼으로 이동(자영)
		@RequestMapping("/goMemberOutForm.do")
		public String goMemberOutForm(@RequestParam("user_id") String user_id) {
			System.out.println("회원탈퇴 창으로 이동 ");
			// 민감정보 post로 받자!!!! 
			return "memberOutForm"; //회원 탈퇴창 이름을 반환
		}
		
		//회원탈퇴 기능(자영)
		@RequestMapping("/memberOut.do")
		public String memberOut(HttpSession session) {
			System.out.println("회원탈퇴 기능");
			Member loginUser = (Member) session.getAttribute("info"); //session에서 로그인한 회원의 정보를 loginUser 라는 Member 데이터타입 변수 loginUser에 넣기
			String user_id = loginUser.getUser_id();  //user_id 라는 변수에 세션에 담긴 로그인한 회원의 id 가져오기
			mapper.memberOut(user_id); //세션에 저장된 user_id 를 매개변수로 업데이트문(회원상태 '탈퇴'로 변경하는 update문 호출)
			System.out.println(user_id + "님 회원상태 탈퇴로 변경 완료!!");
			session.invalidate(); //세션 종료하여 로그아웃
			
			// 민감정보 post로 받자!!!! 
			return "redirect:/ProductList.do"; //회원 탈퇴창 이름을 반환
		}
		
}

