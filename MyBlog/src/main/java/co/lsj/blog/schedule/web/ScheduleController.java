package co.lsj.blog.schedule.web;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.lsj.blog.schedule.service.ScheduleService;
import co.lsj.blog.schedule.service.ScheduleVO;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleDao;
	
	@PostMapping("/scheduleInsert.do")
	@ResponseBody
	public String scheduleInsert(Model model, HttpServletRequest request, ScheduleVO vo) {
		vo.setTitle(request.getParameter("title"));
		vo.setStart_date(request.getParameter("start"));
		vo.setEnd_date(request.getParameter("end"));
		int insertOK = scheduleDao.scheduleInsert(vo);
		String message;
		if(insertOK > 0) {
			message = "OK";
		}else {
			message = "NG";
		}
		return message;
	}
	
//	@RequestMapping("/scheduleList.do")
//	@ResponseBody
//	public List<Map<String,String>> scheduleList(Model model, ScheduleVO vo){
//		List<Map<String,String>> schedules = new ArrayList<Map<String,String>>();
//		schedules = scheduleDao.scheduleList();
//		for(int i=0;i<schedules.size();i++) {
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("title", vo.getString("title"));
//			map.put("start", vo.getString("start_date"));
//			map.put("end", vo.getString("end_date"));
//			schedules.add(map);
//		}
//		return schedules;
//	}
}
