package co.lsj.blog.daily.service;

import java.util.List;

public interface DailyMapper {
	List<DailyVO> dailyList();
	int dailyDelete(int dvno);
}
