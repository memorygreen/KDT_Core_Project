package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public @ResponseBody Member findDuplicate(@RequestParam("user_id") String user_id) {
		System.out.println("아이디 체크" + user_id);

		Member info = mapper.findDuplicate(user_id);

		System.out.println(info);

		return info;
	}

	@RequestMapping("/login.do")
	public String login(Member vo, HttpSession session) {

		Member info = mapper.login(vo);

		if (info != null) {
//			if(pwEnc.matches(vo.getPw(), info.getPw())){

			session.setAttribute("info", info);

			System.out.println("로그인성공");
			return "redirect:/ProductList.do";

		} else {
			System.out.println("로그인 실패");
			return "redirect:/login.do";

		}
	}

	// 자영 : 로그아웃 기능 (2024.03.29)
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 성공");
		session.invalidate(); // 세션 종료하여 로그아웃
		return "redirect:/ProductList.do"; // 메인화면으로 이동
	}

	// 자영 : 마이페이지로 이동 (2024.03.29)
	@RequestMapping("/myPage.do")
	public String myPage() {
		System.out.println("MemberController에서 마이페이지 화면 이동");
		return "myPage";
	}

	@RequestMapping("/goSchoolCheck.do")
	public String goSchoolCheck() {
		return "SchoolCheck";
	}

	@RequestMapping("/UpdateSchoolInfo.do")
	public String InsertSchoolInfo(HttpServletRequest request, HttpSession session) {

		MultipartRequest multi = null;

		int fileMaxSize = 10 * 1024 * 10000;
		String savePath =  request.getRealPath("resources/ID");
		System.out.println(savePath);

		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (multi == null) {
			System.out.println("오류");
		}

		Member info = (Member) session.getAttribute("info");
		String user_id = info.getUser_id();
		String user_sc_nm = multi.getParameter("user_sc_nm");
		String user_sc_img = multi.getFilesystemName("user_sc_img");

		Member vo = new Member();
		vo.setUser_id(user_id);
		vo.setUser_sc_nm(user_sc_nm);
		vo.setUser_sc_img(user_sc_img);

		System.out.println(vo.toString());// test용

		mapper.UpdateSchoolInfo(vo);

		return "myPage";
	}
	
	// 관리자 페이지
		@RequestMapping("/AdministratorList.do")
		public String AdministratorList(Model model) {
			System.out.println("관리자 페이지");
		List<Member> list = mapper.AdministratorList();
			model.addAttribute("list",list);
			
			return"AdministratorList";
		}
		
		// 지훈 : 회원 전체 조회하기
				@RequestMapping("/UserInformation.do")
					public String UserInformation(Model model) {
						System.out.println("회원조회 페이지");
						List<Member> list = mapper.UserInformation();
						model.addAttribute("list",list);
							
							return"UserInformation";
						}
				
				// 지훈 : 회원정보 수정하는 페이지로 이동
				@RequestMapping("/UserContent.do")
				public String UserContent(@RequestParam("user_id") String user_id, Model model) {
					System.out.println("회원 수정 페이지");
					Member vo =mapper.UserContent(user_id);
					model.addAttribute("vo",vo);
					return "UserContent";
				}
				
				
				// 지훈 : 회원 정보 수정하는 기능!!
						@RequestMapping("/userInfoChange.do")
						public String userInfoChange(Member vo) {
							System.out.println("회원 수정 버튼 클릭");		
							mapper.userInfoChange(vo);
							return "redirect:/UserContent.do?user_id=" + vo.getUser_id();
				}
				// 지훈 : 회원 정보 수정 페이지
						@RequestMapping("/PostContent.do")
						public String PostContent(@RequestParam("user_id") String user_id, Model model) {
							System.out.println("회원 수정 페이지");
							Member vo =mapper.PostContent(user_id);
							model.addAttribute("vo",vo);
							return "PostContent";
				}
}
