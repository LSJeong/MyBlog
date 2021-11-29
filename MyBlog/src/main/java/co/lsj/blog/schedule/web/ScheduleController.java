package co.lsj.blog.schedule.web;

import java.util.ArrayList;
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

import co.lsj.blog.schedule.service.ScheduleService;
import co.lsj.blog.schedule.service.ScheduleVO;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleDao;
	

	@GetMapping("/calender.do")
	public String calender() {
		return "study/calender";
	}
	
	@PostMapping("/scheduleInsert.do")
	@ResponseBody
	public String scheduleInsert(Model model, HttpServletRequest request, ScheduleVO vo) {
		vo.setTitle(request.getParameter("title"));
		vo.setStart_date(request.getParameter("start"));
		vo.setEnd(request.getParameter("end"));
		int insertOK = scheduleDao.scheduleInsert(vo);
		String message;
		if(insertOK > 0) {
			message = "OK";
		}else {
			message = "NG";
		}
		return message;
	}
	
	@RequestMapping("/scheduleList.do")
	@ResponseBody
	public List<Map<String, String>> scheduleList(){	
		List<Map<String, String>> list = null;
		list = new ArrayList<>();
		
		List<ScheduleVO> list2 = scheduleDao.scheduleList();
		for(ScheduleVO sc : list2) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", sc.getTitle());
			map.put("start", sc.getStart_date());
			map.put("end", sc.getEnd());
			
			list.add(map);
			
		}
		return list;
	}
	
	@RequestMapping("/scheduleDelete.do")
	@ResponseBody
	public String scheduleDelete(ScheduleVO vo) {
		int n = scheduleDao.scheduleDelete(vo);
		String result = "F";
		if(n != 0) {
			result = "T";
		}
		return result;
	}
}
