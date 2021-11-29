package co.lsj.blog.daily.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.lsj.blog.daily.service.DailyService;
import co.lsj.blog.daily.service.DailyVO;

@Controller
public class DailyController {
	@Autowired
	private DailyService dailyDao;
	
	@RequestMapping("/dailyList.do")
	public String dailyList(Model model) {
		model.addAttribute("dailys", dailyDao.dailyList());
		return "daily/dailyList";
	}
	
	@PostMapping("/dailyDelete.do")
	@ResponseBody
	public String dailyDelete(Model model, @Param("dailyno") int dailyno) {
		int n = dailyDao.dailyDelete(dailyno);
		String result = "F";
		if(n != 0) {
			result = "T";
		}
		return result;
	}
	
	
	@RequestMapping("/dailyForm.do")
	public String dailyForm() {
		return "daily/dailyForm";
	}
	
	@PostMapping("/dailyInsert.do")
	@ResponseBody
	public String dailyInsert(Model model, DailyVO vo) {
		int n = dailyDao.dailyInsert(vo);
		String result = "F";
		if(n != 0) {
			result = "T";
		}
		return result;
	}
	
	@GetMapping("/dailyUpdateForm.do")
	public String dailyUpdateForm(Model model, @Param("dailyno") int dailyno) {
		System.out.println(dailyno);
		model.addAttribute("dailys", dailyDao.dailySelect(dailyno));
		return "daily/dailyUpdateForm";
	}
	
	@PostMapping("/dailyUpdate.do")
	@ResponseBody
	public String dailyUpdate(Model model, DailyVO vo) {
		int n = dailyDao.dailyUpdate(vo);
		String result = "F";
		if(n != 0) {
			result = "T";
		}
		return result;
	}
}
