package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.smhrd.entity.Member;

@Mapper
public interface MemberMapper {
	
	// 회원가입 기능
	public void join(Member vo);
	
	//아이디 중복 체크 기능
	public Member findDuplicate(String user_id);

	// 회원 로그인 기능
	public Member login(Member vo);

	// 학교정보, 학생증 업로드 기능
	public void UpdateSchoolInfo(Member vo);

	public List<Member> UserInformation();

	public Member UserContent(String user_id);

	public void userInfoChange(Member vo);

	public Member PostContent(String user_id);

	public List<Member> AdministratorList();

	
	public void memberOut(String user_id);
	

}
