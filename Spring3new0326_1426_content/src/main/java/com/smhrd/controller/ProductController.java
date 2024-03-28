package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.support.ServletContextScope;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Product;
import com.smhrd.entity.Reply;
import com.smhrd.mapper.ProductMapper;

@Controller
public class ProductController {
	
	
	
	@Autowired
	private ProductMapper mapper;
	
	
	// '/'를 입력하면 ProductList.do 로 이동하도록 함(상품목록을 메인화면으로 설정)
	@RequestMapping("/")
	public String home() {
		return "redirect:/ProductList.do";
		
	}
	
	
	
	@RequestMapping("/ProductList.do")
	public List<Product> ProductList(Model model, HttpSession session){
		System.out.println("상품 전체보기 기능new");
		List<Product> prod_list = mapper.ProductList();
//		model.addAttribute("prod_list", prod_list); //request
		session.setAttribute("prod_list", prod_list); //어차피 서버에 저장돼서 세션에 저장하는게 의미가 없을 듯 
		
		
		//System.out.println(prod_list);// 확인용
		return prod_list;
		
	}
	
	@RequestMapping("/ProductForm.do")
	public String ProductForm() {
		System.out.println("게시글 쓰기 페이지 이동 기능");
		return "ProductForm";
	}
	
	
	@RequestMapping("/ProductInsert.do")
	public String ProductInsert(HttpServletRequest request) {
	    
			System.out.println("게시글 입력 기능");
			
			//파일을 서버 폴더에 저장하는 객체	
			MultipartRequest multi = null;
			
			int fileMaxSize = 10 * 1024 * 10000; //파일크기
			String savePath = request.getRealPath("resources/board"); //저장경로
			System.out.println(savePath);
			
			try {
				multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
				//요청정보가진 request, 저장경로, 파일최대크기, 인코딩, 중복처리(파일명 같을 시 뒤에 숫자붙여주는 객체)
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String prod_name = multi.getParameter("prod_name");
			String prod_desc = multi.getParameter("prod_desc");
			String prod_img_path = multi.getFilesystemName("prod_img_path");
			String prod_price = multi.getParameter("prod_price");
			int prod_price_num = Integer.parseInt(prod_price);
			
			Product prod = new Product();

			prod.setProd_name(prod_name);
			prod.setProd_desc(prod_desc);
			prod.setProd_img_path(prod_img_path);
			prod.setProd_price(prod_price_num); //자영(0325):가격은 정수니까 문자열->정수 형변환 
			
			//vo.setWriter(writer);
			
			System.out.println(prod.toString());//test용
			
			mapper.ProductInsert(prod);	
			
			//return "boardList";
			return "redirect:/ProductList.do";
		
	}
	
	
	@RequestMapping("/ProductContent.do")
	public String ProductContent(@RequestParam("prod_idx") int prod_idx, Model model) {
		System.out.println("게시글 상세보기 기능");
		
		// 게시글 조회수 1 올리는 기능 
		mapper.ProductCount(prod_idx);
		
		//prod변수에 해당 상품번호의 정보를 담기(상품1개 정보)
		Product prod = mapper.ProductContent(prod_idx);
		
		// model에 상품1개의 정보 담기
		model.addAttribute("prod", prod); //상품1개 상세보기
		
		//ProductContent jsp(상품 상세보기 화면)로 보내주기
		return "ProductContent";
		
	}
	
	// (내가 등록한 상품일 경우) 판매중인 상품의 상태를 거래완료로 바꾸는 기능
	@RequestMapping("/productStatusChange.do")
	public String productStatusChange(@RequestParam("prod_idx") int prod_idx, Model model) {
		System.out.println("상품 게시글 상태 변경(판매중->거래완료)");
		mapper.productStatusChange(prod_idx);
		Product prod = mapper.ProductContent(prod_idx); // 업데이트 된 정보를 조회하기
		model.addAttribute("prod", prod); //업데이트 된 정보를 담은 prod를 model에 담기
		return "ProductContent";
	}
	
	

	
	
	
}
