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
	
	@RequestMapping("/dailyList.do")
	@Override
	public List<DailyVO> dailyList() {
		return map.dailyList();
	}
	
	@RequestMapping("/dailyDelete.do")
	@Override
	public int dailyDelete(int dvno) {
		return map.dailyDelete(dvno);
	}

}
