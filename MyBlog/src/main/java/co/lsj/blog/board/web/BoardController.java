package co.lsj.blog.board.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.lsj.blog.board.service.BoardService;
import co.lsj.blog.board.service.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardDao;
	
	@GetMapping("/boardList.do")
	public String boardList(Model model) {
		model.addAttribute("boards", boardDao.boardList());
		return "board/boardList";
	}
	
	@GetMapping("/boardForm.do")
	public String boardForm(Model model) {
		return "board/boardForm";
	}
	
	@RequestMapping("/boardInsert.do")
	@ResponseBody
	public String boardInsert(Model model, BoardVO vo) {
		System.out.println(vo.getSubject());
		int n = boardDao.boardInsert(vo);
		String result = "F";
		if(n != 0) {
			result = "T";
		}
		return result;
	}
	
	@PostMapping("/boardDelete.do")
	@ResponseBody
	public String boardDelete(Model model, @Param("no") int no, HttpSession session) {
		System.out.println(no);
		int n = boardDao.boardDelete(no);
		String result = "F";
		if(n != 0) {
			result = "T";
		}
		return result;
	}
	
	@RequestMapping("/daily.do")
	public String daily(Model model) {
		return "board/daily";
	}
	
	@RequestMapping("/gallery.do")
	public String gallery(Model model) {
		return "board/gallery";
	}
	
	@RequestMapping("/studyjava.do")
	public String studyjava(Model model) {
		return "board/studyjava";
	}
}
