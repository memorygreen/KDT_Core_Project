package com.smhrd.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ Data
@ AllArgsConstructor
@ NoArgsConstructor
@ ToString
public class Product {

	// 상품 식별자 
    private int  prod_idx;

    // 상품 명 
    private String prod_name;

    // 상품 설명 
    private String prod_desc;

    // 상품 가격 
    private int prod_price;

    // 판매자 아이디 
    private String seller_id;

    // 상품 조회수 
    private int prod_views;

    // 상품 신고수 
    private int prod_rpt_cnt;

    // 상품 등록일시 
    private Timestamp created_at;

    // 상품 판매완료일시 
    private Timestamp prod_sold_dt;

    // 상품 사진경로 
    private String prod_img_path;

    // 상품 상태 
    private String prod_status;
	
	
}
