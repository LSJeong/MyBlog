package co.lsj.blog.daily.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import co.lsj.blog.daily.service.DailyMapper;
import co.lsj.blog.daily.service.DailyService;
import co.lsj.blog.daily.service.DailyVO;

@Repository("dailyDao")
public class DailyServiceImpl implements DailyService{
	@Autowired
	private DailyMapper map;
	
	@Override
	public List<DailyVO> dailyList() {
		return map.dailyList();
	}
	
	@Override
	public int dailyDelete(int dvno) {
		return map.dailyDelete(dvno);
	}

	@Override
	public int dailyInsert(DailyVO vo) {
		return map.dailyInsert(vo);
	}

	@Override
	public int dailyUpdate(DailyVO vo) {
		return map.dailyUpdate(vo);
	}

	@Override
	public DailyVO dailySelect(int no) {
		return map.dailySelect(no);
	}

}
