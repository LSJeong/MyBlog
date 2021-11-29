package co.lsj.blog.daily.web;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.lsj.blog.daily.service.DailyService;

@Controller
public class DailyController {
	@Autowired
	private DailyService dailyDao;
	
	@RequestMapping("/dailyList.do")
	public String dailyList(Model model) {
		model.addAttribute("dailys", dailyDao.dailyList());
		System.out.println(dailyDao.dailyList());
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
	
	@RequestMapping("/chart.do")
	public String chart(Model model) {
		
		return "study/chart";
	}
	
	@RequestMapping("/dailyForm.do")
	public String dailyForm() {
		return "daily/dailyForm";
	}
}
