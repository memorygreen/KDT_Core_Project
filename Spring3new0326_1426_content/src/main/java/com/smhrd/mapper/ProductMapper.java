package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.Member;
import com.smhrd.entity.Product;
import com.smhrd.entity.Reply;

@Mapper
public interface ProductMapper {
	// MyBatis와 Spring 사이를 연결해 실행하는 Class
	
	// 상품 전체목록 조회
	public List<Product> ProductList();
	
	// 새로운 상품 등록
	public void ProductInsert(Product prod);
	
	// 상품 상세보기
	public Product ProductContent(int prod_idx);
	
	// 상품 조회수 올리기
	public void ProductCount(int prod_idx);
	
	
	// 상품 상태 거래중으로 바꾸는 기능
	public void productStatusChange(int prod_idx);

	
	
	
	
	/***********************************************/
	
	// 댓글 작성
	public void replyInsert(Reply vo);

	public List<Reply> replyList(int idx);

	public void join(Member vo);

	public Member login(Member vo);
	
	
	
	






	
	
}
