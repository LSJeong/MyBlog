package co.lsj.blog.schedule.service;

import java.util.List;

public interface ScheduleMapper {
	int scheduleInsert(ScheduleVO vo);
	List<ScheduleVO> scheduleList();
	int scheduleDelete(ScheduleVO vo);
}
