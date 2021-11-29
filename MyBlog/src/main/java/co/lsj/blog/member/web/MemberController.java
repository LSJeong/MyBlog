package co.lsj.blog.member.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.lsj.blog.member.service.MemberService;
import co.lsj.blog.member.service.MemberVO;


@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	
	@PostMapping("/loginCheck.do")
	@ResponseBody
	public String memberLogin(MemberVO vo, Model model, HttpSession session) {
		String result = "F";

		vo = memberDao.memberSelect(vo);
		
		if(vo != null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("author", vo.getAuthor());
			
			result = "T";
		}
		return result;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
	        session.invalidate();
	        return "redirect:/home.do";
	    }
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@PostMapping("/memberJoin.do")
	@ResponseBody
	public String memberJoin(Model model, MemberVO vo) {
		int n = memberDao.memberInsert(vo);
		String chk = "0";
		if(n != 0) {
			chk = "1";
		}
		return chk;
	}
	
	@PostMapping("/ajaxIdCheck.do")
	@ResponseBody
	public String idCheck(Model model, @Param("id") String id) {
		boolean b = memberDao.memberIdCheck(id);
		String chk = "0";
		if(b) {
			chk = "1";
		}
		return chk;
	}
}
