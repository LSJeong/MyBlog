package co.lsj.blog.member.service;

public interface MemberService {
	int memberInsert(MemberVO vo);
	MemberVO memberSelect(MemberVO vo);
	boolean memberIdCheck(String id);
}
