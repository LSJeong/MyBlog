package co.lsj.blog.schedule.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.lsj.blog.schedule.service.ScheduleMapper;
import co.lsj.blog.schedule.service.ScheduleService;
import co.lsj.blog.schedule.service.ScheduleVO;

@Repository("scheduleDao")
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleMapper map;
	
	@Override
	public int scheduleInsert(ScheduleVO vo) {
		return map.scheduleInsert(vo);
	}

	@Override
	public List<ScheduleVO> scheduleList() {
		return map.scheduleList();
	}

	@Override
	public int scheduleDelete(ScheduleVO vo) {
		return map.scheduleDelete(vo);
	}

}
