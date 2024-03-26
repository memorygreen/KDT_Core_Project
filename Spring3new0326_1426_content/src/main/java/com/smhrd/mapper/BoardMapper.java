package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.entity.Board;
import com.smhrd.entity.Member;
import com.smhrd.entity.Reply;

@Mapper
public interface BoardMapper {
	// MyBatis와 Spring 사이를 연결해 실행하는 Class
	
	public List<Board> boardList();
	
	public Board boardContent(int idx);

	public void boardInsert(Board vo);
	
	//자영풀이(240312 15:52)
	//public void boardDelete(int idx);
	
	//동혁씨 도움
	//public void boardDelete(Board vo);
	
	
	//쌤풀이
	public void boardDelete(int idx);
	
	//자영 실습(240313) //게시판 수정하기버튼
//	public void boardUpdate(Board vo); //이게 맞다
//	public void boardUpdate(int idx); //idx는 수정자체가 안됨 걍 초기 그대로 =>그 이유는 보드 컨트롤러에서 매개변수 4개 받아와야했기때문에!! idx만 받아오면 안됨 title,content, writer 받아와야함
	
	//쌤풀이
	public void boardUpdate(Board vo);
	
	
	// 자영실습 - 조회수
	//public void plusCount(int idx);

	public void boardCount(int idx);
	
	// 댓글 작성
	public void replyInsert(Reply vo);

	public List<Reply> replyList(int idx);

	public void join(Member vo);

	public Member login(Member vo);
	
	
}
