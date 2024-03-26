package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Reply {
 
	private int idx;
	private int boardnum;
	private String writer;
	private String content;
	private String indate;
 
}
