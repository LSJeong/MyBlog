package co.lsj.blog.schedule.service;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
	int scheduleInsert(ScheduleVO vo);
	List<Map<String,String>> scheduleList();
}
