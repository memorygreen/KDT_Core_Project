package com.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.smhrd.entity.Member;

@Mapper
public interface MemberMapper {

	public void join(Member vo);

	public void findDuplicate(String user_id);

	public Member login(Member vo);

	



	

	

}
