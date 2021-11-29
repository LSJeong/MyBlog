package co.lsj.blog.daily.service;

import java.util.List;

public interface DailyMapper {
	List<DailyVO> dailyList();
	DailyVO dailySelect(int no);
	int dailyDelete(int dvno);
	int dailyInsert(DailyVO vo);
	int dailyUpdate(DailyVO vo);
}
