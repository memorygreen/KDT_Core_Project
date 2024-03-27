package com.smhrd.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Member {
	private String user_id;
	private String user_pw;
	private String user_phone;
	private String user_sc_nm;
	private String user_sc_img;
	private String user_status;
	private Date joined_at;
	private char user_role;

//	public Member(String id, String pw, String phone) {
//		super();
//		this.id = id;
//		this.pw = pw;
//		this.phone = phone;
//	}

	

}
