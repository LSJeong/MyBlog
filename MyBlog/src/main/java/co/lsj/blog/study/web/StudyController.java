package co.lsj.blog.study.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.lsj.blog.board.service.BoardService;
import co.lsj.blog.study.service.StudyService;
import co.lsj.blog.study.service.StudyVO;

@Controller
public class StudyController {
	@Autowired
	private StudyService studyDao;

	@GetMapping("/studyList.do")
	public String studyList(Model model, HttpServletRequest request) {

		List<Map<String, Integer>> map = studyDao.studyList();
		model.addAttribute("studys", map);
		System.out.println(model.getAttribute("studys"));
		return "study/chart";

	}

	@RequestMapping("/studyJavaList.do")
	public String studyJavaList(Model model) {
		String course = "JAVA";
		model.addAttribute("studies", studyDao.studySelectList(course));
		return "study/studyjava";
	}

	@RequestMapping("/studyHCList.do")
	public String studyHCList(Model model) {
		String course = "HTML/CSS";
		model.addAttribute("studies", studyDao.studySelectList(course));
		return "study/studyHC";
	}

	@RequestMapping("/studyDelete.do")
	@ResponseBody
	public String studyDelete(Model model, @Param("studyno") int studyno) {
		int n = studyDao.studyDelete(studyno);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	@RequestMapping("/studyForm.do")
	public String studyForm() {
		return "study/studyForm";
	}

	@PostMapping("/studyInsert.do")
	@ResponseBody
	public String sutdyInsert(Model model, StudyVO vo) {
		int n = studyDao.studyInsert(vo);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}
}
