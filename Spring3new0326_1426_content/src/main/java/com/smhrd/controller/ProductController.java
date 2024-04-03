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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.support.ServletContextScope;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Member;
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
	
	
	// 상품 목록 조회 (전체, 조회수순, 최저가순, 댓글 많은 순) 
	@RequestMapping("/ProductList.do")
	public List<Product> ProductList(Model model, HttpSession session){
		
		// 상품 전체 보기(메인)
		System.out.println("상품 전체보기 기능new");
		List<Product> prod_list = mapper.ProductList();
//		model.addAttribute("prod_list", prod_list); //request
		session.setAttribute("prod_list", prod_list); //어차피 서버에 저장돼서 세션에 저장하는게 의미가 없을 듯 
		
		// 조회순 보기
		System.out.println("상품 조회수순 보기");
		List<Product> prod_views_list = mapper.ProductViewsList();
		session.setAttribute("prod_views_list", prod_views_list);  
		
		// 최저가순
		System.out.println("최저가순 보기");
		List<Product> prod_lowest_price_list = mapper.ProductLowestPriceList();
		session.setAttribute("prod_lowest_price_list", prod_lowest_price_list); 
				
		// 댓글 많은순 보기 
		System.out.println("상품 댓글 많은 순 보기");
		List<Product> prod_reply_list = mapper.ProductReplyList();
		session.setAttribute("prod_reply_list", prod_reply_list);
		
		
		//System.out.println(prod_list);// 확인용
		return prod_list;
		
	}
	
	
	
	@RequestMapping("/ProductForm.do")
	public String ProductForm() {
		System.out.println("게시글 쓰기 페이지 이동 기능");
		return "ProductForm";
	}
	
	
	
	// 자영추가(240401 19:21)
	
	@RequestMapping("/ProductInsert.do")
	public String ProductInsert(HttpServletRequest request, HttpSession session, Product prod) {
	    	
			System.out.println("게시글 입력 기능");
			
			//세션에 입력된 로그인한 회원 확인
			System.out.println("로그인 여부 확인(세션 값 확인하기");
			Member loginUser = (Member) session.getAttribute("info");//로그인한 회원의 정보를 세션에서 가져와서 loginUser라는 변수에 넣기
			if(loginUser == null) { //만약 로그인한 회원 정보가 없다면?(로그인x상태라면) 로그인페이지로 리다이렉트
				return "redirect:/login.do"; 
			}
			
			System.out.println("multi객체 생성");
			//파일을 서버 폴더에 저장하는 객체	(240401 19:38이동)
			MultipartRequest multi = null;
			
			System.out.println("값 설정");
			int fileMaxSize = 10 * 1024 * 10000; //파일크기
			String savePath = request.getRealPath("/resources/img/saveimg"); //저장경로
			System.out.println(savePath);
			
			System.out.println("try catch  설정");
			try {
				multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
				//요청정보가진 request, 저장경로, 파일최대크기, 인코딩, 중복처리(파일명 같을 시 뒤에 숫자붙여주는 객체)
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("multi에 있는 값들 가져오기");
			String prod_name = multi.getParameter("prod_name");
			String prod_desc = multi.getParameter("prod_desc");
			String prod_img_path = multi.getFilesystemName("prod_img_path");
			String prod_price = multi.getParameter("prod_price");
			int prod_price_num = Integer.parseInt(prod_price);
			String seller_id = loginUser.getUser_id(); // seller_id에 로그인한 회원(loginUser)의 아이디 넣기

			
			// 욕설을 체크할 문자열 배열
			System.out.println("욕설 배열 생성");
		    String[] BadWordList = {"ㅅㅂ", "씨발"}; // 욕설 내용 확인 필요

		    
		    
		    // 먼저 set을 해줘야하잖아!!!!
		    System.out.println("product dto에 multi에 있는 값 넣어주기");
			prod.setProd_name(prod_name);
			prod.setProd_desc(prod_desc);
			prod.setProd_img_path(prod_img_path);
			prod.setProd_price(prod_price_num); //자영(0325):가격은 정수니까 문자열->정수 형변환 
			prod.setSeller_id(seller_id); // 로그인한 회원(loginUser)의 id를 product(DTO)의seller_id에 넣기
			
			System.out.println(prod.toString());//test용
		    
		    System.out.println("욕설 포함 확인 조건문");
		    // 욕설이 포함되어 있는지 확인
		    if (containsBadWords(prod.getProd_name(), prod.getProd_desc(), BadWordList)) {
		        // 욕설이 포함되어 있으면 다시 상품등록 폼으로 리다이렉트
		        return "redirect:/ProductForm.do";
		    }
		    
			// insert문 요청(욕설 및 비속어가 포함되지  경우)
			mapper.ProductInsert(prod);	
			
			//return "boardList";
			return "redirect:/ProductList.do";
		
	}
	
	/**********************************************************/
	
	
	// 추가 (240401 1954)
	// 욕설 체크 메서드
	private boolean containsBadWords(String prodName, String prodDesc, String[] badWordList) {
		 if (prodName == null || prodDesc == null || badWordList == null) {
		     System.out.println("욕설체크 메소드 null값일 경우");   
			 return false; // 또는 예외 처리를 할 수 있습니다.
		    }
		
		for (String badWord : badWordList) {
	        if (prodName.contains(badWord) || prodDesc.contains(badWord)) {
	            return true;
	        }
	    }
	    return false;
	}
	
	/**********************************************************/
	
	
	
	// AJAX 요청 처리 메소드
    @RequestMapping("/ajax/ProductInsert.do")
    public @ResponseBody String ajaxProductInsert(HttpServletRequest request, HttpSession session, Product prod) {
        // 요청 처리 및 데이터베이스 삽입 로직
        return "Product inserted successfully!";
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
		
		// 해당 게시글의 댓글들(list) 가져오기
		List<Reply> reply_list = mapper.replyList(prod_idx);
		model.addAttribute("reply_list", reply_list); //모델에 해당상품식별자(prod_idx)에 대한 댓글들 목록 저장
		
		
		
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
	
	
	//댓글작성(spring3에서 가져오기)
		@RequestMapping("/replyInsert.do")
		public String replyInsert(@RequestParam("prod_idx") int prod_idx,
								  @RequestParam("reply_content") String reply_content, 
								  HttpSession session, Reply reply) {
			System.out.println("댓글 작성 기능");
			
			
			// 세션에서 현재 로그인한 사용자 정보 가져오기
			Member loginUser = (Member) session.getAttribute("info");//로그인한 회원의 정보를 세션에서 가져와서 loginUser라는 변수에 넣기
			String reply_writer_id = loginUser.getUser_id(); //reply_writer_id에 로그인한 회원(loginUser)의 아이디 넣기
			
	        
	        reply.setProd_idx(prod_idx); //상품번호(식별자) 넣기
	        reply.setReply_content(reply_content); //댓글 내용 넣기
	        reply.setReply_writer_id(reply_writer_id); //reply dto의 reply_writer_id 에 로그인한 회원(loginUser)의 아이디(info.user_id) 넣기
	        
	        
			mapper.replyInsert(reply); //mapper에 댓글 넣는 기능 요청
			
			return "redirect:/ProductContent.do?prod_idx="+reply.getProd_idx();//댓글작성 완료 후 해당 상품번호의 상세보기 화면으로 이동 

		}

		// 내 상품 게시글 목록 모아보기
		@RequestMapping("/goMyProductList.do")
		public String goMyProductList(Model model ,HttpSession session, @RequestParam("user_id") String user_id) {
			System.out.println("내 게시글 목록으로 이동");
			
			return "redirect:/myProductList.do?user_id="+user_id; //goMyProductList.do로 이동돼서 리다이렉트해봄
		}
		
		
		@RequestMapping("/myProductList.do")
		public List<Product> myProductList(Model model ,HttpSession session, @RequestParam("user_id") String user_id) {
			System.out.println("내 게시글 목록으로 이동");

			// 세션에서 현재 로그인한 사용자 정보 가져오기
			Member loginUser = (Member) session.getAttribute("info");//로그인한 회원의 정보를 세션에서 가져와서 loginUser라는 변수에 넣기
			String seller_id = loginUser.getUser_id(); //reply_writer_id에 로그인한 회원(loginUser)의 아이디 넣기
			System.out.println(seller_id);
			// 로그인한 회원의 id를 seller_id에 넣어서 mapper한테 select 함수 요청하기 
			List<Product> my_prod_list = mapper.myProductList(seller_id);
			System.out.println(my_prod_list.size());
			model.addAttribute("my_prod_list", my_prod_list); //request
			
			return my_prod_list; //리스트 전달
		}
		
		// 게시글 목록
				@RequestMapping("/Postmanagement.do")
					public String Postmanagement(Model model) {
					System.out.println("상품 전체보기 기능");
					List<Product> list = mapper.Postmanagement();
					model.addAttribute("list",list);
								
					return"Postmanagement";
			}
					
				
				
				// 게시글 수정하는 페이지
				@RequestMapping("/ModifyingPosts.do")
				public String ModifyingPosts(@RequestParam("prod_idx") int prod_idx, Model model) {
					System.out.println("게시글수정 페이지");
					Product Modifying =mapper.ModifyingPosts(prod_idx);
					model.addAttribute("Modifying",Modifying);
					return "ModifyingPosts";
			}
				
				
				// 게시글 정보 삭제하는 기능!!
					@RequestMapping("/Delete.do")
					public String Delete(@RequestParam("prod_idx") int prod_idx) {
						System.out.println("게시글 삭제 기능");		
						mapper.Delete(prod_idx);
						return "redirect:/Postmanagement.do";
		}
		
					
					//검색 기능
					@RequestMapping("/CombinedSearch.do")
					public String combinedSearch(@RequestParam("keyword") String keyword, Model model) {
					    // 상품 제목과 내용으로 검색하는 로직을 수행
					    List<Product> searchResult = mapper.combinedSearch(keyword);

					    // 검색 결과를 모델에 담아 productList.jsp로 전달
					    model.addAttribute("searchResult", searchResult);

					    return "searchResult"; // productList.jsp로 이동
					}
	
	
	
}
