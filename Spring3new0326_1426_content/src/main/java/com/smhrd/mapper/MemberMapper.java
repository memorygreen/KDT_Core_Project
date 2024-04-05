package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.smhrd.entity.Member;

@Mapper
public interface MemberMapper {

	public void join(Member vo);

	public Member findDuplicate(String user_id);

	public Member login(Member vo);

	public void UpdateSchoolInfo(Member vo);

	public List<Member> UserInformation();

	public Member UserContent(String user_id);

	public void userInfoChange(Member vo);

	public Member PostContent(String user_id);

	public List<Member> AdministratorList();

	
	public void memberOut(String user_id);
	

}
