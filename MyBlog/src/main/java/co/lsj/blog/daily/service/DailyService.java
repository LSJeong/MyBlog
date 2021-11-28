package co.lsj.blog.daily.service;

import java.util.List;

public interface DailyService {
	List<DailyVO> dailyList();
	int dailyDelete(int dvno);
}
