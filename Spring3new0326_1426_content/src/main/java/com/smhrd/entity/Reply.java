package com.smhrd.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Reply {
 
	private int reply_idx; // 한 상품 내의 댓글 번호
	private int prod_idx; //해당 상품 번호
	private String reply_content; // 댓글 내용
	private String reply_writer_nm; // 댓글 작성자 닉네임
	private String reply_writer_id; // 댓글 작성자 id
	private Timestamp replied_at; // 각 댓글작성 일시
	private String seller_id; // 판매자 id //딱히 없어도 될 것 같기는 함
	
}
