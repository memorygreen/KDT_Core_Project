package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Board;
import com.smhrd.entity.Product;
import com.smhrd.entity.Reply;
import com.smhrd.mapper.BoardMapper;
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
	public List<Product> ProductList(Model model){
		System.out.println("상품 전체보기 기능new");
		List<Product> prod_list = mapper.ProductList();
		model.addAttribute("prod_list", prod_list);

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
	public String boardContent(@RequestParam("prod_idx") int prod_idx, Model model) {
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
	
	
	

	
	
	
}
