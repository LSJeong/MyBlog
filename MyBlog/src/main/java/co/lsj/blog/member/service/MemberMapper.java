package co.lsj.blog.member.service;

public interface MemberMapper {
	int memberInsert(MemberVO vo);
	MemberVO memberSelect(MemberVO vo);
	boolean memberIdCheck(String id);
}
